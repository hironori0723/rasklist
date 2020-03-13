class RasksController < ApplicationController
    def index
        @rasks = Rask.all
    end
    
    def show
        @rask = Rask.find(params[:id])
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
        @rask = Rask.find(params[:id])
    end
    
    def update
        @rask = Rask.find(params[:id])
        
        if @rask.update(rask_params)
            flash[:success] = 'ラスクが編集されました'
            redirect_to @rask
        else
            flash.now[:danger] = '編集に失敗しました'
            render :edit
        end
    end
    
    def destroy
        @rask = Rask.find(params[:id])
        @rask.destroy
        
        flash[:success] = 'ラスクを消去しました'
        redirect_to rasks_url
    end
end

    private
    
    def rask_params
        params.require(:rask).permit(:content)
    end