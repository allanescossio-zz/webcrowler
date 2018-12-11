class User
  include Mongoid::Document  
  include ActiveModel::SecurePassword      
   
  field :login_name, type: String
  field :password_digest
  
  has_secure_password
  
  validates_presence_of :login_name
  validates_uniqueness_of :login_name
end