require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :html

    include CurrentCart
    before_action :set_cart
end
