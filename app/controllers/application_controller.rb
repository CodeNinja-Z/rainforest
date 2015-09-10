class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # private methods can only be invoked inside current Controller
  # public methods can be invoked within other Controllers
  private

  def current_user
    # Q: What's the purpose of ||= ?
    # A: ||是 或运算符,如果前面的变量为空,那么就会执行后面的表达式,进行赋值,
    #    只赋值一次,以后运行这段代码的时候,会直接返回@current_user的当前值
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # Q: Session is something that should be at top of a web service
    # A: 这里的session不是自定义的,而是从ActionController::Base
    #    里继承的
  end

  # Purpose of defining helper_method is: To use the method
  # in other Controllers and View (application.html.erb)
  helper_method :current_user

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_session_path
    end
  end
end


# Q: Why define current_user in ApplicationController?
# A: method defined in ApplicationController can be invoked
#    by other user-defined Controllers
#    But if a helper method is defined in a user-defined
#    Controller, that method can't be accessed by other
#    user-defined Controllers？