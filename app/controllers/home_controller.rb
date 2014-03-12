class HomeController < ApplicationController

def index
	if current_user
	@group = Group.get_all_group_members
	@notmygroup= @group - current_user.groups
	@mygroup=current_user.groups
	@test2 =GroupsUsers.all
	@test3 = Transfer.all
    end
end

def newgroup
	if params[:p]
		newgroup = Group.new
		newgroup.groupname = params[:p]
		newgroup.save
	end
	redirect_to index_url
end

def create
	@friend = Friend.new(params[:friend])
	if @friend.save
		render action: "addfriend" 
	else
		render 'signup'
	end
end

def addtogroup
	@data=GroupsUsers.find_all_by_group_id(params[:id])

	@data.each do |f|
		# if current_user.id != @data.user_id
		@trans = Transfer.new
		@trans.user_from = current_user.id
		@trans.user_to = f.user_id
		@trans.group_id = params[:id]
		@trans.save
		# end
	end
	@addtogroup = GroupsUsers.new
 	@addtogroup.user_id = current_user.id
 	@addtogroup.group_id = params[:id]	
 	@addtogroup.save
 	@addtogroup.reload

 	@register = Reason.new
	@register.reason_text = current_user.username
	@register.group_id = params[:id]
	@register.spender_name = "0"
	@register.value = 0
	@register.save
 	redirect_to index_url
end	

def done
	@group = Group.new(params[:group])
	if @group.save
		render action: "addfriend" 
	else
		render 'signup'
	end
end

def share
	p "##############################{params[:q]}"
	if params[:q] && params[:r]
		user_group = Transfer.find_all_by_group_id(params[:group_id])
		value=params[:q].to_f/GroupsUsers.find_all_by_group_id(params[:group_id]).count

		user_group.each do |i| 
			if i.user_from == current_user.id
			i.value += value 
			elsif i.user_to == current_user.id
			i.value -= value
			end
			i.save
		end
	
	@register = Reason.new
	@register.reason_text = params[:r]
	@register.group_id = params[:group_id]
	@register.spender_name = current_user.username
	@register.value = params[:q]
	@register.save
	end
	redirect_to index_url
end

def addbill
	#p "~~~~~~~~~~~#{params[:q]}"
	@result = params[:q]
end

end
