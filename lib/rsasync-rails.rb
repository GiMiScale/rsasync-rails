require 'rsasync-rails/version'

module RSAsync
  module Rails
    if ::Rails.version < '3.1'
      require 'rsasync-rails/railtie'
    else
      require 'rsasync-rails/engine'
    end
  end
end
