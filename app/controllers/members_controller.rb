class MembersController < ApplicationController
  before_action :set_member, only: %i[ show update destroy ]

  # GET /members
  def index
    @members = Member.all

    render json: @members
  end

  # GET /members/1
  def show
    render json: @member
  end

  # POST /members
  def create
    @member = Member.new(member_params)

    if @member.save
      head 201
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find_by(id: params[:id])
    render json: { error: 'Member not found' }, status: :unprocessable_entity unless @member
  end

  # Only allow a list of trusted parameters through.
  def member_params
    params.permit(:name, :email, :bio, :avatar, :github_url, :website_url, :linkedin_url)
  end
end
