class CooperativesController < ApplicationController
	prepend_before_filter :authenticate_user!
	before_filter :ensure_cooperative_admin
	before_action :set_cooperative, only: [:edit, :update, :admin, :update, :clear]

	def edit
		@activities = @cooperative.activities
	end

	def update
		if @cooperative.update(cooperative_params)
			redirect_to root_path
		else
			render nothing: true, status: 401
		end
	end

	def admin
	end

	def import
		if !params[:file].nil? && params[:file].original_filename.end_with?(".csv")
			Member.import(params[:file], current_user.cooperative_id)
			flash[:success] = "File uploaded. Helge vare gösta"
			redirect_to cooperative_members_path
		else
			flash[:danger] = "No file or wrong file format. Helge vare gösta"
			redirect_to cooperative_admin_path
		end
	end

	def clear
		@cooperative.members.delete_all
		flash[:success] = "All workers deleted. Helge vare gösta"
		redirect_to cooperative_members_path
	end

	private
	def cooperative_params
		params.require(:cooperative).permit(:name)
	end
end
