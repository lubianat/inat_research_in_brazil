class ResearchArticlesController < ApplicationController
  before_action :set_research_article, only: [:show, :edit, :update]

  def index
    @research_articles = ResearchArticle.all
  end

  def show
  end

  def edit
  end

  def update
    @research_article = ResearchArticle.find(params[:id])
    if @research_article.update(research_article_params)
      next_article = ResearchArticle.where("id > ?", @research_article.id).order(id: :asc).first
      if next_article
        redirect_to research_article_path(next_article), notice: 'Article was successfully updated. Now viewing the next article.'
      else
        redirect_to research_articles_path, notice: 'Article was successfully updated. This was the last article.'
      end
    else
      render :edit
    end
  end
  

  private

  def set_research_article
    @research_article = ResearchArticle.find(params[:id])
  end

  def research_article_params
    params.require(:research_article).permit(:about_brazil, :from_brazilians, :uses_inaturalist_prominently)
  end
end
