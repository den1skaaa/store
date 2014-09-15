class ItemsController < ApplicationController

	def items
		@items = Item.all
		render text: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br/>")
	end
end
