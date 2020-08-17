# frozen_string_literal: true

class Account < ApplicationRecord
  self.table_name = 'account'

  attr_accessor :password

  attribute :expansion, :integer, default: 2

  validates :username, :password, presence: true
  validates :username, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  before_save :generate_sha_pass_hash, if: -> { valid? && will_save_change_to_password? }

  def generate_sha_pass_hash
    self.sha_pass_hash = Digest::SHA1.hexdigest([username.upcase, password.upcase].join(':'))
  end
end
