require 'rack/test'

module Rack
  module Shell
    class Session
      include Rack::Test::Methods
      attr_reader :app

      def initialize(app)
        @app = app
      end

      def env
        ENV['RACK_ENV']
      end
    end
  end
end
