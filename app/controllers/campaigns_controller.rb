class CampaignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: %i[show edit update destroy dashboard master characters player_dashboard]

  def index
    @user_campaigns = current_user.campaigns.to_a
    @available_campaigns = Campaign.where.not(user: current_user).to_a
  end

  def show
    if @campaign.user == current_user
      redirect_to dashboard_campaign_path(@campaign)
    else
      redirect_to player_dashboard_campaign_path(@campaign)
    end
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
    @characters = @campaign.characters
    # Qualquer outra lógica necessária para o player_dashboard
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
    if @campaign.user != current_user && action_name != 'player_dashboard'
      redirect_to player_dashboard_campaign_path(@campaign) and return
    end
  end

  def campaign_params
    params.require(:campaign).permit(:title, :description)
  end
end
