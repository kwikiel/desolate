class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end 

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(params.require(:article).permit(:title, :text))

		@article.save
		redirect_to @article
	end 

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end
end
