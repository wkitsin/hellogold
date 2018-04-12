class TransactionsController < ApplicationController


  def index
    @transactions = Transaction.where(current_user: current_user.id)
    render :json => {transactions: @transactions}
  end

  def top_up
    trans = Transaction.new(cash_params.merge(asset: 'cash', type: 'top_up'))
    render_result(trans)
  end

  def buy
    trans = Transaction.new(gold_params.merge(type: 'buy'))
    default_gold(trans)
    render_result(trans)
  end

  def sell
    trans = Transaction.new(gold_params.merge(type:'sell'))
    default_gold(trans)
    render_result(trans)
  end

  def withdraw
    trans = Transaction.new(cash_params.merge(asset: 'cash', type: 'withdraw'))
    render_result(trans)
  end

  def destroy
    trans = Transaction.find(params[:id])
    if trans.delete
      flash[:notice] = 'Success'
    else
      flash[:notice] = 'Fail'
    end
    redirect_to root_path
  end

  def default_gold(trans)
    if trans.asset == nil
      trans.asset = 'gold'
    end
  end

  private

  def cash_params
    params.permit(:amount)
  end

  def gold_params
    params.permit(:amount, :asset)
  end
end
