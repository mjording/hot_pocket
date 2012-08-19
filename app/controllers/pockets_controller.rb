class PocketsController < ApplicationController
  # GET /pockets
  # GET /pockets.json
  def index
    pockets = Pocket.all#.map{|p|p.as_json}
    @pockets = pockets.map{|p|
      pocket = "#{count ||= nil; count.nil? ? '' : ','}{\"picture\": \"#{p.picture}\", \"latitude\": \"#{p.latitude}\", \"longitude\": \"#{p.longitude}\"}#{pockets.last == p ? '' : count ||= ','}"
      }.join(' ')
    render text: "[#{@pockets}]"
  end

  # GET /pockets/1
  # GET /pockets/1.json
  def show
    @pocket = Pocket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pocket }
    end
  end

  # GET /pockets/new
  # GET /pockets/new.json
  def new
    @pocket = Pocket.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pocket }
    end
  end

  # GET /pockets/1/edit
  def edit
    @pocket = Pocket.find(params[:id])
  end

  # POST /pockets
  # POST /pockets.json
  def create
    @pocket = Pocket.new(params[:pocket])

    respond_to do |format|
      if @pocket.save
        format.html { redirect_to @pocket, notice: 'Pocket was successfully created.' }
        format.json { render json: @pocket, status: :created, location: @pocket }
      else
        format.html { render action: "new" }
        format.json { render json: @pocket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pockets/1
  # PUT /pockets/1.json
  def update
    @pocket = Pocket.find(params[:id])

    respond_to do |format|
      if @pocket.update_attributes(params[:pocket])
        format.html { redirect_to @pocket, notice: 'Pocket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pocket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pockets/1
  # DELETE /pockets/1.json
  def destroy
    @pocket = Pocket.find(params[:id])
    @pocket.destroy

    respond_to do |format|
      format.html { redirect_to pockets_url }
      format.json { head :no_content }
    end
  end
end
