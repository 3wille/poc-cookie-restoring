class DashboardController < ApplicationController
  def index
    log_or_create_cookie
    @cookie = cookies[:resetter]
  end

  private

  def reset_cookie
  end

  def log_or_create_cookie
    reset_cookie = cookies[:resetter]
    if reset_cookie.present?
      Rails.logger.info("Found cookie: #{reset_cookie}")
    else
      set_new_cookie
    end
  end

  def set_new_cookie
    new_cookie = Random.rand
    cookies[:resetter] = new_cookie
    Rails.logger.info("Found no cookie, set: #{new_cookie}")
  end
end
