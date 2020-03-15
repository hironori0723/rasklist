class RasksController < ApplicationController
    before_action :set_rasks, only: [:show, :edit, :update, :destroy]
    
    def index
        @rasks = Rask.all
    end
    
    def show
    end
    
    def new
        @rask = Rask.new
    end
    
    def create
        @rask = Rask.new(rask_params)
        
        if @rask.save
            flash[:success] = 'ラスクが正常に作られました'
            redirect_to @rask
        else
            flash.now[:danger] ='ラスクが作られませんでした'
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @rask.update(rask_params)
            flash[:success] = 'ラスクが編集されました'
            redirect_to @rask
        else
            flash.now[:danger] = '編集に失敗しました'
            render :edit
        end
    end
    
    def destroy
        @rask.destroy
        
        flash[:success] = 'ラスクを消去しました'
        redirect_to rasks_url
    end
end

    private
    
    def set_rasks
        @rask = Rask.find(params[:id])
    end
    
    def rask_params
        params.require(:rask).permit(:content, :status)
    end