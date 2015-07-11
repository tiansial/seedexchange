class SeedsController < ApplicationController
  before_action :find_seed, only: [:show, :edit, :update, :destroy]

  def index
    @seeds = Seed.all.order("created_at DESC")
  end

  def show

  end

  def new
    @seed = Seed.new
  end

  def create
    @seed = Seed.new(seed_params)

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

  private

  def seed_params
    params.require(:seed).permit(:title, :description)
  end

  def find_seed
    @seed = Seed.find(params[:id])
  end
end
