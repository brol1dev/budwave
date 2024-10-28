class CreateUserWeights < ActiveRecord::Migration[7.2]
  def change
    create_table :user_weights do |t|
      t.decimal :weight_kg, precision: 5, scale: 2, null: false
      t.integer :user_id, null: true
      t.date :date, null: false

      t.timestamps
    end

     # Adding an index to prevent duplicate entries for the same day
     add_index :user_weights, [ :user_id, :date ], unique: true
  end
end
