class AnimalsController < ApplicationController
  def index
      @animals = Animal.all
      if Animal.all.length===0
        render status: 404, json: {
         message: "There are no animals."
        }
      else
        json_response(@animals)
      end
    end

    def show
      @animal = Animal.find(params[:id])
      json_response(@animal)
    end

    def create
      @animal = Animal.create!(animal_params)
      json_response(@animal, 201)
    end

    def update
      @animal = Animal.find(params[:id])
      if @animal.update!(animal_params)
        render status: :accepted, json: {
         message: "Animal info has been updated."
        }
      end
    end

    def destroy
      @animal = Animal.find(params[:id])
      if @animal.destroy
        render status: 200, json: {
         message: "Animal has been deleted."
        }
      end
    end

    def random
      @animal = Animal.random
      if Animal.all.length===0
        render status: 404, json: {
         message: "There are no animals."
        }
      else
        json_response(@animal)
      end
    end

    def search
      @animals = Animal.search(params[:name])
      if !params[:name]
        render status: 404, json: {
         message: "Please enter a name as a parameter."
        }
      elsif @animals.length===0
        render status: 404, json: {
         message: "No animal was found with that name."
        }
      else
        json_response(@animals)
      end
    end

  private

    def animal_params
      params.permit(:name,:species,:type,:age)
    end
  end
