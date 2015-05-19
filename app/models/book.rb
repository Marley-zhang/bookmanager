# encoding: utf-8
class Book < ActiveRecord::Base
  belongs_to :book_type, :foreign_key => "btype_id"
  has_many :relations

  validates_presence_of :name, :message => "图书名不能为空!"
  validates_uniqueness_of :name, :case_sensitive => false, :message => "该书已存在!"
  validates_length_of :name, :minimum => 1, :maximum => 8, :message => "书名长度须为1到8位字母或数字!"
  
  validates_presence_of :desc, :message => "描述不能为空!"
end
