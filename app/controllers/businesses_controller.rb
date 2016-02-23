class BusinessesController < ApplicationController
    before_action :find_business, only: [:show, :edit, :update, :destroy]
    def index
    end

    def new
        @business = Business.new
    end

    def create
        @business = Business.new post_params

        if @business.save
            redirect_to @business, notice: "Your Business has been saved!"
        else
            render 'new', notice: "There was an error while trying to save your Business!"
        end
    end

    def show
    end

    def edit
    end

    def update
        if @business.update post_params
            redirect_to @business, notice: "Your Category was successfully updated!"
        else
            render 'edit'
        end
    end

    def destroy
        @business.destroy
        redirect_to businesses_path
    end

    private

    def post_params
        params.require(:business).permit(:name, :address, :city, :postal, :email, :phone, :url, :description, :category, :logo, :audio)
    end

    def find_business
        @business = Business.find(params[:id])
    end

end
