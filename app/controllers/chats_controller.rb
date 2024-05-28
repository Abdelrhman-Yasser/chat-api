
class ChatsController < ApplicationController
  def index
    @application = Application.find_by(token: params[:token])

    if(@application == nil)
      render plain: "Application not found", status: :not_found
      return
    end

    @chats = @application.chats
    render json: @chats
  end

  def create
    @application = Application.find_by(token: params[:token])

    if(@application == nil)
      render plain: "Application not found", status: :not_found
      return
    end

    ChatWorker.perform_async(@application.id, params[:chat][:name])
    render json: { status: 'queued' }, status: :accepted
  end

  def show
    @chat = Chat.find(params[:id])

    if(@chat == nil)
      render plain: "Chat not found", status: :not_found
      return
    end

    render json: @chat
  end

  private

  def application_params
    params.require(:chat).permit(:name)
  end
end
