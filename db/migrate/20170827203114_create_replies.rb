class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :sender
      t.text :body
      t.references :message, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
