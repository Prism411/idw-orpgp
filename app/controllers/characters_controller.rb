class CharactersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_campaign, only: %i[new create index]
  
    def new
      @character = @campaign.characters.build
    end
  
    def create
      @character = @campaign.characters.build(character_params)
      @character.user = current_user
  
      if @character.save
        redirect_to campaign_characters_path(@campaign), notice: 'Character was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def index
      @characters = @campaign.characters
    end
  
    private
  
    def set_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end
  
    def character_params
      params.require(:character).permit(:name, :description, :history, :height, :intelligence, :strength, :dexterity, :charisma, :constitution, :life, :mana, :status)
    end
  end
  