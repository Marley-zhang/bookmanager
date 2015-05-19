# encoding: utf-8
class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.order(:name).paginate :page=>params[:page], :per_page => 5, :conditions => ["name like ?", "%#{params[:search]}%"]
    @books = Book.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def select
    user_name = params[:uname]
    books_id = params[:bookid]
    @books = Book.all
    if !user_name.blank? and !books_id.blank?
      u = User.where("name like ?","%" + user_name + "%")
      uids = u.collect {|o| o.id}
      @re = Relation.where("user_id in (?) and book_id = ?", uids, book_id)
    elsif !books_id.blank?
      @re = Relation.where("book_id = ?", books_id)
    end
    render :action => "index"
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user= User.find(params[:id])
    @txt = Relation.where("user_id = ?", @user.id)
   # as = Relation.find_by_user_id(@user.id)
   # book = Book.find(as.book_id)
   # @b_name = book.name
     
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    redirect_to :action => "show"
  end

  # POST /users
  # POST /users.xml
  def create      
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_url,  :notice => "创建成功！") }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_url,  :notice => '用户更新成功！') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

 def addbook
    @user = User.find(params[:id])
    @add = Book.all

    respond_to do |format|
      format.html # addbook.html.erb
      format.xml  { render :xml => @user }
    end
 end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end 
