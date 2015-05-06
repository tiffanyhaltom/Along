
class RoadtripsController < ApplicationController

  def create
    # @roadtrip = Roadtrip.new(roadtrip_params)
    # respond_to do |format|
    #   if @roadtrip.save
    #     format.html { redirect_to root_url, notice: 'roadtrip was successfully created.' }
    #     format.json { render :show, status: :created, location: @roadtrip }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @roadtrip.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private

	def roadtrip_params
    params.require(:roadtrip).permit(:name, :origin, :destination, :user_id)
  end

end
