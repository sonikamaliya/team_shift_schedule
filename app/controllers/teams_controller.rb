class TeamsController < ApplicationController
  
  before_action :set_team, only: [:edit, :update, :destroy, :team_member, :get_member]

  def index
    @team = Team.new
    @team_member = TeamMember.new
    @teams = Team.all
  end

  def new
  end

  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        flash[:notice] = "Team created successfully..!"
        format.json { render json: @team } 
      else
        flash[:notice] = "Team dosen't created...!"
      end
    end
  end

  def edit
  end

  def update
    if @team.update_attributes(tname: params[:team][:tname]) 
      flash[:notice] = "Team is updated..!"
      redirect_to teams_path
    else
      render 'edit'
    end
  end

  def destroy
    @team.destroy   
    flash[:notice] = "Team deleted successfully...!"
    redirect_to teams_path
  end

  def get_member
    @users = User.all
    @team_member = @team.team_members.new
  end

  def team_member
    @team_member = @team.team_members.create(team_id: @team.id, user_id: params[:team_member][:user_id])
    if @team_member.save
      flash[:notice] = "Team member added successfully."
    else
      flash[:error] = "Team member dosen't added."
    end
  end

  private

  def team_params
    params.require(:team).permit(:tname)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
