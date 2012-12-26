# -*- encoding: utf-8 -*-

require "browser_details/version"
require "useragent"

class BrowserDetails

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

    if env['HTTP_USER_AGENT']
      agent = UserAgent.parse(env['HTTP_USER_AGENT'])

      agent_details = [agent.browser]
      agent_details << 'Mobile' if agent.mobile?
      agent_details << agent.version
      agent_details << "(#{agent.platform})"

      message << agent_details.join(' ')
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

require 'browser_details/railtie' if defined?(Rails)
