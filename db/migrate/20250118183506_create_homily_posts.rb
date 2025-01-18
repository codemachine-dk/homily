class CreateHomilyPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :homily_posts do |t|
      t.references :author, polymorphic: true, null: false
      t.string :title, null: false
      t.string :description
      t.datetime :published_at

      t.timestamps
    end
  end
end
