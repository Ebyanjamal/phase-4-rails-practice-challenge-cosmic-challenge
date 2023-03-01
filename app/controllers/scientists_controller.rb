class ScientistsController < ApplicationController

    
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid


    def index 
        render json: Scientist.all
    end

    def show 
        scientist = Scientist.find(params[:id])
        render json: scientist, status: :ok
    end


    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end


    def update 
        scientist = Scientist.find(params[:id])
        render json:  scientist.update(scientist_params), status: :accepted
    end


    def destroy
        scientist = Scientist.find(params[:id])
         scientist.destroy 
        render json: {}
    end

    private 

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

  
    def invalid(error)
    render json: {error: error}, status: 422
    end

    def  not_found
      render json: {error: "Scientist not found"} , status: 404 
    end

end
