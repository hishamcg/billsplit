class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :user_from
      t.integer :user_to
      t.belongs_to :group
      t.decimal :value , :default => 0

      t.timestamps
    end
  end
end
