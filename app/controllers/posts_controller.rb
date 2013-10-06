class PostsController < ApplicationController
	http_basic_authenticate_with name: "msh", password: "secret", except: [:index, :show]

	def index
		@posts = Post.all
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

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post].permit(:title, :text))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
	  @post = Post.find(params[:id])
	  @post.destroy
	 
	  redirect_to posts_path
	end



	private
		def post_params
			params.require(:post).permit(:title, :text)
		end


end
