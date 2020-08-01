# frozen_string_literal: true

class RealmlistController < ApplicationController
  def show
    @realmlist = Realmlist.first
    render json: { name: @realmlist.name, address: @realmlist.address, port: @realmlist.port }
  end
end
