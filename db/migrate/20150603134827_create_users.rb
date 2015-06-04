class CreateUsers < ActiveRecord::Migration
  has_many :user_roles, :dependent => :destroy
  def change
    enable_extension 'uuid-ossp'
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
