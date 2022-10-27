class AddUsernameToChats < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :username, :string
  end
end
