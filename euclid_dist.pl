#!/usr/bin/perl -w
use warnings;

$first=$ARGV[0];
@arr = split(/\./,$first);
$file = $arr[0];

open(FILE,"$first") or die ("can't open.");
open(WRITE,">$file.euclid_dist_out1.txt") or die ("can't open.");
open(WRITE1,">$file.Alternate_location_indicator.txt") or die ("can't open.");
while($file = <FILE>)
{
         if($file =~ /^ATOM\s+\d+/)
         {
                 $atom_name=substr($file,12,5);    $atom_name =~ s/^\s+//;	$atom_name =~ s/\s+$//;
                 $res_name=substr($file,17,3); 	   $res_name =~ s/^\s+//;	$res_name =~ s/\s+$//;
                 $res_no=substr($file,22,4); 	   $res_no =~ s/^\s+//;		$res_no =~ s/\s+$//;
                 $chain_name=substr($file,21,1);   $chain_name =~ s/^\s+//;	$chain_name =~ s/\s+$//;
                 $x_cor=substr($file,30,8);	   $x_cor =~ s/^\s+//;		$x_cor =~ s/\s+$//;
                 $y_cor=substr($file,38,8);	   $y_cor =~ s/^\s+//;		$y_cor =~ s/\s+$//;
                 $z_cor=substr($file,46,8);	   $z_cor =~ s/^\s+//;		$z_cor =~ s/\s+$//;

		  if($atom_name eq "CA A" or $atom_name eq "CA B")
                  {    
		       @splic= split(/ /, $atom_name);	  
		       $atom_name = join( "", $splic[0],$splic[1]);
		       print WRITE1"$atom_name $res_name $res_no $chain_name\n";
	          }

                  if($atom_name eq "CA" or $atom_name eq "CAA" or $atom_name eq "CAB")
                  {
                      $string = join( " ", $atom_name,$res_name,$res_no,$chain_name,$x_cor,$y_cor,$z_cor);
                      push(@a_file,$string);

		  }      
	}
}

@a_ref=@a_file;
$len=scalar(@a_file);
$len1=scalar(@a_ref);

for($i=0;$i<$len;$i++)
{
	chomp($a_file[$i]);
	@spl= split( / /, $a_file[$i]);
	for($j=0;$j<$len1;$j++)
	{
		 chomp($a_ref[$j]);
		 @spl1= split(/ /, $a_ref[$j]);

		 $el=sqrt((($spl[4]-($spl1[4]))**2) + (($spl[5]-($spl1[5]))**2) + (($spl[6]-($spl1[6]))**2));
		 print WRITE "$spl[0]-$spl[1]-$spl[2]-$spl[3]  $spl1[0]-$spl1[1]-$spl1[2]-$spl1[3]  $el\n";
	}
}

close(FILE);
close(WRITE);
close(WRITE1);
