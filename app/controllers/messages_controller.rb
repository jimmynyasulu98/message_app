class MessagesController < ApplicationController
    before_action :find_message, only: [:show, :edit, :update, :destroy]

    def index
        @messages = Message.all().order("created_at DESC")
    end 

    def new
        @message = Message.new
    end
    def show
       print("okay 2")
    end

    def edit
    
    end

    def update

        if @message.update(message_params)
            redirect_to edit_message_path(@message)
        else
            render "edit"
        end    
    end

    def destroy
        @message.destroy
        flash[:success] = "The to-do item was successfully destroyed."    
        redirect_to root_path
    end

    def create     
        @message = Message.new(message_params)
        puts @message
        if @message.save
            redirect_to root_path
        else
            return 'new'   
        end     
    end 
    private
        def message_params
            params.require(:message).permit(:title, :description) 

        end   
        def find_message
            @message = Message.find(params[:id])
        end
        
end
