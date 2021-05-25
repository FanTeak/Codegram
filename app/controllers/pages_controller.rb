class PagesController < ApplicationController
	def about
		@title = 'About creators page';
		@content = 'Some info about developers';
	end
end
