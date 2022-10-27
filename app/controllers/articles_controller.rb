class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new

  end


  def create
    @article = Article.new(title: "Article 2", body: "....") ## jika aa: itu object kaya php, nek ngene "... : " mboh iki opo

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end

  end

end
