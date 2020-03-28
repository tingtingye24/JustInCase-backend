class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.boolean :answer
      t.string :reason
      t.integer :total_correct, :default => 0
      t.integer :total_tested, :default => 0
      t.float :percent_correct, :default => 0
      t.string :source
      t.timestamps
    end
  end
end
