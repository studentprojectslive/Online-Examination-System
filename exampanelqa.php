<?php
if(!isset($_SESSION)) 
{ 
    session_start(); 
}
include("dbconnection.php");
if(isset($_GET[ansid]))
{
	$sqlans ="UPDATE results SET answerid=$_GET[ansid] WHERE resultid=$_GET[qaid]";
	if(!mysqli_query($con,$sqlans))
	{
		echo mysqli_error($con);
	}
}
//The exam ID should come from session
$examid = $_SESSION[examid];
//Code for total questions
$sqlquestiontot ="SELECT * FROM results where examid=$examid";
$queryquestiontot = mysqli_query($con,$sqlquestiontot);
$totquestion= mysqli_num_rows($queryquestiontot);
if(!isset($_GET[qid]))
{
	$_GET[qid]=0;		
}
			
if(isset($_GET[changeid]))
{
	$resultid = $_GET[qid];
	$sqlquestion ="SELECT @a:=1  AS serial_number,results.*, questions.* FROM results INNER JOIN questions ON results.queid = questions.queid where results.examid=$examid LIMIT $_GET[qid] , 1  ";	
}
else
{
$sqlquestion ="SELECT @a:=1  AS serial_number,results.*, questions.* FROM results INNER JOIN questions ON results.queid = questions.queid where results.examid=$examid LIMIT $_GET[qid] , 1  ";			
}
$queryquestion = mysqli_query($con,$sqlquestion);
$fetchquestion = mysqli_fetch_array($queryquestion);
$resultid=$fetchquestion[resultid];
?>

<table width="931" height="240" border="1"   class="tftable">
<input type="hidden" name="queid" value="1" />
  <tr>
    <td width="83" rowspan="7"><strong>
<?php
 $questionpreid = $_GET[qid]-1; 
echo "<input type=button name=btnpre value=<< Previous onclick=changequestion($questionpreid) ";
	if($questionpreid<0)
	{
		echo  "disabled";
	}
echo ">";
?>
    
    </strong></a></td>
    <td style="font-size: 15px;">&nbsp;<strong>Question No</strong></td>
    <td style="font-size: 15px;">&nbsp;<?php echo $_GET[qid]+1; ?></td>
    <td width="57" rowspan="7">
<?php
$questionnextid = $_GET[qid]+1;
echo "<input type=button name=btnnext value=Next >> onclick=changequestion($questionnextid) ";
	if($questionnextid>=$totquestion)
	{
		echo  "disabled";
	}
echo ">";
?>        
    </td>
  </tr>
  <tr>
    <td width="150" style="font-size: 15px;"><strong>&nbsp;Question</strong></td>
    <td style="font-size: 15px;">&nbsp;<?php echo $fetchquestion[question]; ?></td>
    </tr>
  <tr>
    <td style="font-size: 15px;"><strong>&nbsp;Option A</strong></td>
    <td style="font-size: 15px;"><label><input type="radio" name="option" id="option" value="1" onclick="updateanswer(<?php echo $_GET[qid]; ?>,<?php echo $resultid; ?>,this.value)" 
    <?php
		if($fetchquestion[answerid] == 1)
		{
			echo "checked=checked";
		}
	?>
    />
     <?php echo $fetchquestion[option1]; ?></label></td>
    </tr>
  <tr>
    <td style="font-size: 15px;"><strong>&nbsp;Option B</strong></td>
    <td style="font-size: 15px;"><label><input type="radio" name="option" id="option" value="2" onclick="updateanswer(<?php echo $_GET[qid]; ?>,<?php echo $resultid; ?>,this.value)" 
    <?php
		if($fetchquestion[answerid] == 2)
		{
			echo "checked=checked";
		}
	?>/> 
	<?php echo $fetchquestion[option2]; ?></label></td>
    </tr>
  <tr>
    <td style="font-size: 15px;"><strong>&nbsp;Option C</strong></td>
    <td style="font-size: 15px;"><label><input type="radio" name="option" id="option" value="3" onclick="updateanswer(<?php echo $_GET[qid]; ?>,<?php echo $resultid; ?>,this.value)" 
    <?php
		if($fetchquestion[answerid] == 3)
		{
			echo "checked=checked";
		}
	?>/>  
	<?php echo $fetchquestion[option3]; ?></label></td>
    </tr>
    <tr>
      <td style="font-size: 15px;"><strong>&nbsp;Option D</strong></td>
    <td style="font-size: 15px;"><label><input type="radio" name="option" id="option" value="4" onclick="updateanswer(<?php echo $_GET[qid]; ?>,<?php echo $resultid; ?>,this.value)" 
    <?php
		if($fetchquestion[answerid] == 4)
		{
			echo "checked=checked";
		}
	?>/> 
	<?php echo $fetchquestion[option4]; ?></label></td>
    </tr>
  <tr>
    <td style="font-size: 15px;">&nbsp;<strong>Hints or Description</strong></td>
    <td style="font-size: 15px;">
    <?php echo $fetchquestion[description]; ?><br />
    <?php
	if($fetchquestion[uploads] != "")
	{
    echo "<img src=uploads/$fetchquestion[uploads] height=175 width=250 />";
	}
	?>
	
    </td>
  </tr>
</table>
<hr>
<table  class="tftable" border="1"  width="100%">
<tr>
<td><center>
<?php
echo "Total Questions: ". $totquestion. "<br>"; 
for($i=0; $i<$totquestion; $i++)
{
	$j= $j+1;
	echo "&nbsp;<input type=button	onclick=changequestion($i) value=$j > | ";
}
?></center>
</td>
</tr>
</table><hr>
<script>
function changequestion(qid)
{

	if (window.XMLHttpRequest)
  	{// code for IE7+, Firefox, Chrome, Opera, Safari
  	xmlhttp=new XMLHttpRequest();
  	}
	else
  	{// code for IE6, IE5
  	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
		document.getElementById("exampanel").innerHTML=xmlhttp.responseText;
		}
  	}
xmlhttp.open("GET","exampanelqa.php?qid="+qid+"&changeid=1",true);
xmlhttp.send();
}

function updateanswer(qid,qaid,ansid)
{

if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("exampanel").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","exampanelqa.php?qid="+qid+"&qaid="+qaid+"&ansid="+ansid,true);
xmlhttp.send();

}
</script> 