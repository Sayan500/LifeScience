#!/usr/bin/perl -w
use warnings;

$first=$ARGV[0];
open(FILE,"$first") or die ("can't open.");
open (OUT,">out.txt");

sub Sort_hash
{
        ($r)=($a=~/[A-Z]\.(\d+)\.[A-Z]+/);
        ($s)=($b=~/[A-Z]\.(\d+)\.[A-Z]+/);
        $r <=> $s;
}

while($a=<FILE>)
{
	if($a=~/^ATOM\s+\d+\s+\w+/)
	{
		
		$res_name=substr($a,17,3);$res_name =~ s/^\s+//;$res_name =~ s/\s+$//;
		$res_num=substr($a,22,5);$res_num =~ s/^\s+//;$res_num =~ s/\s+$//;
		$chain=substr($a,21,1);
		
		if($res_name eq "DA" || $res_name eq "DT" || $res_name eq "DG" || $res_name eq "DC")
		{
			last;
		}
		
		$cnt=$chain.".".$res_num.".".$res_name;
		$amino_num{$cnt}=$chain;
		$cha{$chain}=$_;
	}
}

foreach $_ (sort(keys(%cha)))
{
	push(@c1,$_);
}

$size=scalar(@c1);
for($i=0;$i<=$size-1;$i++)
{
	foreach $amino (sort (keys(%amino_num)))
		{		
			if($amino=~/^$c1[$i]/)
				{
					#	print OUT "$amino\n";
					$count++;$total_count++;
				}
		}
print OUT "Number of Amino acid in chain $c1[$i] is $count\n";
undef $count;				
}
print OUT "\nTotal number of amino acid is $total_count\n";
