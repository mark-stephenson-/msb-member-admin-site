class AddWorkflowStateToManagedPages < ActiveRecord::Migration
  def change
    add_column :managed_pages, :workflow_state, :string
  end
end
