class AddSecretKeysToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :edit_key, :string
    add_column :polls, :share_key, :string
  end
end
