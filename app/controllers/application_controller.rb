class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    # Q: What's the purpose of ||= ?
    # A: ||是 或运算符···如果前面的变量为空··那么就会执行后面的表达式··进行赋值
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # Q: Session is something that should be at top of a web service
    # How do we access the session hash at here from 
    # sessions_controller.rb when we don't include anything?
  end

  # Why define a private method and use it as helper method
  # WHy not define a public method?
  helper_method :current_user
end


# Q: Why define current_user in ApplicationController?
# A: method defined in ApplicationController can be invoked
#    by other user-defined Controllers
#    But if a helper method is defined in a user-defined
#    Controller, that method can't be accessed by other
#    user-defined Controllers