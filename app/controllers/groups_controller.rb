class GroupsController < ApplicationController
	skip_before_action :require_login, except:[:destroy]

  def index
  	@groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @admin = group.user
    if @group.users.include? current_user 
      render "/groups/show"
    else
      render "/groups/other"
    end
  end

  def other
    @group = Group.find(params[:id])
    @admin = group.user
    render "/groups/other"
  end

  def delete
  	# delete group
    @group = Group.find(params[:id])
    @group.users.delete
    @group.delete
    redirect_to "/groups"
  end

  def join
  	# join a group
    @group = Group.find(params[:id])
    @group.users << current_user
    redirect_to "/groups"
  end

  def leave
  	# leave a group
    @group = Group.find(params[:id])
    @group.users.destroy(current_user)
    redirect_to "/groups"
  end

  def create
  	# create a group
  	@group = Group.create(name: params[:name], description: params[:description], member_count: 1, admin_id: current_user.id)
    if @group.valid?
      # @group.association(current_user)
      # @group.admin_id = current_user.id
      @group.users << current_user
      redirect_to :back
    else
      flash[:alert] = @group.errors.full_messages
      redirect_to :back
    end
  end

  private
  helper_method def group
  	@group ||=Group.find_by_id(params[:id])
  end
    helper_method def admin
    @admin ||=User.find_by_id(params[:id])
  end


end
