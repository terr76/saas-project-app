class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index ]

  def index
    if current_user
      if session[:tennant_id]
        Tenant.set_current_tenant session[:tennant_id]
      else
        Tenant.set_current_tenant current_user.tenants.first
      end

      @tenant = Tenant.current_tenant
      params[:tennant_id] @tenant.id
    end
  end
end
