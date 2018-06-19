class RenameSaveToAuths < ActiveRecord::Migration[5.1]
  def change
    rename_column :auths, :save, :destination
  end
end
