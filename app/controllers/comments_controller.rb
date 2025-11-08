class CommentsController < ApplicationController
    def new
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build
    end

    def create
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build(comment_params)
        @comment.user = current_user
        if @comment.save
            redirect_to task_path(@task), notice: 'Saved'
        else
            flash.now[:error] = 'Failed save'
            render :new, status: :unprocessable_entity
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end