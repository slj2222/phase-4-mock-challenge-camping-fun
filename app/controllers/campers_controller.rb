class CampersController < ApplicationController

    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper 
            render json: camper, serializer: CamperWithActivities
        else
            render json: { error: "Camper not found" }, status: 404
        end
    end

    def create
        camper = Camper.create(camper_params)
        if camper.id
            render json: camper, status: 201
        else
            render json: { errors: ["Validation errors"] }, status: 422
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end
end
