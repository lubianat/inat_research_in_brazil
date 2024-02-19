class ResearchArticlesController < ApplicationController
  before_action :set_research_article, only: [:show, :edit, :update]

  def index
    if params[:filter_all_yes] == 'true'
      @research_articles = ResearchArticle.where(about_brazil: true, from_brazilians: true, uses_inaturalist_prominently: true)
    elsif params[:filter_all_not_specified] == 'true'
      @research_articles = ResearchArticle.where(about_brazil: nil, from_brazilians: nil, uses_inaturalist_prominently: nil)
    else
      @research_articles = ResearchArticle.all
    end
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
