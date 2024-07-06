class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to dashboard_path  # ou qualquer outra rota desejada
    end
    # Se não estiver logado, simplesmente renderiza a view 'index' que é o comportamento padrão
  end
end
