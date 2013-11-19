# Browser Details

Have you ever had the conversation:

> **Your site doesn't work.**  
> What browser are you using and do you have Javascript enabled?
>
> **What's a browser?**  
> :unamused:

Browser Details makes that problem disappear by capturing a user's browser
details in your logs. You will get the exact browser version they are using and
their OS dumped into your logs, and when possible you'll get whether they have
JS enabled too. All entirely unobtrustively.

You may never need to speak to a user ever again!

### Before

    Started GET "/" for 127.0.0.1 at 2012-12-26 21:25:14 +0000
    Processing by HomeController#index as HTML
    ...
    Started POST "/posts" for 127.0.0.1 at 2012-12-26 21:25:19 +0000
    Processing by PostsController#create as HTML
    ...

### After

    Started GET "/" for 127.0.0.1 at 2012-12-26 21:25:14 +0000
    Chrome 23.0.1271.95 (Macintosh, Intel Mac OS X 10_7_5)
    Processing by HomeController#index as HTML
    ...
    Started POST "/posts" for 127.0.0.1 at 2012-12-26 21:25:19 +0000
    Chrome 23.0.1271.95 (Macintosh, Intel Mac OS X 10_7_5), JS enabled
    Processing by PostsController#create as HTML
    ...

### How?

Browser Details is a Rack Middleware that logs information about the browser
used to make a request. When possible this includes whether the browser has
Javascript enabled or not.

## Installation

Add this line to your application's Gemfile:

    gem 'browser_details'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install browser_details

### Rails

The middleware will be installed automatically by the Railtie.

To enable Browser Details to report whether the browser has Javascript enabled
for form submissions you must add the following line to your
`app/assets/javascripts/application.js`:

    //= require browser_details

Browser Details requires jQuery to be present as it works by checking if the
`utf8` form element has been changed to a large tick from a small tick by the
Browser Details Javascript.

If this script is not added then all browsers will report that Javascript is
disabled.

### Other Rack applications

To use the Browser Details middleware you must add the line:

    use BrowserDetails

Wherever it may be appropriate for your application.

The Javascript detection is currently reliant on Rails. If you would like your
application to be able to detect whether Javascript is enabled too, please
create an issue, or even better open a pull request.

### Custom usage

If you want to use the message elsewhere, you can request the message directly:

```ruby
details = BrowserDetails.message(request)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
