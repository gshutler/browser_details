# encoding: UTF-8

require "check-js/version"
require "useragent"

module Check
  module Js

    class Middleware
      if defined?(Hatchet)
        include Hatchet

        LOGGER = :hatchet
      elsif defined?(Rails)
        LOGGER = :rails
      else
        LOGGER = :rack
      end

      def initialize(app)
        @app = app
      end

      def call(env)
        message = []
        if agent_string = env['HTTP_USER_AGENT']
          agent = UserAgent.parse(agent_string)
          message << "#{agent.browser} #{agent.version} (#{agent.platform})"
        end

        request = Rack::Request.new(env)

        if request['utf8']
          message << if request['utf8'] == '✓'
            'JS disabled'
          else
            'JS enabled'
          end
        end

        unless message.empty?
          log_message(env, message.join(', '))
        end

        @app.call(env)
      end

      def log_message(env, message)
        case LOGGER
        when :hatchet
          log.info(message)
        when :rails
          Rails.logger.info(message)
        when :rack
          if env['rack.logger']
            env['rack.logger'].info(message)
          end
        end
      end

    end

    class Railtie < Rails::Railtie
      initializer "check-js.insert_middleware" do |app|
        app.config.middleware.use Check::Js::Middleware
      end

      config.before_configuration do |app|
        app.config.assets.paths << File.join(File.dirname(__FILE__), 'check-js', 'assets')
      end
    end

  end
end
