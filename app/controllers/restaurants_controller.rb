class RestaurantsController < ApplicationController
  ## 建立驗證程序
  before_action :authenticate_user!
  
  ## 建立前台頁面 index 動作
  def index
    @restaurants = Restaurant.page(params[:page]).per(12)
    @categories = Category.all 
  end
  ## 建立展示頁面 show 動作 + 評論
  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end
  ## 最新動態頁面展示
  def feeds
    # 降序desc 排列最近更新的餐廳 十筆
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    # 降序desc 排列最近更新的評論 十筆
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end
  ## 查看餐廳分析
  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end


end
