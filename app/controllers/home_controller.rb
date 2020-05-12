class HomeController < ApplicationController
    before_action :authenticate_user!

    def index
        @account_balance = Account.find_by(user_id: current_user.id).balance
        @account_status = Account.find_by(user_id: current_user.id).status
    end

def deposit
    @account_balance = Account.find_by(user_id: current_user.id).balance
    new_balance = @account_balance + params[:value].to_f
    @account = Account.find_by(user_id: current_user.id).update(balance: new_balance)
    redirect_to root_path
end

def draw
    @account_balance = Account.find_by(user_id: current_user.id).balance
    new_balance = @account_balance - params[:value].to_f
    @account = Account.find_by(user_id: current_user.id).update(balance: new_balance)
    redirect_to root_path
end

def transfer
    @account_balance = Account.find_by(user_id: current_user.id).balance
    if @account_balance - params[:value].to_f >= 0
        new_balance = @account_balance - params[:value].to_f
        @account = Account.find_by(user_id: current_user.id).update(balance: new_balance)
    end
    @account_balance_transfer = Account.find_by(user_id: params[:user][:user_id]).balance
    new_transfer_balance = @account_balance_transfer + params[:value].to_f
    @account_transfer = Account.find_by(user_id: params[:user][:user_id]).update(balance: new_transfer_balance) 
    redirect_to root_path
end

def actions
end
end
