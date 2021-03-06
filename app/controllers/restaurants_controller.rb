class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    #@restaurants = Restaurant.all
    #index method is a bit different we have to overwritte the scope method in restaurant policy
    @restaurants = policy_scope(Restaurant).order(created_at: :desc)


  end

  def show

  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant #para que todo el mundo pueda crear un restaurant

    if @restaurant.save
      redirect_to @restaurant, notice: 'restaurant was created'
    else
      render :new
    end

  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was updated'
    else
      render :edit
    end

  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: 'Restaurant was destroyed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
      authorize @restaurant


    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name)
    end
end
