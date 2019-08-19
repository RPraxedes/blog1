class ArticlesController < ApplicationController
  before_action :setup_article, only: [:edit, :update, :destroy, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @article.destroy
    flash[:notice] = "Wa ha ha was deleted successfully!"
    redirect_to articles_path
  end

  def show
  end

  private

  def setup_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
