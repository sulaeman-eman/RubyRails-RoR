class FoodsController < ApplicationController

    def index
        @foods = Food.all
    end

    def show
        @food = Food.find(params[:id])
        #food tampilan data yang masuk (bukan index)
    end

    def new
        @food = Food.new  #food Data masuk
    end

    def edit
        @food = Food.find(params[:id])
    end

    def create
        @food = Food.new(food_params)
        if @food.save
            redirect_to @food #redirect show
        else
            render "new"
        end
    end

    def update
        @food = Food.find(params[:id])

        if @food.update(food_params)
            redirect_to @food
        else
            render 'edit'
        end
    end

    def destroy
        @food = Food.find(params[:id])
        @food.destroy
        redirect_to foods_path
    end

    private

        def food_params
            params.require(:food).permit(:nama, :harga)
        end


end
