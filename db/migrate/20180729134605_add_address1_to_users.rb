class AddAddress1ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address1, :string
  end
end
