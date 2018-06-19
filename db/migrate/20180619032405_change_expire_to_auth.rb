class ChangeExpireToAuth < ActiveRecord::Migration[5.1]
  def change
    change_column :auths, :expire_at, :string
    rename_column :auths, :expire_at, :expires_at
  end
end
