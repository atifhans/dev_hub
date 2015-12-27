class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :type_dev
      t.string :status
      t.text :log
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :devices, [:user_id, :created_at]
  end
end
