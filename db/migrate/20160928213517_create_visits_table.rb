class CreateVisitsTable < ActiveRecord::Migration
  def change
    drop_table :visit

    create_table :visits do |t|
      t.integer :visitor_id, null: false
      t.integer :page_id, null: false
      t.timestamps
    end

    add_index :visits, :visitor_id
    add_index :visits, :page_id
  end
end
