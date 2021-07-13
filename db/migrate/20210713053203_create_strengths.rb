class CreateStrengths < ActiveRecord::Migration[6.1]
  def change
      create_table :strengths do |t|
        t.string :name
        t.string :intensity
        t.integer :duration 
      end
  end
end
