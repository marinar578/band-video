class BandsController < ApplicationController

    def index
        @bands = Band.all.order('currently_relevant DESC')
    end

    def show
        @band = Band.find(params[:id])
        @music_videos = MusicVideo.where("band_id = ?", params[:id])
    end

    def new
    end

    def create
        @band = Band.new(band_params)
        @band.save
        redirect_to @band
    end

    def edit
        @band = Band.find(params[:id])
    end

    def update
        @band = Band.find(params["id"])
   
        if @band.update(params["band"].permit(:name, :genre, :currently_relevant))
            redirect_to band_path
        else
            render 'edit'
        end
    end

    private
        def band_params
            params.require(:band).permit(:name, :genre, :currently_relevant)
        end


end
