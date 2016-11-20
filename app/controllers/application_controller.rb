class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #--********************* 下記を追加 *********************
  before_action :authenticate_user!
  #--******************************************************
  
  # deviseのコントローラを実行する時は「configure_permitted_parameters」メソッドを実行する
#--**************************** 下記を追加 ****************************
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    # 新規作成にname、thumbnail、agreementパラメータを含める
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :thumbnail, :agreement])
  end
#--*******************************************************************

end
