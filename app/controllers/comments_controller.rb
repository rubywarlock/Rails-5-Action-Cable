class CommentsController < ApplicationController
	before_action :set_post
	
	def create
		respond_to do |format|
			comment = @post.comments.create(comments_params)
      if comment.save
      	CommentsMailer.submitted(comment).deliver_later
        format.html { redirect_to @post, notice: 'Comemnt was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
	end

  def destroy
    @post.comments.find(params[:id]).destroy
    redirect_to @post
  end

	private
	def set_post
		@post = Post.find(params[:post_id])
  end

  def comments_params
  	params.required(:comment).permit(:body)
  end	

end