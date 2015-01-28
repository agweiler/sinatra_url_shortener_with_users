class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original
      t.string :short
      t.integer :click_count, default: 0
      t.references :user
      t.timestamps
    end
    add_index :urls, :short
    add_index :urls, :original
  end
end
