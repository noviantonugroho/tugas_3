class ArticlesController < ApplicationController
  def index
     @articles = Article.all
  end

  def new
  	@article = Article.new
  end

  def edit
        @article = Article.find_by_id(params[:id])
  end

  def create
    @article = Article.new(params_article)

    if @article.save

        flash[:notice] = "Success Add Records"

        redirect_to action: 'index'

    else

        flash[:error] = "data not valid"

        render 'new'
  end

  #def index
  # @articles = Article.all
  #end

  def show

        @article = Article.find_by_id(params[:id])

  end

  def update

 @article = Article.find_by_id(params[:id])

 if @article.update(params_article)

    flash[:notice] = "Success Update Records"

    redirect_to action: 'index'

 else

    flash[:error] = "data not valid"

    render 'edit'

 end
  def destroy

    @article = Article.find_by_id(params[:id])

    if @article.destroy

        flash[:notice] = "Success Delete a Records"

        redirect_to action: 'index'

    else

        flash[:error] = "fails delete a records"

        redirect_to action: 'index'

    end

end
end
  private

    def params_article

        params.require(:article).permit(:title, :content, :status)

    end

  end
end

   


