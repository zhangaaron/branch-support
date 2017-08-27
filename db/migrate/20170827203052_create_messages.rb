class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender
      t.text :body
      t.boolean :resolved
      t.integer :priority

      t.timestamps null: false
    end
  end
end
