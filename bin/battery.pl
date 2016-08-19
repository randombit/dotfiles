#!/usr/bin/perl

my $bat=`/bin/acpi`;
chomp $bat;

my $msg_out = '';

if ($bat =~ "Battery 0: ([A-Za-z]+), ([0-9]+)\%, ([0-9:]+)") {
  # Battery 0: Charging, 82%, 00:28:23 until charged
  my $status = $1;
  my $pcnt = $2;
  my $time = $3;

  if ( $status eq "Charging" or $status eq "Charged" ) {
     $msg_out = "Battery $status $pcnt% $time left";
  }
  elsif ( $status == "Discharging") {
     #`ratpoison -c "echo Battery $status $pcnt% $time left"`;

     if ($time =~ "([0-9][0-9]):([0-9][0-9]):([0-9][0-9])") {
       my $hour = $1;
       my $min = $2;

       if ($hour == 0 && $min < 30) {
          unless (-f '/tmp/.nosuspend') { `sudo systemctl suspend`;  }
       }
       if ($hour < 2) {
          $msg_out = "WARNING LOW BATTERY $status $pcnt% $time remaining";
       }
       else {
          $msg_out = "$status $pcnt% $time remaining";           
       }
     }
     else {
       $msg_out = "Strange $bat\n";
     }
  }
  else {
     $msg_out = "Unrecognized $bat";
  }
}
else {
   $msg_out = "Unsual $bat";
}

`ratpoison -c "echo $msg_out"`;
