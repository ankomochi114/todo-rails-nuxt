class V1::MemosController < ApplicationController
    before_action :set_post, only: %i[show destroy update]

    def index
        memos = Memo.all.order(:id)
        render json: memos
    end

    def show
        render json: @memo
    end

    def create
        memo = Memo.new(memo_params)
        if memo.save
            render json: memo
        else
            render json: memo.errors
        end
    end

    def update
        if @memo.update(memo_params)
            render json: @memo
        else
            render json: @memo.errors
        end
    end

    def destroy
        if @memo.destroy
            render json: @memo
        else
            render json: @memo.errors
        end
    end

    private

    def set_post
        @memo = Memo.find(params[:id])
    end

    def memo_params
        params.require(:memo).permit(:title, :content, :state)
    end
end
