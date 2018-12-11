class AuthController < ApplicationController
  skip_before_action :jwt_auth_validation

  def user_auth
    if params[:login_name] && params[:password]
      user = User.find_by(login_name: params[:login_name])
      
      if user && user.authenticate(params[:password])
        payload = {          
          token_type: 'client_a2',
          exp: 12.hours.from_now.to_i
        }        
        jwt_token = jwt_encode(payload)        
        response = {
          token: jwt_token,
          user: ActiveModelSerializers::Adapter.create(UserSerializer.new(user)).as_json
        }
        render json: response, status: 200
      else
        render json: { error: 'Dados inválidos.' }, status: :unauthorized
      end
    else
      render json: { error: 'Dados inválidos.' }, status: :unauthorized
    end
  end
end
