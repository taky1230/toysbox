class ChangeToysNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :toys, :name, false
  end
end
