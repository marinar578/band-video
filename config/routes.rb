Rails.application.routes.draw do

  root 'bands#index'

  resources :bands do
    resources :music_videos
  end

end
