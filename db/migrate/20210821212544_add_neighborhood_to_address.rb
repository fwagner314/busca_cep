class AddNeighborhoodToAddress < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :neighborhood, null: false, foreign_key: true
  end
end
