class AddForeignKeyConstraintToBookmarks < ActiveRecord::Migration[6.0]
  def change
    unless foreign_key_exists?(:bookmarks, :movies)
      add_foreign_key :bookmarks, :movies, on_delete: :restrict
    end
  end

  def foreign_key_exists?(from_table, to_table)
    foreign_keys(from_table).any? { |fk| fk.to_table == to_table.to_s }
  end
end
