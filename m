Received: from mx-00.sil.at ([62.116.68.196])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A62NP-00075k-QQ
	for <linux-mtd@lists.infradead.org>; Sun, 05 Oct 2003 07:28:19 +0100
Received: from unknown (HELO ikarus.sil.at) ([194.152.178.41])
	(envelope-sender <if@sil.at>)encrypted SMTP
	for <linux-mtd@lists.infradead.org>; 5 Oct 2003 06:27:26 -0000
Date: Sun, 5 Oct 2003 08:25:59 +0200 (CEST)
From: Ingo Flaschberger <if@sil.at>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.GSO.4.56.0310050802220.3023@ikarus.sil.at>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: extract data fom nand_dump / how to get it back into nand_write
 format?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

because of some playing with a sharp zaurus c750 i need following stuff:
extract data from a backup which is made with nand_dump (which already
works)
get the data back to nand (where the only way is the "build in"
nand_write).

what i know till now (from hexdumping):
32 byte at the start of the nand_dump-file
every 16384bytes (first 16384+32) there is a 528 byte block with
"page data"

if i remove this, i have a plain file from there i could dd the
filesystem-images (and mount is already *g*).

small perlprog which do this:
---snip---
#! /usr/bin/perl

# i have a 64mbyte flash (Toshiba TH58512FT
# Manufacture ID: 0x98, Chip ID: 0x76)
# filesize of nand_dump is then:
# 528*4096 +(64*1024*1024) + 16
#                            ^^^ why 16? then the last page-data must be
#				 special? only 512 long?
$filesize=69271568/16;

# i use 16 byte big block.. make the dd faster than with 1 byte blocks
# and the script is still easy

# extract plain flash image
$skip=2;
$seek=0;
for ($i=0;$i<$filesize;$i=$skip) {
        $exec= "dd bs=16 obs=16 ibs=16 if=SYSTC750.DBK ".
		"of=SYSTC750.raw count=1024 skip=$skip seek=$seek \n";
        print $exec;
        system($exec);
        $skip= $skip+1024+33;
        $seek = $seek + 1024;
}

# extract page data
$exec= "dd bs=16 obs=16 ibs=16 if=SYSTC750.DBK of=SYSTC750.pageinfo ".
        	"count=2\n";
system($exec);

$skip=1024+2;
$seek=2;
for ($i=0;$i<$filesize;$i=$skip) {
        $exec= "dd bs=16 obs=16 ibs=16 if=SYSTC750.DBK "
		"of=SYSTC750.pageinfo count=33 skip=$skip seek=$seek \n";
        print $exec;
        system($exec);
        $skip= $skip+1024+33;
        $seek = $seek + 33;
}
---snap---


now i would like to code a programm which could reconstruct the nand_dump
format from the "plain" flash image, that i could move the data back.

and some hints how the paga-data is structured would be very nice (nothing
to see about that in the web).

some more info about partitions in mtd would be nice...
does the mtdparts affect the "page data"?

thnx & bye,
	Ingo

--
we own the fibre; 9.6.98 illiad
