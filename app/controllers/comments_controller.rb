class CommentsController < ApplicationController

    def create
        @message = Message.find(params[:message_id])       
        @comment = @message.comments.create(message_params)
        @comment.user_id = Current.user.id

        if @message.save
            redirect_to message_path(@message)
        else
            return new 
        end             
    end    

    private
        def message_params
            params.require(:comment).permit(:content) 
        end

end
