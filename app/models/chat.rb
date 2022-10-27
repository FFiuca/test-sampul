class Chat < ApplicationRecord
  belongs_to :Room, class_name: 'Room', foreign_key: 'room_id'
  after_create :notify_pusher

  def notify_pusher
    Pusher.trigger('my-channel', 'my-event', self.as_json)
  end
end
