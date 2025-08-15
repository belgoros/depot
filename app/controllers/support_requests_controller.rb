class SupportRequestsController < ApplicationController
  allow_unauthenticated_access
  def index
    @support_requests = SupportRequest.all
  end
end
