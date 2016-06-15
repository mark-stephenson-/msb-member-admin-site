class AddIndexToManagedPages < ActiveRecord::Migration
  def change
    add_index :managed_pages, [:user_id, :fb_page_id], unique: true
  end
end
