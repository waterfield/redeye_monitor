class CreateParams < ActiveRecord::Migration
  def change
    create_table :params do |t|
      t.references :worker
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :params, :worker_id
  end
end
