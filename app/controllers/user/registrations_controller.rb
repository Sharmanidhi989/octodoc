# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  respond_to :json
end
