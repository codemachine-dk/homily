require "homily/version"
require "homily/engine"

module Homily
  mattr_accessor :importmap, default: Importmap::Map.new
end
