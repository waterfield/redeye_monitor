RedeyeMonitor::Application.routes.draw do
  resources :projects do
    resources :workers
  end
end
