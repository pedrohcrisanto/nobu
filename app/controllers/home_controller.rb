class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		@account_balance = Account.find_by(user_id: current_user.id).balance
		@account_status = Account.find_by(user_id: current_user.id).status
	end

	def change_status
		if params[:status] == "Ativa"
			Account.find_by(user_id: current_user.id).update(status: "Ativa")
			flash[:notice] = "Sua conta está ativa!"
		end
		if params[:status] == "Desativa"
			Account.find_by(user_id: current_user.id).update(status: "Desativa")
			flash[:alert] = "Sua conta está desativa!"
		end
		redirect_to root_path
	end
	def deposit
		if Account.find_by(user_id: current_user.id).status == "Ativa"
			if params[:value].to_f > 0
				@account_balance = Account.find_by(user_id: current_user.id).balance
				new_balance = @account_balance + params[:value].to_f
            	@account = Account.find_by(user_id: current_user.id).update(balance: new_balance)
            	Extract.create!(user_id: current_user.id, type_transaction: "Depósito", account_id: Account.find_by(user_id: current_user.id).id, value: params[:value].to_f, tax: 0.0)
				flash[:notice] = "Deposito de R$ #{params[:value]} efetuado com sucesso!"
			else
				flash[:alert] = "O valor tem que ser um numero positivo!"
			end
		else
			flash[:alert] = "Sua conta está desativa, mude o status para realizar ações!"
		end
		redirect_to root_path
	end

	def draw
		if params[:value].to_f > 0
			if Account.find_by(user_id: current_user.id).status == "Ativa"
				@account_balance = Account.find_by(user_id: current_user.id).balance
				new_balance = @account_balance - params[:value].to_f
				if new_balance >= 0 
					@account = Account.find_by(user_id: current_user.id).update(balance: new_balance)
                	Extract.create!(user_id: current_user.id, type_transaction: "Saque", account_id: Account.find_by(user_id: current_user.id).id, value: params[:value].to_f, tax: 0.0)
					flash[:notice] = "Saque de R$ #{params[:value]} efetuado com sucesso!"
				else
					flash[:alert] = "Sua conta não pode ficar negativa!"
				end
			else
				flash[:alert] = "Sua conta está desativa, mude o status para realizar ações!"
			end
		else
			flash[:alert] = "O valor tem que ser um numero positivo!"
		end
		redirect_to root_path
	end

	def transfer
		if params[:value].to_f > 0
			if Account.find_by(user_id: current_user.id).status == "Ativa"
				@account_balance = Account.find_by(user_id: current_user.id).balance
				if params[:value].to_f >= 1000
					if Time.zone.now.hour < 18 and Time.zone.now.hour > 9
						new_balance = @account_balance - params[:value].to_f - 15.0
						if new_balance >= 0
							@account = Account.find_by(user_id: current_user.id).update(balance: new_balance)
							Extract.create!(user_id: current_user.id, type_transaction: "Transferência", account_id: params[:user][:user_id], value: params[:value].to_f, tax: 15.0)
							flash[:notice] = "Transferencia de R$ #{params[:value]} efetuado com sucesso!"
						else
							flash[:alert] = "Sua conta não pode ficar negativa!"
						end
					else
						new_balance = @account_balance - params[:value].to_f - 17.0
						if new_balance >= 0
							@account = Account.find_by(user_id: current_user.id).update(balance: new_balance)
							Extract.create!(user_id: current_user.id, type_transaction: "Transferência", account_id: params[:user][:user_id], value: params[:value].to_f, tax: 17.0)
							flash[:notice] = "Transferencia de R$ #{params[:value]} efetuado com sucesso!"
						else
							flash[:alert] = "Sua conta não pode ficar negativa!"
						end
					end
				else
					if Time.zone.now.hour < 18 and Time.zone.now.hour > 9
						new_balance = @account_balance - params[:value].to_f - 5.0
						if new_balance >= 0
							@account = Account.find_by(user_id: current_user.id).update(balance: new_balance)
							Extract.create!(user_id: current_user.id, type_transaction: "Transferência", account_id: params[:user][:user_id], value: params[:value].to_f, tax: 5.0)
							flash[:notice] = "Transferencia de R$ #{params[:value]} efetuado com sucesso!"
						else
							flash[:alert] = "Sua conta não pode ficar negativa!"
						end
					else
						new_balance = @account_balance - params[:value].to_f - 7.0
						if new_balance >= 0
							@account = Account.find_by(user_id: current_user.id).update(balance: new_balance)
							Extract.create!(user_id: current_user.id, type_transaction: "Transferência", account_id: params[:user][:user_id], value: params[:value].to_f, tax: 7.0)
							flash[:notice] = "Transferencia de R$ #{params[:value]} efetuado com sucesso!"
						else
							flash[:alert] = "Sua conta não pode ficar negativa!"
						end
					end
				end
				@account_balance_transfer = Account.find_by(user_id: params[:user][:user_id]).balance
				new_transfer_balance = @account_balance_transfer + params[:value].to_f
				@account_transfer = Account.find_by(user_id: params[:user][:user_id]).update(balance: new_transfer_balance)
				Extract.create!(user_id: params[:user][:user_id], type_transaction: "Transferência", account_id: Account.find_by(user_id: current_user.id).id, value: params[:value].to_f, tax: 0.0) 
			else
				flash[:alert] = "Sua conta está desativa, mude o status para realizar ações!"
			end
		else
			flash[:alert] = "O valor tem que ser um numero positivo!"
		end
		redirect_to root_path
	end

	def actions
    end
    
    def extract
        @extracts = Extract.where(user_id: current_user.id)
    end
end
