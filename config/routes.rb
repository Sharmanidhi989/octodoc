Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  get 'home/index'
  resources :appointments, only: %i[create index] do
    get :fetch_doctors, on: :collection
    get :fetch_patients, on: :collection
  end
  root to: "home#index"
end
