class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
    t.string :email
    t.string :password
    t.string :first_name
    t.string :last_name
    t.integer :age
    end
  end
end
