class PostCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
    	comment = current_user.post_comments.new(post_comment_params)
    	comment.book_id = book.id
    	if comment.save
   		   redirect_back fallback_location: root_url
   		else
   			redirect_back fallback_location: root_url
   		end
	end

	def destroy
		PostComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    	redirect_back fallback_location: root_url
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
