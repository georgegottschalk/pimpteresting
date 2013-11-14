class PimpsController < ApplicationController
  before_action :set_pimp, only: [:show, :edit, :update, :destroy]

  def index
    @pimps = Pimp.all
  end

  def show
  end

  def new
    @pimp = Pimp.new
  end

  def edit
  end

  def create
    @pimp = Pimp.new(pimp_params)

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def pimp_params
      params.require(:pimp).permit(:description)
    end
end
