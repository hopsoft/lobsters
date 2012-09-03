class SignupController < ApplicationController
  def index
    if @user
      flash[:error] = "You are already signed up."
      return redirect_to "/"
    end

    @title = "Signup"
    @page_title = "Create an Account"
  end

  def invited
    if @user
      flash[:error] = "You are already signed up."
      return redirect_to "/"
    end

    @title = "Signup"
    @page_title = "Create an Account"

    if !(@invitation = Invitation.find_by_code(params[:invitation_code]))
      flash[:error] = "Invalid or expired invitation"
      return redirect_to "/signup"
    end

    @new_user = User.new
    @new_user.email = @invitation.email

    render :action => "invited"
  end

  def signup
    if !(@invitation = Invitation.find_by_code(params[:invitation_code]))
      flash[:error] = "Invalid or expired invitation."
      return redirect_to "/signup"
    end

    @new_user = User.new(params[:user])
    @new_user.invited_by_user_id = @invitation.user_id

    if @new_user.save
      @invitation.destroy
      session[:u] = @new_user.session_token
      flash[:success] = "Welcome to Lobsters, #{@new_user.username}!"

      Countinual.count!("lobsters.users.created", "+1")

      return redirect_to "/"
    else
      render :action => "invited"
    end
  end
end
