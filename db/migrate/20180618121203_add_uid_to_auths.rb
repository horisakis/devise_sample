class AddUidToAuths < ActiveRecord::Migration[5.1]
  def change
    add_column :auths, :uid, :string
  end
end
