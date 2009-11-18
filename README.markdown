# racksh

## About

**racksh** (Rack::Shell) is a console for Rack based ruby web applications.

It's like Rails' _script/console_ or Merb's _merb -i_, but for any app built on Rack. You can use it to load application 
environment for Rails, Merb, Sinatra, Camping, Ramaze or your own framework provided there is _config.ru_ file in app's root 
directory.

It's purpose is to allow developer to introspect his application and/or make some initial setup. You can for example run 
_DataMapper.auto_migrate!_ or make a request to _/users/666_ and check response details. It's mainly aimed at apps that don't 
have console-like component (ie. app built with Sinatra) but all frameworks can benefit from interactive Rack stack and request
introspection.

## How it works?

It loads whole application environment like Rack web server, but instead of running the app it starts _irb_ session. 
Additionally it exposes _$rack_ variable which allows you to make simulated HTTP requests to your app.

## Installation

    gem install racksh -s http://gemcutter.org

## Usage

### Starting racksh

To start racksh session run following inside rack application directory (containing config.ru file):

    % racksh
    Rack::Shell v0.9.4 started in development environment.
    >>

Specifying location of config.ru:

    % CONFIG_RU=~/projects/foobar/config.ru racksh

Executing ruby code inside application environment and printing results:

    % racksh Order.all
    % racksh "Order.first :created_at => Date.today"

Specifying Rack environment (default is development):

    % RACK_ENV=production racksh
    Rack::Shell v0.9.4 started in production environment.
    >>
    
### Making simulated HTTP requests to your app

    % racksh
    Rack::Shell v0.9.4 started in development environment.
    >> $rack.get "/"
    => #<Rack::MockResponse:0xb68fa7bc @body="<html>...", @headers={"Content-Type"=>"text/html", "Content-Length"=>"1812"}, @status=200, ...

_$rack_ variable contains following methods (thanks to [rack-test](http://github.com/brynary/rack-test) gem):

    # make GET request
    $rack.get uri, params, env
    
    # make POST request
    $rack.post uri, params, env
    
    # make PUT request
    $rack.put uri, params, env
    
    # make DELETE request
    $rack.delete uri, params, env
    
    # make HEAD request
    $rack.head uri, params, env
    
    # make custom request
    $rack.request uri, params, env
    
    # set HTTP header
    $rack.header name, value
    
    # set credentials for Basic Authorization
    $rack.basic_authorize username, password
    
    # set credentials for Digest Authorization
    $rack.digest_authorize username, password
    
    # follow redirect from previous request
    $rack.follow_redirect!
    
    # last request object
    $rack.last_request

    # last response object
    $rack.last_response

    # access your Rack app
    $rack.app

    # name of environment
    $rack.env
    
Check [test.rb from brynary's rack-test](http://github.com/brynary/rack-test/blob/master/lib/rack/test.rb) for implementation of 
above methods.
 
Examples:

    $rack.get "/", {}, { 'REMOTE_ADDR' => '123.45.67.89' }
    $rack.header "User-Agent", "Firefox"
    $rack.post "/users", :user => { :name => "Jola", :email => "jola@misi.ak" }

## Bugs & feature requests

Please report bugs and/or feature requests on the github issue tracker for the project located [here](http://github.com/sickill/racksh/issues).

## Authors

 * Marcin Kulik - [sickill.net](http://sickill.net/)

