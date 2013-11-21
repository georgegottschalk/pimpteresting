class PimpsController < ApplicationController
  before_action :set_pimp, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pimps = Pimp.all.order("created_at DESC")
  end

  def show
  end

  def new
    @pimp = current_user.pimps.build
  end

  def edit
    @pimp = Pimp.find(params[:id])
  end

  def create
    @pimp = current_user.pimps.build(pimp_params)

      if @pimp.save
        redirect_to @pimp, notice: 'Pimp was successfully created.' 
      else
        render action: 'new' 
      end
  end

  def update
      if @pimp.update(pimp_params)
        redirect_to @pimp, notice: 'Pimp was successfully updated.' 
        head :no_content 
      else
        render action: 'edit' 
      end

  end

  def destroy
    @pimp.destroy
    respond_to do |format|
      redirect_to pimps_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pimp
      @pimp = Pimp.find(params[:id])
    end

    def correct_user
      @pimp = current_user.pimps.find_by(id: params[:id])
      redirect_to pimps_path, notice: "You aint authorized to fuck with that!" if @pimp.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pimp_params
      params.require(:pimp).permit(:description, :image)
    end
end
