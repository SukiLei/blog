class ArticlesController < ApplicationController
	before_filter :verify_access, except: [:index]
	def verify_access
    if session[:current_user].nil?
      @hint = "Verify access failed, log in first please."
      redirect_to :controller => 'users', :action => 'login'
=begin
      authenticate_or_request_with_http_basic do |name, passwd|
        t = User.find_by_name(name)
        login_status = (t.nil?) ? false : ((passwd == t.password) ? true : false )
        if login_status
          session[:current_user] = t
          return true
        else
          @hint = "User name or Password is not right."
          return false
        end
      end
=end
    else
      #username = User.find_by_name(session[:current_user]["name"])
    end
	end

	def new
		@article = Article.new
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

	    if @article.update(article_params)
		    redirect_to @article
  	    else
    		render 'edit'
  		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def destroy
	  @article = Article.find(params[:id])
 	  @article.destroy

  	  redirect_to articles_path
	end

	def index
		#@articles = Article.all
    article = Article.order("title").page(params[:page]).per(2)
    a_json = article.as_json
    a_json.each do |a|
      puts a["id"]
      a["title"] = "[#{a["title"]}]"
    end
    @articles = Article.where(id: a_json.map(&:id))
    @login_stauts = session[:current_user].nil?
	end

	private
	def article_params
		params.require(:article).permit(:title, :text, :picture)
	end
end
