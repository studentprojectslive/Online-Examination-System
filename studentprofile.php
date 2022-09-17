<?php
include("header.php");
if($_POST[setid] == $_SESSION[setid])
{
   
	  if(isset($_POST[submit]))
  	{

		if(isset($_GET[regno]) || isset($_SESSION[regno]))
		{
			if(isset($_GET[regno]))
			{
				$regno = $_GET[regno];
			}
			else
			{
				$regno = $_SESSION[regno];
			}
		$sql="UPDATE students SET  name=$_POST[name],   dob=$_POST[dateofbirth], address=$_POST[address], contactnumber=$_POST[contactnumber], regno=$_POST[regno] WHERE regno=$regno";		
			if (!mysqli_query($con,$sql))
			  {
				die(Error:  . mysqli_error($con));
			  }
			  else
			  {
				$res =  "<font color=green>Profile updated successfully..</font>";
				$resi=1;
			  }
		}
		else
		{ 
  $text=date("Y-m-d");
$sql="INSERT INTO students (regno,password, name,   dob, address, contactnumber, createdat, courseid,  status) VALUES ($_POST[regno], $_POST[npassword], $_POST[name], $_POST[dateofbirth], $_POST[address], $_POST[contactnumber], $text, $_POST[course], $_POST[status])";

		if(!mysqli_query($con,$sql))
			{
				die(Error:  . mysqli_error($con));
			}
			else
			{
				$res  = "One record is added";
				$resi = 1;
			}
		}
  }
}
$_SESSION[setid]=rand();

if(isset($_SESSION[regno]))
{
$sql="SELECT * FROM students where regno=$_SESSION[regno]";
}
else
{
$sql="SELECT * FROM students where regno=$_GET[regno]";
}
$qres= mysqli_query($con,$sql);
$rs = mysqli_fetch_array($qres);
?>
    <div class="slider_top2">
<h2>Student profile</h2>
    </div>
    <div class="clr"></div>
    <div class="body_resize">
              <div class="body">
              <div class="full">


                <form name="formname" method=post action="" onsubmit="return validation()">
<input type="hidden" name="setid" value="<?php echo $_SESSION[setid]; ?>" />
<table  class="tftable" width="530" border="1">
<?php
if($resi==1)
{
echo "<tr>  <th colspan=2>&nbsp;$res</th>  </tr>";
}
?>
  <tr>
    <th width="220" scope="col">Name</th>
    <td width="294" scope="col">
    <input name="name" type="text" id="name" value="<?php echo $rs[name]; ?>" placeholder="Enter Name"  size="25"/></td> </th>
  </tr>
  
  <tr>
    <th scope="row">Registration No.</th>
    <td>
	<?php
	if(isset($_GET[regno]))
	{
	?>
	<input type="text" name="regno" id="regno" value="<?php echo $rs[regno]; ?>" placeholder="Enter Registration Number" size="25" readonly style="background-color: yellow;" />
	<?php
	}
	else
	{
	?>
	<input type="text" name="regno" id="regno" value="<?php echo $rs[regno]; ?>" placeholder="Enter Registration Number" size="25"/>
	<?php
	}
	?>
	</td> </th>
  </tr></td>

  <tr>
    <th scope="row">Course</th>
    <td>  
	<?php
	$result = mysqli_query($con,"Select * from course where status=Enabled");
	?>
    <select name="course" id="course">
         <?php
		 while($rs1 = mysqli_fetch_array($result))
		 { if($rs[courseid] == $rs1[courseid])
		  {
		  echo "<option value=$rs1[courseid] selected>$rs1[coursename]</option>";
		  }
		 }
		 ?>
       </select>
       </td>
  </tr>
  <tr>
    <th scope="row">Date of birth</th>
    <td><label for="date of birth"></label>
      <input type="date" name="dateofbirth" id="dateofbirth" value="<?php echo $rs[dob]; ?>" /></td>
  </tr>
  <tr>
    <th scope="row">Address</th>
    <td><label for="address"></label>
    <textarea name="address" id="address" cols="40" rows="5" placeholder="Enter Address" ><?php echo $rs[address]; ?></textarea></td>
  </tr>
  <tr>
    <th scope="row">Contact Number    </th>
    <td><label for="contact number"></label>
    <input type="text" name="contactnumber" id="contactnumber" value="<?php echo $rs[contactnumber]; ?>" placeholder="Enter Contact Number"  size="25"/></td>
  </tr>
  <tr>
    <th colspan="2" scope="row"><input type="submit" name="submit" id="submit" value="Submit" /></th>
  </tr>
</table>
</form>
<p>&nbsp;</p>
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
 var alphaExp = /^[a-zA-Z\s]+$/;
		if(formname.name.value=="")
		{
			alert("Please Enter Name...");
			formname.name.focus();
			return false; 
		}
		else if(!formname.name.value.match(alphaExp)){
			alert("Please enter valid character...");
			formname.name.value = "";
			formname.name.focus();
			return false;
		}
		else if(formname.regno.value=="")
		{
			alert("Please Enter Registration Number...");
			formname.regno.focus();
			return false; 
		}
		else if(isNaN(formname.regno.value))
		{
		alert("Registration number not valid..(Like : 201300210221)");
		document.formname.regno.focus();
		return false;
		}
		else if(formname.npassword.value=="")
		{
			alert("Please Enter New Password...");
			formname.npassword.focus();
			return false; 
		}
		else if(formname.cpassword.value=="")
		{
			alert("Please Enter Confirm Password...");
			formname.cpassword.focus();
			return false; 
		}
		else if(formname.cpassword.value!=formname.npassword.value)
		{
			alert("Password and confirm password not matching...");
			formname.cpassword.value == "";
			formname.npassword.value == "";
			formname.cpassword.focus();
			return false; 
		}	
		else if(formname.course.value=="Select")
		{
			alert("Please Enter Course...");
			formname.course.focus();
			return false; 
		}
		else if(formname.dateofbirth.value=="")
		{
			alert("Please Enter Date Of Birth...");
			formname.dateofbirth.focus();
			return false; 
		}
		else if(formname.address.value=="")
		{
			alert("Please Enter Address...");
			formname.address.focus();
			return false; 
		}
		else if(formname.contactnumber.value=="")
		{
			alert("Please Enter Contact Number...");
			formname.contactnumber.focus();
			return false; 
		}
		else if(isNaN(formname.contactnumber.value))
		{
			alert("Enter the valid Mobile Number(Like : 9566137117)");
			formname.contactnumber.focus();
			return false;
		}
		else if((formname.contactnumber.value.length < 9) || (formname.contactnumber.value.length > 11))
		{
			alert(" Your Mobile Number must be 1 to 10 Integers");
			document.formname.contactnumber.select();
			return false;
		}
		else
		{
			return true;
		}
}
	</script>