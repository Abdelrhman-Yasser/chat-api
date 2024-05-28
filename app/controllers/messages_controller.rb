
class MessagesController < ApplicationController
  def index
    @chat = Chat.find(params[:chat_id])

    if(@chat == nil)
      render plain: "Chat not found", status: :not_found
      return
    end

    @messages = @chat.messages
    render json: @messages
  end

  def create  
    @chat = Chat.find(params[:chat_id])

    if(@chat == nil)
      render plain: "Chat not found", status: :not_found
      return
    end

    MessageWorker.perform_async(@chat.id, params[:message][:body])
    render json: { status: 'queued' }, status: :accepted
  end

  def search
    if params[:query].blank?
      render json: { error: "Query cannot be blank" }, status: :bad_request
    else
      @messages = Message.search_in_chat(params[:chat_id], params[:query]).records.to_a
      render json: @messages
    end
  end

  private

  def message_body
    params.require(:message).permit(:body)
  end
end
