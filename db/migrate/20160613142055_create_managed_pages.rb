class CreateManagedPages < ActiveRecord::Migration
  def change
    create_table :managed_pages do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :description
      t.string :logo
      t.string :fb_page_id

      t.timestamps null: false
    end
  end
end
