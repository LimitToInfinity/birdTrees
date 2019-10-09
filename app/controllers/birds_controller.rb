class BirdsController < ApplicationController
  
  before_action :find_bird, only: [:show]

  def index
    if params[:search_term]
      @birds = Bird.where("name LIKE ?", "%#{params[:search_term]}%")
    else
      @birds = Bird.all
    end
  end

  def show
  end

  def new
    @bird = Bird.new
    @tree = Tree.new
  end

  def create
    @bird = Bird.new(allowed_params)
    if @bird.valid?
      @bird.save
      redirect_to bird_path(@bird)
    else
      render :new
    end
  end

  private
  
  def allowed_params
    params.require(:bird).permit(:name, :color, :song, tree_ids: [], trees_attributes: [:species, :evergreen])
  end
  
  def find_bird
    @bird = Bird.find(params[:id])
  end

end
