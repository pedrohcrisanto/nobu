require 'rails_helper'
RSpec.describe "Sessions" do
	it "signs user in and out" do
		user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") 
		sign_in user
		get root_path
		expect(response).to render_template(:index)
		sign_out user
		get root_path
		expect(response).not_to render_template(:index) 
	end
end