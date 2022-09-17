<?php
include("header.php");
if(!isset($_SESSION[regno]))
{
	header("Location: index.php");
}
?>
     <div class="slider_top2">
<h2>My Account</h2>

    </div>
    <div class="clr"></div>
    <div class="body_resize">
              <div class="body">
              <div class="full">
              <h2 class="about"> My Account</h2>
              <p>
			  
<table class="tftable" style="width: 100%;">
	<tr>
		<td><center><h2><a href="studentprofile.php">My Profile</a></h2></center></td>
		<td><center><h2><a href="reset.php">Change Password</a></h2></center></td>
		<td><center><h2><a href="examtimetable.php">Exam Time Table</a></h2></center></td>
	</tr>	
	<tr>
		<td><center><h2><a href="attendexam.php">Attend Exam</a></h2></center></td>
		<td><center><h2><a href="userExamresult.php">Exam Result</a></h2></center></td>
		<td><center><h2><a href="userexamcertificate.php">Exam Certificate</a></h2></center></td>
	</tr>
</table>  
			  
			  </p>
              <div class="bg"></div>
              </div>
        
         
        <div class="clr"></div>
      </div>
    </div>
<?php
include("footer.php");
?>