<?php
include("header.php");
if(isset($_POST[changepassword]))
{
$sql = "UPDATE students SET password=$_POST[password] where regno=$_SESSION[regno]";
		if(!mysqli_query($con,$sql))
		{
			die(Error:  . mysqli_error($con));
		}
		else
		{
			echo "<script>alert(Password updated successfully...);</script>";
			echo "<script>window.location=reset.php;</script>";
		}
}
?>
    <div class="slider_top2">
<h2>Change Password</h2>
    </div>
    <div class="clr"></div>
    <div class="body_resize">
              <div class="body">
              <div class="left">
               <p>
                  <form name="formname" method="post" action="" onsubmit="return validation()">
<table  class="tftable" width="464" height="25%" border="1">
  <tr>
    <th width="166" height="37%" scope="col">Old Password</th>
    <td width="144" scope="col">
    <input name="opassword" type="Password" id="opassword" size="30" placeholder="Enter Old Password"></td>
  </tr>
  <tr>
    <th height="20%" scope="row">New Password</th>
    <td><label for="new password"></label>
    <input name="password" type="password" id="password" size="30" placeholder="Enter New Password"></td>
  </tr>
  <tr>
    <th height="20%" scope="row">Confirm Password</th>
    <td><label for="password"></label>
    <input name="cpassword" type="password" id="cpassword" size="30" placeholder="Enter Confirm Password"></td>
  </tr>
  <tr>
    <th height="23%" colspan="2" scope="row"><input type="Submit" name="changepassword" id="changepassword" value="Change password"></th>
  </tr>
</table> 
</form>
 
               </p>
<p>&nbsp;</p>
<p>&nbsp;</p>
              </div>
        
         <div class="right">
          <?php
		  include("usersidebar.php");
		  ?>
         </div>
         
        <div class="clr"></div>
      </div>
    </div>
<?php
include("footer.php");
?>
<script type="application/javascript">
function validation()
{ 

	if(formname.opassword.value=="")
	{
		alert("Old Password should not be empty...");
		formname.opassword.focus();
		return false;
	}
	if(formname.password.value=="")
	{
		alert("Please Enter New Password...");
		formname.password.focus();
		return false;
	}
	if(formname.cpassword.value=="")
	{
		alert("Please Enter Confirm Password...");
		formname.cpassword.focus();
		return false;
	}
	else
	{
		return true;
	}
	}

</script>