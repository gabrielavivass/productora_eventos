class ConcertsController < ApplicationController
    before_action :set_concert, only: %i[ show edit update destroy ]
  
    
    def index
      @concerts = Concert.all
    end
  
     
    def show
    end
  
    
    def new
      @concert = Concert.new
      @groups = Group.all
    end
  
   
    def edit
      @groups = Group.all
    end
  
    
    def create
      @concert = Concert.new(concert_params)
      @groups = Group.all
  
      respond_to do |format|
        if @concert.save
          format.html { redirect_to @concert, notice: "Concert was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
   
    def update
      respond_to do |format|
        if @concert.update(concert_params)
          format.html { redirect_to @concert, notice: "Concert was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    
    def destroy
      @concert.destroy
      respond_to do |format|
        format.html { redirect_to concerts_url, notice: "Concert was successfully destroyed." }
      end
    end
  
    private
      
      def set_concert
        @concert = Concert.find(params[:id])
      end
  
      
      def concert_params
        params.require(:concert).permit(:public, :duration, :concert_date, :group_id)
      end
  end