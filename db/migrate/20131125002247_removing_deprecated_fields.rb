class RemovingDeprecatedFields < ActiveRecord::Migration
  def change
  	remove_column :appointments, :date, :string
  	remove_column :identities, :string
  	remove_column :identities, :string
 
  end
end
