class AddTypeToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :string
    add_column :identities, :type, :string
    add_column :identities,  :string
  end
end
