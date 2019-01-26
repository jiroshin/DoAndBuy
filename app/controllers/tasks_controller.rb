class TasksController < ApplicationController
  before_action :authenticate_user!, except: :new
  before_action :correct_user, only: [:destroy]
  protect_from_forgery except: :search
  
  def index
    @tasks = Task.all.order('created_at DESC').page(params[:page]).per(5)
  end 
  
  def show
    @task = Task.find(params[:id])
    @comments = @task.comments
    @comment = Comment.new
  end
  
  def new
    @task = Task.new
    @tasks = Task.limit(3).order('created_at DESC') 
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:notice] = '目標が正常に作成されました'
      redirect_to root_url
    else
      @tasks = Task.limit(5).order('created_at DESC') 
      flash.now[:alert] ='目標の作成に失敗しました'
      render :new
    end
  end
  
  def destroy
    @task.destroy
    flash[:notice] = '目標を削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  
  def search
    @items = []

    @keyword = params[:keyword]
    if @keyword.present?
      results = RakutenWebService::Ichiba::Item.search({
        keyword: @keyword,
        imageFlag: 1,
        hits: 5,
      })

      results.each do |result|
        item = read(result)
        @items << item
      end
    end
  end
  
  
  private
  
  def task_params
    params.require(:task).permit(:goal, :deadline, :name, :url, :image_url)
  end
  
  def read(result)
    code = result['itemCode']
    name = result['itemName']
    url = result['itemUrl']
    image_url = result['mediumImageUrls'].first
    
    {
      code: code,
      name: name,
      url: url,
      image_url: image_url,
    }
  end
  
  def correct_user
    @task = Task.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
end

  