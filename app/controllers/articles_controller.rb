class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  def home
    @articles = Article.all
  end

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    if @article.save
      redirect_to root_path, notice: "文章建立完成"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(params_article)
      redirect_to root_path, notice: "文章修改完成"
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, notice: "文章已經被刪除"
  end

  private
  def find_article
    @article = Article.find(params[:id])
  end

  def params_article
    params.require(:article).permit(:title, :content)
  end
end
