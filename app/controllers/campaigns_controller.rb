class CampaignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: %i[show edit update destroy]

  def index
    @campaigns = current_user.campaigns
  end

  def show
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

  private

    def set_campaign
      @campaign = current_user.campaigns.find(params[:id])
    end

    def campaign_params
      params.require(:campaign).permit(:title, :description)
    end
end
