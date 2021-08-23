class ChangeNeighNullable < ActiveRecord::Migration[6.0]
  def change
  	change_column_null :addresses, :neighborhood_id, true
  end
end
