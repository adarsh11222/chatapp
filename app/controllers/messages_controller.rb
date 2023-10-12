class MessagesController < ApplicationController
    def show
        @message = Message.new
        @friend = Friend.find(params[:id])
        @fid = params[:id]
        @room = Room.find_by(room_id: @friend.rid)
        end 
    end
    def new
        @message = Message.new

    end
    def create
        user = current_user
        @message = Message.new(message_params)
        @message.save!
        redirect_to messages_path(id: @fid)
    end

    private

    def message_params
        params.require(:message).permit(:content, :user_id, :room_id)
    end
end
