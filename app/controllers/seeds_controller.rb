class SeedsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_seed, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    @seeds = Seed.all.order("created_at DESC")
  end

  def show

  end

  def new
    @seed = current_user.seeds.build
  end

  def create
    @seed = current_user.seeds.build(seed_params)

    if @seed.save
      redirect_to @seed, notice: "Semente criada com sucesso."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @seed.update(seed_params)
      redirect_to @seed, notice: "Semente atualizada com sucesso."
    else
      render 'edit'
    end
  end

  def destroy
    @seed.destroy
		redirect_to root_path
  end

  def upvote 
    @seed.upvote_by current_user
    redirect_to :back
  end

  private

  def seed_params
    params.require(:seed).permit(:title, :description, :image)
  end

  def find_seed
    @seed = Seed.find(params[:id])
  end
end
