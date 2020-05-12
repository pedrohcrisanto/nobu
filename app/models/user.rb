class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :create_account

  def create_account
    Account.create!(balance: 0.0, status: "Ativa", user_id: self.id)
  end
        
end
