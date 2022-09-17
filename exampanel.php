<?php
include("header.php");
include("dbconnection.php");
$qid=0;
?>
<div class="clr"></div>
    <div class="body_resize">
              <div class="body">
              <div class="full">
<?php
$timestamp = time();
$diff = $_SESSION[examtimeduration]*60; //<-Time of countdown in seconds.  ie. 3600 = 1 hr. or 86400 = 1 day.
//MODIFICATION BELOW THIS LINE IS NOT REQUIRED.
$hld_diff = $diff;
if(isset($_SESSION[ts])) {
    $slice = ($timestamp - $_SESSION[ts]);    
    $diff = $diff - $slice;
}

if(!isset($_SESSION[ts]) || $diff > $hld_diff || $diff < 0) {
    $diff = $hld_diff;
    $_SESSION[ts] = $timestamp;
}

//Below is demonstration of output.  Seconds could be passed to Javascript.
$diff; //$diff holds seconds less than 3600 (1 hour);

$hours = floor($diff / 3600) .  : ;
$diff = $diff % 3600;
$minutes = floor($diff / 60) .  : ;
$diff = $diff % 60;
$seconds = $diff;
?>
<table  class="tftable" style="width:100%" >
	<tr>
		<td>
<div id="strclock" >Clock Here!</div>
		</td>
	</tr>
</table>
<script type="text/javascript">
 var hour = <?php echo floor($hours); ?>;
 var min = <?php echo floor($minutes); ?>;
 var sec = <?php echo floor($seconds); ?>

function countdown() {
 if(sec <= 0 && min > 0) {
  sec = 59;
  min -= 1;
 }
 else if(min <= 0 && sec <= 0) {
  min = 0;
  sec = 0;
 }
 else {
  sec -= 1;
 }

 if(min <= 0 && hour > 0) {
  min = 59;
  hour -= 1;
 }

 var pat = /^[0-9]{1}$/;
 sec = (pat.test(sec) == true) ? 0+sec : sec;
 min = (pat.test(min) == true) ? 0+min : min;
 hour = (pat.test(hour) == true) ? 0+hour : hour;

	 if(sec == 0 && min==0)
	 {
		 window.location="examstop.php";
	 }
	 if(sec == 1 && min==0)
	 {
		document.getElementById(strclock).innerHTML = "<centeR><h1>Time Up</h1></center>";	
	 }
	 else
	 {
	 	document.getElementById(strclock).innerHTML = "<centeR><h1>Time remaining: "+hour+":"+min+":"+sec+ "</h1></center>";	
	 }
 setTimeout("countdown()",1000);
 }
 countdown();
</script>  
<form name="form1" method="post" action="" >
<div id="exampanel">
<?php
include("exampanelqa.php");
?>
</div>
<table  class="tftable" style="width:100%" >
  <tr>
    <td style="padding-left: 300px;"><center><a href="examstop.php" onclick="return confirmtoclose()"><img src="images/finishexam.png" width="300" height="50" /></a></center></td>
  </tr>
</table>
</form>
 <div class="bg"></div>
              </div>
        <div class="clr"></div>
      </div>
    </div>
<?php
include("footer.php");
?>
<script>
function confirmtoclose()
{
	if(confirm("Are you sure want to close Exam Panel?") == true)
	{
		return true;
	}
	else
	{
		return false;
	}
}
</script>