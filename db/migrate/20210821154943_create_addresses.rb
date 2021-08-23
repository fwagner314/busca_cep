class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :zipcode, null: false, index: { unique: true }
      t.string :address

      t.timestamps
    end
  end
end
