class CreateAuths < ActiveRecord::Migration[5.1]
  def change
    create_table :auths do |t|
      t.string :user_id
      t.string :token
      t.string :secret_token
      t.datetime :expire_at
      t.boolean :save

      t.timestamps
    end
  end
end
