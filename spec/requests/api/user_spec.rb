require 'rails_helper'

RSpec.describe 'Api::Users', type: :request do
  describe 'POST /api/login' do
    let(:user) { create(:user) }

    context 'when the login details are correct' do
      let(:correct_user_parameters) { { email: user.email, password: user.password } }

      before do
        post api_login_path, params: correct_user_parameters
      end

      it 'should login successfully' do
        expect(response).to have_http_status(:ok)
        expect(json_parse['success']).to be_truthy
        expect(json_parse['access_token']).not_to be_empty
        expect(json_parse['errors']).to be_empty
      end
    end

    context 'when the login data is incorrect' do
      let(:incorrect_user_parameters) { { email: user.email, password: '' } }

      before do
        post api_login_path, params: incorrect_user_parameters
      end

      it 'login should not be done' do
        expect(response).to have_http_status(:not_found)
        expect(json_parse['success']).to be_falsey
        expect(json_parse['access_token']).to be_empty
        expect(json_parse['errors']).to eq(
          ['incorrect username or password']
        )
      end
    end
  end
end
