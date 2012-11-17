class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :response
      t.references :question

      t.timestamps
    end
    add_index :responses, :question_id
  end
end
