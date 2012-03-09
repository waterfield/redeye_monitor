class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.references :project
      t.string :prefix
      t.text :description

      t.timestamps
    end
    add_index :workers, :project_id
  end
end
