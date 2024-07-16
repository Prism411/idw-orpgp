class CampaignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: %i[show edit update destroy dashboard master characters]

  def index
    @campaigns = current_user.campaigns
  end

  def show
    redirect_to dashboard_campaign_path(@campaign)
  end

  def new
    @campaign = current_user.campaigns.build
  end

  def edit
  end

  def create
    @campaign = current_user.campaigns.build(campaign_params)

    if @campaign.save
      redirect_to @campaign, notice: 'Campaign was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @campaign.update(campaign_params)
      redirect_to @campaign, notice: 'Campaign was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @campaign.destroy
    redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.'
  end

  def dashboard
  end

  def master
    # Lógica para mestrar a campanha
  end

  def characters
    @characters = @campaign.characters
    # Renderize a view para exibir os personagens
  end

  def player_dashboard
    @campaign = find_campaign
    # Lógica para exibir o dashboard do jogador
  end

  private

  def set_campaign
    @campaign = current_user.campaigns.find_by(id: params[:id])
    unless @campaign
      @campaign = find_campaign
      redirect_to player_dashboard_path(@campaign) and return unless @campaign.user_id == current_user.id
    end
  end

  def find_campaign
    Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:title, :description)
  end
end
