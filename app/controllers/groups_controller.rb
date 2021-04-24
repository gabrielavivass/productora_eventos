class GroupsController < ApplicationController
    before_action :set_group, only: %i[ show edit update destroy ]
  
    # GET /groups 
    def index
      @groups = Group.all
      @concerts = Concert.all
    end
  
    # GET /groups/1 
    def show
    end
  
    # GET /groups/new
    def new
      @group = Group.new
      @concerts = Concert.all
    end
  
    
    def edit
    end
  
    
    def create
      @group = Group.new(group_params)
  
      respond_to do |format|
        if @group.save
          format.html { redirect_to @group, notice: "Group was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    
    def update
      respond_to do |format|
        if @group.update(group_params)
          format.html { redirect_to @group, notice: "Group was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    
    def destroy
      @group.destroy
      respond_to do |format|
        format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      end
    end
  
    private
     
      def set_group
        @group = Group.find(params[:id])
      end
  
     
      def group_params
        params.require(:group).permit(:name, :members, :group_type)
      end
  end