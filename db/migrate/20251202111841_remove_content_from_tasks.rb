class RemoveContentFromTasks < ActiveRecord::Migration[8.0]
  def up
      remove_column :tasks, :description, :text
  end

  def down
      add_column :tasks, :description, :text unless column_exists?(:tasks, :description)
  end
end
