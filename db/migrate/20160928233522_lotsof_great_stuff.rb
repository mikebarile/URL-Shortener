class LotsofGreatStuff < ActiveRecord::Migration
  def change
    drop_table :tag_topics

    create_table :taggings do |t|
      t.integer :shortened_url_id, null: false
      t.integer :tag_topic_id, null: false
      t.timestamps
    end

    add_index :taggings, :tag_topic_id
    add_index :taggings, :shortened_url_id

    create_table :tag_topics do |t|
      t.string :tag_topic, null: false
      t.timestamps
    end

    add_index :tag_topics, :tag_topic
  end
end
