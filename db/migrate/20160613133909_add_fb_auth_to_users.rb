class AddFbAuthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_token, :string
    add_column :users, :fb_token_expires, :string
  end
end
