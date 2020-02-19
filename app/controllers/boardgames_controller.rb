class BoardgamesController < ApplicationController
  before_action :set_boardgame, only: [:show, :edit, :update, :destroy, :delete_image]

  # GET /boardgames
  # GET /boardgames.json
  def index
    @boardgames = Boardgame.all
  end

  # GET /boardgames/1
  # GET /boardgames/1.json
  def show
  end

  # GET /boardgames/new
  def new
    @boardgame = Boardgame.new
  end

  # GET /boardgames/1/edit
  def edit
  end

  # POST /boardgames
  # POST /boardgames.json
  def create
    @boardgame = Boardgame.new(boardgame_params)

    respond_to do |format|
      if @boardgame.save
        format.html { redirect_to @boardgame, notice: 'Boardgame was successfully created.' }
        format.json { render :show, status: :created, location: @boardgame }
      else
        format.html { render :new }
        format.json { render json: @boardgame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boardgames/1
  # PATCH/PUT /boardgames/1.json
  def update
    respond_to do |format|
      if @boardgame.update(boardgame_params)
        format.html { redirect_to @boardgame, notice: 'Boardgame was successfully updated.' }
        format.json { render :show, status: :ok, location: @boardgame }
      else
        format.html { render :edit }
        format.json { render json: @boardgame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boardgames/1
  # DELETE /boardgames/1.json
  def destroy
    @boardgame.destroy
    respond_to do |format|
      format.html { redirect_to boardgames_url, notice: 'Boardgame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_image
    begin
      @image = ActiveStorage::Attachment.find(params[:image_id])
      @image.purge
      redirect_to post_path(@post), notice: 'Imagen eliminada con éxito'
    rescue ActiveRecord::RecordNotFound
      redirect_to post_path(@post), alert: 'Error al eliminar la imagen'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boardgame
      @boardgame = Boardgame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def boardgame_params
      params.require(:boardgame).permit(:name, :rules, pieces_images: [], boards_images: [])
    end
end
