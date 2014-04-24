// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require dropzone
$(document).ready(function(){
	var drop_zone;

	drop_zone=new Dropzone("#image_upload",{url: "/photos",enqueueForUpload: true});
	Dropzone.options.drop_zone = {
	  acceptedFiles: "image/*",
	  maxFilesize: 1 // MB
	};
	drop_zone.on("addedfile",function(file){
		if(file.size > 1048576){
			alert("Please check if file size is > 1MB");
			drop_zone.removeFile(file);
		}
	});
	drop_zone.on("sending",function(file,xhr,formData){
		var csrf_token=$('[name="authencity_token"]').attr("value");
		formData.append("authencity_token",csrf_token);
		$('#ajax-loader').show();
		$('#image_upload').fadeTo(400,0.5);
	});
	drop_zone.on("success",function(file,response){
		$('#ajax-loader').hide();
		$('#image_upload').fadeTo(400,1);
	});
	
});
