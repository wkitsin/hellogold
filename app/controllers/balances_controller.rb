class BalancesController < ApplicationController

  def index

    gold_buy = Transaction.where(type: 'buy')
    gold_sell = Transaction.where(type: 'sell')
    g_buy = Balance.iteration_method(gold_buy)
    g_sell = Balance.iteration_method(gold_sell)
    gold_balance = g_buy - g_sell

    cash_buy = Transaction.where(asset: 'cash', type: 'top_up')
    cash_sell = Transaction.where(asset: 'cash', type: 'withdraw')
    c_buy = Balance.iteration_method(cash_buy)
    c_sell = Balance.iteration_method(cash_sell)
    cash_balance = c_buy - c_sell

    render :json => {"GLD": gold_balance, "CASH": cash_balance}
  end


end
