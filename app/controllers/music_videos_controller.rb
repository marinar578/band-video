class MusicVideosController < ApplicationController
    def new
        @band = Band.find(params[:band_id])
    end

    def create
        @music_video = MusicVideo.create([music_video_params.merge(band_id:(params[:band_id].to_i))])
        redirect_to band_path(params[:band_id])
    end

    def show
        @music_video = MusicVideo.find(params[:id])
    end

    private

    def music_video_params
        params.require(:music_video).permit(:song_title, :video_embed_url)
    end
end
