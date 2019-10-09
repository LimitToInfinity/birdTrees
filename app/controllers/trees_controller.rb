class TreesController < ApplicationController
  
  before_action :find_tree, only: [:show]

  def index
    if params[:search_term]
      @trees = Tree.where("name LIKE ?", "%#{params[:search_term]}%")
    else
      @trees = Tree.all
    end
  end

  def show
  end

  def new
    @tree = Tree.new
  end

  def create
    @tree = Tree.new(allowed_params)
    if @tree.valid?
      @tree.save
      redirect_to tree_path(@tree)
    else
      render :new
    end
  end

  private
  
  def allowed_params
    params.require(:tree).permit(:species, :evergreen)
  end
  
  def find_tree
    @tree = Tree.find(params[:id])
  end

end
