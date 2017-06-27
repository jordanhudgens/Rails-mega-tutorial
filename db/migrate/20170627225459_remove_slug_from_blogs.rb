class RemoveSlugFromBlogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :blogs, :slug, :string
  end
end
