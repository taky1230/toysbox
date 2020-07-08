class AddUserIdToToys < ActiveRecord::Migration[5.2]
  def up
    execute "DELETE FROM toys;"
    add_reference :toys, :user, null: false, index: true
  end

  def down
    remove_reference :toys, :user, index: true
  end
  
end
