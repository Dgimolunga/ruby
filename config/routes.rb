Rails.application.routes.draw do
  scope controller: :say, path: :say do
    get :hello
    get :goodbye
  end

  root to: 'say#hello'
end
