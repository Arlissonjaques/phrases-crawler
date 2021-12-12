class ApplicationController < ActionController::API

  def token_generate(data)
    encode_token(data)
  end

  private

  def auth_header
    request.headers['Authorization']&.split&.last
  end

  def encode_token(data)
    JWT.encode(data, ENV['SECRET_KEY'], 'HS256')
  end

  def decode_token
    if auth_header
      begin
        JWT.decode(auth_header, ENV['SECRET_KEY'], true, { algorithm: 'HS256' })
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def request_authorization
    render json: { 
      sucess: false,
      errors: ['Invalid token']
    }, status: :unauthorized unless decode_token
  end
end
