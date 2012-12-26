class BrowserDetails

  # Public: Railtie for initializing the BrowserDetails middleware and making
  # the browser_details.js file available.
  #
  class Railtie < Rails::Railtie
    initializer "browser_details.insert_middleware" do |app|
      app.config.middleware.use BrowserDetails
    end

    config.before_configuration do |app|
      app.config.assets.paths << File.join(File.dirname(__FILE__), 'assets')
    end
  end

end
