class CreateMusicVideos < ActiveRecord::Migration
  def change
    create_table :music_videos do |t|
      t.string :song_title
      t.integer :band_id
      t.string :video_embed_url

      t.timestamps null: false
    end
  end
end
