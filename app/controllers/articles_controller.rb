class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]
	
	#List all articles
	def index
		@article = Article.all
	end

#Give user ability to create new articles
	def new
		@article = Article.new
	end

	#Create new articles
	def create
		# render plain: params[:article].inspect
		@article = Article.new(article_params) 
		
		if @article.save # if article is sucessfully saved,...
			redirect_to @article # then redirect to that article...
		else
			render :new # otherwise, render the form again, so user can correct mistakes
		end
	end

	#Show specific article
	def show
		@article = Article.find(params[:id])
	end

	def edit
	end

	def update
		if @article.update_attributes(article_params)
			redirect_to @article
		else
			render :edit
		end



private
	def article_params
		params.require(:article).permit(:title, :body) #only these parameters are allowed to be submitted by user.
	end

end
end
