# encoding: utf-8
class BookType < ActiveRecord::Base
  has_many :books, :foreign_key => "btype_id"
  validates_presence_of :name, :message => "类型不能为空!"
  validates_uniqueness_of :name, :case_sensitive => false, :message => "该类型已存在!"
  validates_length_of :name, :minimum => 2, :maximum => 6, :message => "类型长度须为2到6位字母或数字!"
end
