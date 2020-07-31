# frozen_string_literal: true

class Account < ApplicationRecord
  self.table_name = 'account'

  attr_accessor :password

  validates :username, uniqueness: { case_sensitive: true }

  before_create :generate_sha_pass_hash, if: :valid?

  def generate_sha_pass_hash
    self.sha_pass_hash = Digest::SHA1.hexdigest([username.upcase, password.upcase].join(':'))
  end
end
