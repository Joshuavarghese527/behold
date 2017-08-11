class PrayersController < ApplicationController
  before_action :set_prayer, only: [:show, :edit, :update, :destroy]

 def index
  @prayers = Prayer.all
 
  respond_to do |format|
    format.html  # index.html.erb
    format.json  { render :json => @prayers }
  end
end

  def show
  @prayer = Prayer.find(params[:id])
 
  respond_to do |format|
    format.html  # show.html.erb
    format.json  { render :json => @prayer }
  end
end

  def new
  @prayer = Prayer.new
 
  respond_to do |format|
    format.html  # new.html.erb
    format.json  { render :json => @prayer }
  end
end

  def edit
  @prayer = Prayer.find(params[:id])
end

def create
  @prayer = current_user.prayer.build(prayer_params)
 
  respond_to do |format|
    if @prayer.save
      format.html  { redirect_to(@prayer,
                    :notice => 'Prayer was successfully created.') }
      format.json  { render :json => @prayer,
                    :status => :created, :location => @prayer }
    else
      format.html  { render :action => "new" }
      format.json  { render :json => @prayer.errors,
                    :status => :unprocessable_entity }
    end
  end
end

  # PATCH/PUT /prayers/1
  # PATCH/PUT /prayers/1.json
  def update
    respond_to do |format|
      if @prayer.update(prayer_params)
        format.html { redirect_to @prayer, notice: 'Prayer was successfully updated.' }
        format.json { render :show, status: :ok, location: @prayer }
      else
        format.html { render :edit }
        format.json { render json: @prayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prayers/1
  # DELETE /prayers/1.json
  def destroy
    @prayer.destroy
    respond_to do |format|
      format.html { redirect_to prayers_url, notice: 'Prayer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prayer
      @prayer = Prayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prayer_params
      params.require(:prayer).permit(:content, :user_id)
    end
end
