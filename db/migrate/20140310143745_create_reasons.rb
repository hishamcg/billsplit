class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.integer :group_id
      t.string :reason_text , :default => "some reason"
      t.string :spender_name
      t.decimal :value

      t.timestamps
    end
  end
end
