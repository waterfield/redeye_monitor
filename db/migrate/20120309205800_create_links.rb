class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :from
      t.references :to
      t.text :description

      t.timestamps
    end
    add_index :links, :from_id
    add_index :links, :to_id
  end
end
