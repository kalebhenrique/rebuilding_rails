# frozen_string_literal: true

require_relative 'rebuilding_rails/version'
require 'rulers/array'

module RebuildingRails
  class Error < StandardError; end

  class Application
    def call(_env)
      [200, { 'content-type' => 'text/html' },
       ['Hello from Rebuilding Rails']]
    end
  end
end
