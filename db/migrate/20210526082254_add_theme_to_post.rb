class AddThemeToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :theme, :integer, null: false, default: 0
  end
end
