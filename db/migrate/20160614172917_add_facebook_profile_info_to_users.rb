class AddFacebookProfileInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :fb_profile_image, :string
  end
end
