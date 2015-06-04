class AddUserToUserRole < ActiveRecord::Migration
  def change
    add_column :user_roles, :user_id, :uuid
    add_reference :user_roles, :user, index: true, foreign_key: true
  end
end
