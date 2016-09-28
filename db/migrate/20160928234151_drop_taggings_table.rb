class DropTaggingsTable < ActiveRecord::Migration
  def change
    drop_table :taggings_tables
  end
end
