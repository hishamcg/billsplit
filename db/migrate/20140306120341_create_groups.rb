class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :groupname
      t.integer :userid
      t.string :friendid

      t.timestamps
    end
  end
end
