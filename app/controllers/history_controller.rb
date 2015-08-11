class HistoryController < ApplicationController
  prepend_before_filter :authenticate_user!

  def show
    page = params[:page].nil? ? 1 : params[:page]
    @jobs = current_user.jobs.page(page)
  end
end
