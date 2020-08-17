# frozen_string_literal: true

class Account < ApplicationRecord
  self.table_name = 'account'

  attr_accessor :password

  attribute :expansion, :integer, default: 2

  validates :username, :password, presence: true
  validates :username, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  before_create :generate_sha_pass_hash, if: :valid?

  def update_password(new_password)
    generate_sha_pass_hash(new_password)
    save
  end

  private

  def generate_sha_pass_hash(new_password = password)
    self.sha_pass_hash = Digest::SHA1.hexdigest([username.upcase, new_password.upcase].join(':'))
  end
end
