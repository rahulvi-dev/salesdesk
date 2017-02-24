class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :chain
      t.string :business_unit
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :first_name
      t.string :last_name
      t.string :roles
      t.string :title
      t.integer :phone_number, :limit => 8
      t.string :email

      t.timestamps
    end
  end
end
