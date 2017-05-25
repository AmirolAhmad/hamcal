class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  attr_accessor :login

  validates :callsign,
    presence: true,
    uniqueness: {
      case_sensitive: false
  }
  validate :validate_callsign

  # jwt api start
  def to_token_payload
    {
      sub: id,
      callsign: callsign,
      email: email
    }
  end

  # make knock jwt compatible with devise
  alias_method :authenticate, :valid_password?
  def self.from_token_payload payload
    self.find payload["sub"]
  end
  # jwt api end

  def validate_callsign
    if User.where(email: callsign).exists?
      errors.add(:callsign, :invalid)
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(callsign) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      if conditions[:callsign].nil?
        where(conditions).first
      else
        where(callsign: conditions[:callsign]).first
      end
    end
  end
end
