racksh
======

About
-----

**racksh** (pronounced _rack shell_) is a console for Rack based ruby web applications. 

It's like Rails' _script/console_ or Merb's _merb -i_, but for any app built on Rack. You can use it to load application environment for Rails, Merb, Sinatra, Camping, Ramaze or your own framework provided there is _config.ru_ file in app's root directory. 

It's purpose is to allow developer to introspect his application and/or make some initial setup, ie. running _DataMapper.auto_migrate!_. It's mainly aimed at apps that don't have similar facility (like Sinatra) but can be used without problems with Merb or Rails apps.

How it works?
-------------

It loads whole application environment like Rack web server, but it doesn't run the app. Simply, methods like _use_ or _run_ which are normally invoked on Rack::Builder instance are being stubbed.

Installation
------------

    gem install racksh -s http://gemcutter.org

Usage
-----

To open console run following inside rack application directory (containing config.ru file):

    racksh

Specifying location of config.ru:

    CONFIG_RU=~/projects/foobar/config.ru racksh

Executing ruby code inside application environment and printing results:

    racksh Order.all
    racksh "Order.first :created_at => Date.today" 

Specifying Rack environment (default is development):

    RACK_ENV=production racksh

Bugs & feature requests
---------------------------------

Please report bugs and/or feature requests on the github issue tracker for the project located [here](http://github.com/sickill/racksh/issues).

Authors
-------

 * Marcin Kulik - [sickill.net](http://sickill.net/)

