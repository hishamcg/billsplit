class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
