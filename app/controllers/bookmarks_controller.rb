# JSON REST API Bookmarks Controller
class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :check_valid_id, only: [:show, :update]
  skip_before_filter :verify_authenticity_token

  # Check if a Bookmark of that ID exists in DB
  def check_valid_id
    current_user.bookmarks.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Bookmark not found" }, status: 404
  end

  # GET /bookmarks.json
  def index
    @bookmarks = current_user.bookmarks.all
    respond_to do |format|
      format.html { render nothing: true, layout: true }
      format.json { render json: @bookmarks }
    end
  end

  # GET /bookmarks/1.json
  def show
    @bookmark = current_user.bookmarks.where(id: params[:id]).first
    respond_to do |format|
      format.html { render nothing: true, layout: false }
      format.json { render json: @bookmark }
    end
  end

  # GET /bookmarks/new
  def new
    @bookmark = current_user.bookmarks.new
  end

  # GET /bookmarks/1/edit
  def edit
    @bookmark = current_user.bookmarks.find(params[:id])
    render nothing: true, layout: true
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully created.' }
        format.json { render json: { bookmark: @bookmark, notice: 'Bookmark was successfully created.' }, status: :created }
      else
        format.html { render action: :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.title = params[:title]
    @bookmark.url = params[:url]
    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark, notice: 'Task was successfully updated.' }
        format.json { render json: { bookmark: @bookmark, message: 'Task was successfully updated.' }, status: :ok }
      else
        format.html { render action: :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.destroy
    render json: @bookmark, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    return if current_user.bookmarks.where(id: params[:id]).first
    flash[:alert] = 'Bookmark not found.'
    redirect_to root_url
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bookmark_params
    params.require(:bookmark).permit(:title, :url, :user_id, :created_at, :updated_at)
  end
end
