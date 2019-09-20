# This code will give the complement, reverse complement, RNA sequence, Number of A,T,G,C and length of the of the given DNA sequence. 
#It will also give the number of codons & stop codons and protein sequence for each 3 three reading frame.

%codons=(  "UUU"=>"F","UUC"=>"F","UUA"=>"L","UUG"=>"L","UCA"=>"S","UCU"=>"S","UCC"=>"S","UCG"=>"S","UAU"=>"Y","UAC"=>"Y",
	   "UGU"=>"C","UGC"=>"C","UGG"=>"W","CUU"=>"L","CUC"=>"L","CUA"=>"L","CUG"=>"L","CCU"=>"P","CCC"=>"P","CCA"=>"P",
	   "CCG"=>"P","CAU"=>"H","CAC"=>"H","CAA"=>"Q","CAG"=>"Q","CGU"=>"R","CGC"=>"R","CGA"=>"R","CGG"=>"R","AUU"=>"I",
	   "AUC"=>"I","AUA"=>"I","AUG"=>"M","ACU"=>"T","ACC"=>"T","ACA"=>"T","ACG"=>"T","AAU"=>"N","AAC"=>"N","AAA"=>"K",
	   "AAG"=>"K","AGU"=>"S","AGC"=>"S","AGA"=>"R","AGG"=>"R","GUU"=>"V","GUC"=>"V","GUA"=>"V","GUG"=>"V","GCU"=>"A",
	   "GCC"=>"A","GCA"=>"A","GCG"=>"A","GAU"=>"D","GAC"=>"D","GAA"=>"E","GAG"=>"E","GGU"=>"G","GGC"=>"G","GGA"=>"G",
	   "GGG"=>"G","UAA"=>"stop","UAG"=>"stop","UGA"=>"stop",);
	   	
print"Enter the DNA sequence in Capital letters\n";

chomp($seq=<STDIN>);
$len=length($seq);
$rna=$com=$seq;
$com =~ tr/ATGCatgc/TACGtacg/;
$rev_com=reverse($com);
$rna =~ tr/ATGCatgc/UACGuacg/;
print"\n Original Sequence : $seq\n";
print"\n Length of the sequence : $len\n";
print"\n Complement Sequence : $com\n";
print"\n Reverse complement Sequence : $rev_com\n";
print"\n RNA Sequence : $rna\n\n";
@prot = ( $rna =~ m/.../g );
print"\nFrame 1:@prot\nStop Codon: ";
#print"$prot[1]\n";
$cod=scalar(@prot);

foreach $a1(@prot)
{
	if($a1 eq "UAA" or $a1 eq "UAG" or $a1 eq "UGA" )
	{
		$stop_c+=1; print " $a1 ";
	}
	else
	{
		$stop_c+=0;
	}
}
print"\nNumber of codons : $cod   Number of stop codons:$stop_c\n";
print"Protein sequence for Frame 1: ";			

foreach $a(@prot)
{
	if($a eq "UAA" or $a eq "UAG" or $a eq "UGA" )
	{
		last;
	}
	else
	{
		print"$codons{$a}";
	}
}

@r1=split(//,$rna);
shift(@r1);
$rna1=join('',@r1);
@r2 = ( $rna1 =~ m/.../g );
print"\n\nFrame 2 @r2\nStop Codon: ";
$cod1=scalar(@r2);

foreach $b1(@r2)
{
	if($b1 eq "UAA" or $b1 eq "UAG" or $b1 eq "UGA" )
	{
		$stop_c1+=1; print " $b1 ";
	}
	else
	{
		$stop_c1+=0;
	}
}
print"\nNumber of codons : $cod1   Number of stop codons:$stop_c1\n";
print"Protein sequence for Frame 2: ";

foreach $b(@r2)
{
	if($b eq "UAA" or $b eq "UAG" or $b eq "UGA" )
	{
		last;
	}
	else
	{
		print"$codons{$b}";
	}
}

@r2=split(//,$rna1);
shift(@r2);
$rna2=join('',@r2);

@r3 = ( $rna2 =~ m/.../g );
print"\n\nFrame 3 @r3\nStop Codon: ";

$cod2=scalar(@r3);
foreach $c1(@r3)
{
	if($c1 eq "UAA" or $c1 eq "UAG" or $c1 eq "UGA" )
	{
		$stop_c2+=1;print " $c1 ";
	}
	else
	{
		$stop_c2+=0;
	}
}
print"\nNumber of codons : $cod2   Number of stop codons:$stop_c2\n";
print"Protein sequence for Frame 3: ";
foreach $c(@r3)
{
	if($c eq "UAA" or $c eq "UAG" or $c eq "UGA" )
	{
		last;
	}
	else
	{
		print"$codons{$c}";
	}
}
@res=split(//,$seq);
#print"@res";

foreach (@res)
{
	if($_ eq A or $_ eq a)
	{
		$aa+=1;
	}
	else
	{
		$aa+=0;
	}
	if($_ eq T or $_ eq t)
	{
		$tt+=1;
	}
	else
	{
		$tt+=0;
	}
	if($_ eq G or $_ eq g)
	{
		$gg+=1;
	}
	else
	{
		$gg+=0;
	}
	if($_ eq C or $_ eq c)
	{
		$cc+=1;
	}
	else
	{
		$cc+=0;
	}
}

print"\n\n\nA\tT\tG\tC\n\n";

print"$aa\t$tt\t$gg\t$cc\n";