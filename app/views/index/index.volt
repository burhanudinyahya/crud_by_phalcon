<div class="row"><br><br>
	<div class="col-sm-8 col-sm-offset-2">
  		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">New Employee</button><br><br>
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">Full Name</th>
		      <th scope="col">Nick Name</th>
		      <th scope="col">Email</th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  <tbody>
		  	{% for r in emp %}
		    <tr>
		      <td>{{r.emp_fullname}}</td>
		      <td>{{r.emp_nickname}}</td>
		      <td>{{r.emp_email}}</td>
		      <td>
      			<a href='#exampleModal' class='btn btn-info btn-small' id='editId' data-toggle='modal' data-id="{{r.emp_id}}">Edit</a>
      			<a href='#deleteModal' class='btn btn-danger btn-small' id='deleteId' data-toggle='modal' data-id="{{r.emp_id}}">Delete</a>
		      </td>
		    </tr>
		    {% endfor %}
		  </tbody>
		</table>
	</div>
</div>

<!-- Form Employee -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">Form Employee</h4>
      </div>
      <div class="modal-body">
        <form id="frmEmployee">
		  <div class="form-group">
		    <label for="InputName">Full name</label>
		    <input type="hidden" id="emp_id" name="emp_id">
		    <input type="text" class="form-control" id="emp_fullname" name="InputName" placeholder="Enter full name">
		  </div>	  
		  <div class="form-group">
		    <label for="InputNick">Nick name</label>
		    <input type="email" class="form-control" id="emp_nickname" name="InputNick" placeholder="Enter nick name">
		  </div>	  
		  <div class="form-group">
		    <label for="InputEmail">Email address</label>
		    <input type="email" class="form-control" id="emp_email" name="InputEmail" placeholder="Enter email">
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" onclick="saveEmployee()" class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>
<!-- Form Employee -->

<!-- Prompt Deletion -->
<div class="modal fade" id="deleteModal" role="dialog">
	<div class="modal-dialog modal-sm">
	  <div class="modal-content">
	    <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal">&times;</button>
	      <h4 class="modal-title">Warning !</h4>
	    </div>
	    <div class="modal-body">
	    	<input type="hidden" id="emp_id_d" name="emp_id_d">
	      	<p>Are you sure to delete this employee ?</p>
	    </div>
	    <div class="modal-footer">
	     	<button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
        	<button type="button" onclick="deleteEmployee()" class="btn btn-primary">Yes</button>
	    </div>
	  </div>
	</div>
</div>
<!-- Prompt Deletion -->

<script>
$(document).ready(function(){
	$('#exampleModal, #deleteModal').on('shown.bs.modal', function (e) {
		var id = $(e.relatedTarget).data('id');
		if(! id){
			$('#emp_id').val('');
	    	$('#emp_id_d').val('');
	    	$('#emp_fullname').val('');
	    	$('#emp_nickname').val('');
	    	$('#emp_email').val('');
		}else{
			$.ajax({
			    type : 'post',
			    url : 'employee/edit',
			    data :  'id='+ id,
			    success : function(res){
			    	var obj = JSON.parse(res);

			    	$('#emp_id').val(obj.emp_id);
			    	$('#emp_id_d').val(obj.emp_id);
			    	$('#emp_fullname').val(obj.emp_fullname);
			    	$('#emp_nickname').val(obj.emp_nickname);
			    	$('#emp_email').val(obj.emp_email);
			    }
			});
		}
	});

});

function saveEmployee(){
	var obj;

	if($('#emp_fullname').val().trim() == ''){
		$('#emp_fullname').focus();
		return false;
	}

	if($('#emp_nickname').val().trim() == ''){
		$('#emp_nickname').focus();
		return false;
	}	

	if($('#emp_email').val().trim() == ''){
		$('#emp_email').focus();
		return false;
	}

	$.post( "employee/save", $( "#frmEmployee" ).serialize(), function(res){
		obj = JSON.parse(res);
		if(obj.return){
			$('#exampleModal').modal('hide');
			location.reload();
		}else{
			alert(obj.msg);
		}
	});
	
}

function deleteEmployee(){
	var obj, id = $('#emp_id_d').val();

	$.post( "employee/delete", {emp_id:id}, function(res){
		obj = JSON.parse(res);
		if(obj.return){
			$('#deleteModal').modal('hide');
			location.reload();
		}else{
			alert(obj.msg);
		}
	});	
}

</script>