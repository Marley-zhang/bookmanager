# encoding: utf-8
class HomeController < ApplicationController
  def index
    @mytime=Time.now.strftime("%Y年%m月%d日")
  end
  
  def login
    user = User.authenticate(params[:name], params[:password]) 
      if user  
         session[:user_id] = user.id  
         redirect_to(:action => "index" )  
      else 
         flash.now[:notice] = "无效用户名或密码" 
      end  
  end

end
