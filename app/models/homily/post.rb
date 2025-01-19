module Homily
  class Post < ApplicationRecord
    belongs_to :author, polymorphic: true

    has_rich_text :body
  end
end
