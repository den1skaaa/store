class ItemsController < ApplicationController

	before_filter :find_item, only: [ :upvote, :update, :destroy, :edit]
	before_filter :check_if_admin, only: [:edit, :new, :update, :destroy, :create]

	def index
		@items = Item.all
	end

	# /items/new GET
	def new
		@item = Item.new
	end

	# /items/id GET
	def show
	  	if 	@item = Item.where(id: params[:id]).first
	  		render "items/show"
	 	 else
	  		render text: "Page not found", status: 404
	  	end
	end

	# /items/id PUT
	def update
		@item.update_attributes(params[:item])
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "edit"
		end
	end

	# /items/id DELETE
	def destroy
		@item.destroy
		redirect_to action: "index"
	end

	# items/id/edit GET
	def edit
	end

	# /items POST
	def create
		@item = Item.create(params[:item])
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "new"
		end
	end

	def upvote	
		@item.increment!(:votes_count)
		redirect_to action: :index
	end

	private

	# Фільтр який описується у вигляді before_filter назва метода, only: [...]
	def find_item
		@item = Item.where(id: params[:id]).first
		render_404 unless @item
	end

	def check_if_admin
		#render_403 unless params[:admin]
	end

end
