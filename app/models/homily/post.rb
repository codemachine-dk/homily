module Homily
  class Post < ApplicationRecord
    belongs_to :author, polymorphic: true
  end
end
