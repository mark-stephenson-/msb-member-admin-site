class UserController < ApplicationController
  def dashboard
    user = User.find(current_user.id)
    @managed_pages = ManagedPage.where(user_id: user.id)
  end
end
