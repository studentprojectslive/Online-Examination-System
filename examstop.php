<?php
include("header.php");
//The exam ID should come from session
$sqlqexam ="SELECT * FROM exam where examid=$_SESSION[examid]";
$quexam = mysqli_query($con,$sqlqexam);
$tqexam= mysqli_fetch_array($quexam);
$sqlqcertificate ="SELECT * FROM certificate where examid=$_SESSION[examid] 	AND regno=$tqexam[regno]";
$qcertificate = mysqli_query($con,$sqlqcertificate);
if(mysqli_num_rows($qcertificate) == 0)
{
	$sqlinscertificate = "INSERT INTO certificate(examid,regno,scoredmarks,result,datetime,status) VALUES($_SESSION[examid],$tqexam[regno],0,0,$tqexam[datetime],Active)";
	$qsqlcerificateins = mysqli_query($con,$sqlinscertificate);
}
?>

    <div class="clr"></div>
    <div class="body_resize">
              <div class="body">
              <div class="left">             
                <p align="center">&nbsp;
                <?php
$timestamp = time();
$diff = 1122; 
//<-Time of countdown in seconds.  ie. 3600 = 1 hr. or 86400 = 1 day.

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
<div id="strclock">Clock Here!</div>

<script type="text/javascript">
 var hour = <?php  echo floor($hours);  ?>;
 var min = <?php echo floor($minutes); ?>;
 var sec = <?php echo floor($seconds); ?>;
 var timer = <?php echo floor($timer); ?>;
function countdown()
{
	 timer = "start";
	 if(sec <= 0 && min > 0)
	 {
	  sec = 59;
	  min -= 1;
	 }
	 else if(min <= 0 && sec <= 0)
	 {
	  min = 0;
	  sec = 0;
	 }
	 else 
	 {
	  sec -= 1;
	 }
 
	 if(min <= 0 && hour > 0)
	 {
	  min = 59;
	  hour -= 1;
	 }
	 
	 var pat = /^[0-9]{1}$/;
	 sec = (pat.test(sec) == true) ? 0+sec : sec;
	 min = (pat.test(min) == true) ? 0+min : min;
	 hour = (pat.test(hour) == true) ? 0+hour : hour;
	 
	 if(sec == 0)
	 {
		 self.location="result.php?examid=<?php echo $_SESSION[examid]; ?>";
	 }
	 else
	 {
	 	document.getElementById(strclock).innerHTML = "<h1>Calculating Examination result </h1> <h2>Please wait  "+sec+" seconds</h2>";	
	 }
	 setTimeout("countdown()",1000);
 }
 countdown();
</script>
                </p>
             
              </div>
        
         <div class="right">
         </div>
         
        <div class="clr"></div>
      </div>
    </div>
<?php
include("footer.php");
?>