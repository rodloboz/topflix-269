class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.text :synopsis
      t.references :director, foreign_key: true
      t.string :theme_color
      t.string :genre
      t.float :rating, precision: 5, scale: 2
      t.string :cover
      t.string :video_src

      t.timestamps
    end
  end
end
