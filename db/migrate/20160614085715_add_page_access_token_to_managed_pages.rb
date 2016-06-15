class AddPageAccessTokenToManagedPages < ActiveRecord::Migration
  def change
    add_column :managed_pages, :fb_page_access_token, :string
    add_column :managed_pages, :fb_page_logo_s, :string
  end
end
