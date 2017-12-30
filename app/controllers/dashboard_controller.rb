class DashboardController < ApplicationController
  def index
    log_or_create_cookie
    @cookie = cookies[:resetter]
  end

  private

  def reset_cookie4
    Rails.logger.info("ADDR: #{request.remote_ip}".blue)
  end

  def log_or_create_cookie
    reset_cookie = cookies[:resetter]
    if reset_cookie.present?
      Rails.logger.info("Found cookie: #{reset_cookie}".blue)
      saved_cookie = Cookie.find_by(cookie_string: reset_cookie)
      saved_cookie.update!(address: request.remote_ip)
    else
      try_find_cookie
    end
  end

  def try_find_cookie
    old_cookie = Cookie.find_by(address: request.remote_ip)
    if old_cookie.present?
      old_cookie.update!(address: request.remote_ip)
      cookies[:resetter] = old_cookie.cookie_string
    else
      set_new_cookie
    end
  end

  def set_new_cookie
    new_cookie = Random.rand
    cookies[:resetter] = new_cookie
    Cookie.create(cookie_string: new_cookie, address: request.remote_ip)
    Rails.logger.info("Found no cookie, set: #{new_cookie}".blue)
  end
end
