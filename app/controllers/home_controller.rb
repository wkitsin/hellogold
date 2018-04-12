class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @transactions = Transaction.where(asset: 'cash')
  end
end
