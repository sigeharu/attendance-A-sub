class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user # 上記で定義したuserに対応した
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new # newにレンダリングして表示
    end
  end
  
  def destroy
    log_out
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url # topにURLをリダイレクト
  end
end
