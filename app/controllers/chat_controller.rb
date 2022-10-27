# require 'pusher'

class ChatController < ApplicationController
  skip_before_action :verify_authenticity_token

  def roomCreate
    @room = Room.where(room: [params[:room]]).first

    if(@room==nil)
      @room = Room.new(room: params[:room])
      @room.save

      respond_to do |format|
        msg = { :status => 1, message: "Room created", :data => @room }
        format.json  { render :json => msg, status: 200 } # don't do msg.to_json
      end
    else
      respond_to do |format|
        msg = { :status => 1, message: "Room already saved", :data => @room }
        format.json  { render :json => msg, status: 200 } # don't do msg.to_json
      end
    end

  end

  def addChat
    @chat = Room.find(params[:room_id]).Chat.new(message: params[:message], username: params[:username])
    @chat.save

    respond_to do |format|
      msg = { :status => "ok", :data => {room: @chat} }
      format.json  { render :json => msg } # don't do msg.to_json
    end

  end

  def getChatByRoom
    @data = Room.find(params[:room_id]).Chat.order(created_at: :asc)

    respond_to do |format|
      msg = { :status => "ok", :data => @data }
      format.json  { render :json => msg } # don't do msg.to_json
    end
  end
end
