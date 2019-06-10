#! /usr/local/bin/perl -w
####!/usr/bin/env perl
print "Content-type: text/html\n\n";

###### Parsing Page Web sous format text
use LWP::Simple;
use HTML::TreeBuilder;
use HTML::FormatText;
$URL = get("http://www.meteofrance.com/previsions-meteo-france/provence-alpes-cote-dazur/regin12");

$Format = HTML::FormatText -> new;
$TreeBuilder =  HTML::TreeBuilder -> new;
$TreeBuilder -> parse($URL);
$Parsed = $Format -> format($TreeBuilder);
print $Parsed;
###### End Parsing Page Web sous format text

########### Parsing Page Web sous format HTML
print "$URL\n\n";
########### End Parsing Page Web sous format HTML

########### Extraction Element HTML Specific ou Construction d'une arbre html
use HTML::Element;
use HTML::Element;

#$URL = HTML::Element->new('a', href => 'http://www.perl.com/');
#$URL->push_content("The Perl Homepage");
 
#$tag = $URL->tag;
#print "$tag starts out as:",  $URL->starttag, "\n";
#print "$tag ends as:",  $URL->endtag, "\n";
#print "$tag\'s href attribute is: ", $URL->attr('href'), "\n";
 
$links_r = $URL->extract_links();
print "Hey, I found ", scalar(@$links_r), " links.\n";
 
print "And that, as HTML, is: ", $URL->as_HTML, "\n";
$URL = $URL->delete;
########### End Extraction Element HTML Specific ou Construction d'une arbre html

exit;