class CreateCardios < ActiveRecord::Migration[6.1]
  def change
    create_table :cardios do |t|
      t.string :name
      t.string :intensity
      t.integer :duration 
    end
  end
end

