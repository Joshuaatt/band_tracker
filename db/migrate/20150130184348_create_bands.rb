class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.column :band_name, :string

      t.timestamps
    end
  end
end
