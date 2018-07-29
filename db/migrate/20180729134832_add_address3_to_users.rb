class AddAddress3ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address3, :string
  end
end
