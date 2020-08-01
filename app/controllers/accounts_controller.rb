# frozen_string_literal: true

class AccountsController < ApplicationController
  def create
    @account = Account.new(account_params)
    return head :ok if @account.save

    render json: @account.errors.full_messages, status: :unprocessable_entity
  end

  private

  def account_params
    params.require(:account).permit(:username, :password)
  end
end
