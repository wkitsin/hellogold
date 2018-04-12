class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :authenticate_user!
  def render_result(trans)
    if trans.save
      render :json => {results: 'ok'}
    else
      render :json => {results: 'ok'}
    end
  end

end
