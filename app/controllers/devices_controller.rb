class DevicesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @device = current_user.devices.build(device_params)
    if @device.save
      flash[:success] = "Device created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @device.destroy
    flash[:success] = "Device deleted"
    redirect_to request.referrer || root_url
  end

  private

    def device_params
      params.require(:device).permit(:type_dev, :status, :log)
    end

    def correct_user
      @device = current_user.devices.find_by(id: params[:id])
      redirect_to root_url if @device.nil?
    end
end
