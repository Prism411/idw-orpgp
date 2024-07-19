class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: %i[new create index edit update]
  before_action :set_character, only: %i[edit update]
  before_action :check_campaign_owner, only: %i[edit update]

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

  def edit
    if @is_owner
      render 'mestre_edit'
    elsif @character.ready
      redirect_to campaign_characters_path(@campaign, ready_alert: true)
    else
      render 'edit'
    end
  end

  def update
    if @character.update(character_params)
      redirect_to campaign_characters_path(@campaign), notice: 'Character was successfully updated.'
    else
      if @is_owner
        render 'mestre_edit'
      else
        render 'edit'
      end
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_character
    @character = @campaign.characters.find(params[:id])
  end

  def check_campaign_owner
    @is_owner = @campaign.user == current_user
  end

  def character_params
    params.require(:character).permit(:name, :description, :history, :height, :intelligence, :strength, :dexterity, :charisma, :constitution, :life, :mana, :status, :ready)
  end
end
