Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'                  #ルートパスの指定

  resources :tweets do
    resources :comments, only: [:create]
  end

  # resources :tweets     #tweets_controllerに対してのresourcesメソッド

  resources :users, only: [:show]  #users_controllerに対してのresourcesメソッド

  # get  'tweets'     => 'tweets#index'  #ツイート一覧画面
  # get  'tweets/new' => 'tweets#new'    #ツイート投稿画面
  # post 'tweets'     => 'tweets#create' #ツイート投稿機能
  # delete  'tweets/:id'  => 'tweets#destroy' #ツイート削除機能
  # patch   'tweets/:id'  => 'tweets#update' #更新
  # get  'tweets/:id/edit'  => 'tweets#edit' #編集画面遷移ルーティング
  # get  'users/:id'  => 'users#show'    #Mypageへのルーティング
  # get 'tweets/:id' => 'tweets#show'       #ツイート詳細
end
