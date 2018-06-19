class AddColumnToAuths < ActiveRecord::Migration[5.1]
  def change
    add_column :auths, :provider, :string
  end
end
