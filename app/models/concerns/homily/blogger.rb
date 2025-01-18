module Homily
  module Blogger
    extend ActiveSupport::Concern

    included do
      has_many :blog_posts, as: :author, class_name: "Homily::Post"
    end
  end
end
