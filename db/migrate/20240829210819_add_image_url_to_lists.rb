class AddImageUrlToLists < ActiveRecord::Migration[7.2]
  def change
    add_column :lists, :image_url, :string
  end
end
