class CreateVisitTable < ActiveRecord::Migration
  def change
    create_table :visit do |t|
      t.integer :visitor_id, null: false
      t.integer :page_id, null: false
      t.timestamps
    end

    add_index :visit, :visitor_id
    add_index :visit, :page_id
  end
end
