Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139mW8-0001zC-00
	for mtd-list@infradead.org; Wed, 05 Jul 2000 11:34:56 +0100
Received: from firewall.unidec.co.uk ([195.166.19.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 139mW6-0001z6-00
	for mtd@infradead.org; Wed, 05 Jul 2000 11:34:54 +0100
Received: from frumious.unidec.co.uk (frumious.unidec.co.uk [195.166.20.93])
	by firewall.unidec.co.uk (8.9.3/8.9.3) with ESMTP id LAA10557
	for <mtd@infradead.org>; Wed, 5 Jul 2000 11:34:52 +0100
Received: from localhost (localhost [[UNIX: localhost]])
	by frumious.unidec.co.uk (8.9.3/8.9.3) id LAA27201
	for mtd@infradead.org; Wed, 5 Jul 2000 11:34:52 +0100
From: dr john halewood <john@frumious.unidec.co.uk>
Reply-To: john@frumious.unidec.co.uk
To: mtd@infradead.org
Subject: doc2000 geometry problem?
Date: Wed, 11 Oct 71684 18:46:28 +0100
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <00070511345100.24168@frumious.unidec.co.uk>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I've got a feeling this is going to turn out to be bad hardware but I thought
it would be worth checking first.
  I'm yet another person trying to embed linux using the doc2000 on a
NatSemi-based platform (Geode aka MediaGX - uck). I've got the system up and
running but I've run into a problem (this is with 2.2.16+current mtd cvs). As I
add the modules dmesg looks like this
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.34 2000/06/07 14:48:52 dwmw2 Exp $
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
DiskOnChip 2000 found at address 0xD4000
1 flash chips found. Total DiskOnChip size: 8 Mb
Cannot calculate an NFTL geometry to match size of 0x3c0.
Using C:1024 H:0 S:1 (== 0 sects)
nftla: nftla1
 It turns out that /dev/nftla1 is a FAT12 partition: the people who supplied me
with the board also helpfully put their Wince-based thin client software on the
DOC. Now here's the rub: I can't reformat the doc2000. The nftldump, erase and
nftl_format utils all return an error (-1, helpful that) on the
ioctl(blah,MEMGETINFO,&blah) call, which makes me suspect that there's
something about this chip that's not very healthy. Anyone have any clues or
have I just done something really stupid?

cheers
john


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
