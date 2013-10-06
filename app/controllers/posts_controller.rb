class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
	end

	def create
		# render text: params[:post].inspect
		@post = Post.new(params[:post].permit(:title,:text))

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	private
		def post_params
			params.require(:post).permit(:title, :text)
		end


end
