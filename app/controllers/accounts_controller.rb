# frozen_string_literal: true

class AccountsController < ApplicationController
  def create
    @account = Account.new(account_params)
    return render status: :ok if @account.save

    render json: @account.errors, status: :unprocessable_entity
  end

  private

  def account_params
    params.require(:account).permit(:username, :password)
  end
end
