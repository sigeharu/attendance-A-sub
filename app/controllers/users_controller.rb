class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id]) # ユーザーモデルからidを取り出す= User.find(1)みたいな状況
  end
  
  def new
    @user = User.new # ユーザーオブジェクトを作成し、インスタンス変数に代入します
  end
  
  def create
    @user = User.new(user_params) # Userモデルのnewにuser_paramsの値を受け取り、@userに代入する
    if @user.save #新しく挿入されたインスタンス係数@userを保存する
      log_in @user # 保存成功後、ログインします。
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user # railsではredirect_to user_url(@user)をredirect_to @userに簡略化できる
    else
      render :new #newアクションへ移動
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attribute(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation) # 許可されたカラムのみが含まれたparamsハッシュ
    end
end