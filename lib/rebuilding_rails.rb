# frozen_string_literal: true

require_relative 'rebuilding_rails/version'
require 'rebuilding_rails/routing'

module RebuildingRails
  class Error < StandardError; end

  class Application
    def call(env)
      return [404, { 'content-type' => 'text/html' }, []] if env['PATH_INFO'] == '/favicon.ico'

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, { 'content-type' => 'text/html' },
       [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    attr_reader :env
  end
end
