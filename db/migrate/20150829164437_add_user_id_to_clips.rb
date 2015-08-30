class AddUserIdToClips < ActiveRecord::Migration
  def change
    add_column :clips, :user_id, :integer
    add_index :clips, :user_id
  end
end
