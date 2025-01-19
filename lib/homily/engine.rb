require "importmap-rails"

module Homily
  class Engine < ::Rails::Engine
    isolate_namespace Homily
    
    initializer "homily.assets" do |app|
      if app.config.respond_to?(:assets)
        app.config.assets.paths << root.join("app/assets/stylesheets")
        app.config.assets.paths << root.join("app/javascript")
        app.config.assets.precompile += %w[homily_manifest]
      end
    end
    
    initializer "homily.importmap", before: "importmap" do |app|
      Homily.importmap.draw root.join("config/importmap.rb")
      Homily.importmap.cache_sweeper watches: root.join("app/javascript")
    
      ActiveSupport.on_load(:action_controller_base) do
        before_action { Homily.importmap.cache_sweeper.execute_if_updated }
      end
    end
  end
end
