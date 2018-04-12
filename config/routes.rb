Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope 'api/transactions' do
    get '' => 'transactions#index', as: 'trans_index'
    post 'top_up' => 'transactions#top_up' , as: 'trans_top_up'
    post 'buy' => 'transactions#buy' , as: 'trans_sell'
    post 'sell' => 'transactions#sell' , as: 'trans_buy'
    post 'withdraw' => 'transactions#withdraw' , as: 'trans_withdraw'
    delete 'delete' => 'transactions#destroy', as: 'trans_delete'
  end

  scope 'api/balance' do
    get '' => 'balances#index', as: 'balance_index'
  end
  root to: "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }, path_names: { registration: 'register'}

end
