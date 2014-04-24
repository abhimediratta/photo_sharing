module ApplicationHelper
	def spinner_tag
  		#Assuming spinner image is called "spinner.gif"
  		image_tag("ajax-loader.gif", :id => "ajax-loader", :alt => "Loading....", :style => "position:fixed;top:30%;left:45%;display:none;")
	end
end
