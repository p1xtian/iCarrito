
$(document).ready(function(){
	$.fn.dataTable.ext.errMode = 'none';
});

users_table = null
$(document).on('turbolinks:load', function() {
	users_table = $('#datatable').DataTable({
	    });
});

$(document).on('turbolinks:before-cache', function() {

	$('#datatable_wrapper').length == 1
	 users_table.destroy()
});

