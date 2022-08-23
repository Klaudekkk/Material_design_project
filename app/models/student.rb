class Student < ApplicationRecord
  validates :name, presence: true, length: {minimum: 5, maximum:50}
  validates :email, presence:true, format: {with: /@/}, uniqueness: {case_sensitive: false}, length: {maximum: 105}
  has_secure_password
end