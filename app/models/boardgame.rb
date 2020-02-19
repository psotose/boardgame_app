class Boardgame < ApplicationRecord
    has_many_attached :pieces_images 
    has_one_attached :board_image
    has_one_attached :rules_file
end
