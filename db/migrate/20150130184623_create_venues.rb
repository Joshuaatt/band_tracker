class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.column :venue_name, :string

      t.timestamps
    end
  end
end
