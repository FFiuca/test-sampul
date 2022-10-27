class Room < ApplicationRecord
  has_many :Chat, class_name: 'Chat', foreign_key: 'room_id'
end
