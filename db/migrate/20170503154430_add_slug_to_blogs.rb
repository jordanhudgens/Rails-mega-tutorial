class AddSlugToBlogs < ActiveRecord::Migration[5.0]
  # commented out, because additional operations were breaking the database by leaving pending migrations, trying to create a column that already exists
  # def change
  #   add_column :blogs, :slug, :string
  #   add_index :blogs, :slug, unique: true
  # end
end
