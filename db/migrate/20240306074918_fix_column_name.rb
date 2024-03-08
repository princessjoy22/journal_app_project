class FixColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :tile, :title
  end
end
