class User::ClientsController < ApplicationController

  def new
    @client = Client.new
    @client_info = true
  end

  def create
    @client = Client.new(client_params)
    if @client.save && params[:proceed_next]
      redirect_to new_user_client_event_path(@client.id), notice: "Client saved"
    else
      render action: "new"
    end
  end

  def edit
    @client = Client.find(params[:id])
    @client_info = true
  end

  def update
    @client_info = true
    @client = Client.find(params[:id])
    if @client.update_attributes(client_params)
      redirect_to new_user_client_event_path(@client.id), notice: "Client Updated"
    else
      render 'edit'
    end
  end

private
  def client_params
    params.require(:client).permit(:chain, :business_unit, :address, :postal_code, :first_name, :last_name, :title, :phone_number, :email, :city, roles:[])
  end
end