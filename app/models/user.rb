# encoding: utf-8
#require 'Digest/SHA2'
class User < ActiveRecord::Base
  has_many :relations
  validates_presence_of :name, :message => "用户名不能为空!"
  validates_uniqueness_of :name, :case_sensitive => false, :message => "该用户名已存在!"
  validates_length_of :name, :minimum => 2, :maximum => 6, :message => "用户名长度须为2到6位字母或数字!"

 # attr_accessor :password_confirmation
 # attr_reader :password
 # validate :password_must_be_present

  validates_presence_of :password, :message => "密码不能为空！"
  validates_length_of :password, :minimum => 6, :maximum => 16, :message => "密码长度须为6到16位字母或数字!" 
  
  validates_format_of  :email, :message => "邮箱格式不正确!", :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
 
 # def User.authenticate(name, password)
 #   if user = find_by_name(name)
 #     if user.hashed_password == encrypt_password(password, user.salt)
 #       user
 #      end
 #   end
 # end

 # def User.encrypt_password(password, salt)
 #   Digest::SHA2.hexdigest(password + "wibble" + salt)
 # end
  
 # def password=(password)
 #   @password = password
 #   if password.present?
 #     generate_salt
 #     self.hashed_password = self.class.encrypt_password(password, salt)
 #   end
 # end

 # private
 # def password_must_be_present
 #   error.add(:password,"Missing password") unless hashed_password.present?
 # end
 # def generate_salt
 #   self.salt = self.object_id.to_s + rand.to_s
 # end
end
