Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JQ15-00050U-00
	for mtd-list@infradead.org; Tue, 01 Aug 2000 01:34:43 +0100
Received: from [203.67.208.2] (helo=fw11.sis.com.tw)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13JQ14-00050B-00
	for mtd@infradead.org; Tue, 01 Aug 2000 01:34:42 +0100
Message-ID: <398619F3.6422BCEB@sis.com.tw>
Date: Tue, 01 Aug 2000 08:29:40 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: Patrick Higgins <phiggins@transzap.com>, mtd@infradead.org
Subject: Re: nftl and multi page read write support
References: <Pine.LNX.4.21.0007311121400.32307-100000@phiggins.transzap.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=big5
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Patrick Higgins wrote:
> 
> On Mon, 31 Jul 2000, David Woodhouse wrote:
> 
> > rogelio@evoserve.com said:
> > > David - NFTL support is safe with the multipage read-write support. I
> > > have a system running on ext2 on nftl and it is stable.
> >
> > Cool - you mean not only does it _not_ break it, but it magically makes it
> > stable too?
> 
> Unless you've made some changes to NFTL (you were just verifying that your
> DoC2000 changes *didn't* break NFTL, right?) then NFTL still has some
> problems.  I'm having trouble finding time to look into the cause, but
> while I am able to read and write from a preexisting NFTL partition, I'm
> unable to make changes to it.  Using M-Systems' dformat utility from
> dosemu makes a single FAT partition.  When I try to use fdisk to toggle it
> to a Linux partition, things seem to go normally, but then when I run it
> again, the partition still shows up as FAT.  mke2fs also seems to complete
> successfully, but doesn't actually make changes.  However, mounting the
> FAT partition, touching a few files, unmounting, *rebooting*, and mounting
> again shows that the changes were permanent.  I have no idea what's
> wrong--but I assume, as David has pointed out, that something is probably
> wrong with the block device setup and/or partition table setup.  I'll look
> into it when I get the chance.
> 

One potential problem I just found and discussed with David. Currently the MTD
driver (doc2000.c doc2001.c) is hardcoded with Erase Block == 8kB but actually
very few nand flash chips in the M-System DoC 2000 are in 8kB block, most of 
them have 16kB erase block. This cause problem when you "folding" the "Virtual
Block Chain" in the NFTL layer (folding a vitrual block chain is a kind of
"garbage collection" in the NFTL that is the only case Erase is issued). Half of the block is lost since you think the
block is only 8kB but actually you have to
save 16kB of data.

I am currently reviewing the NFTL layer, there seems to be other problems too.
For example, try to use "nanddump" on a nftl_formatted/fdisked/mke2fsed DoC.
You will lost all your data (especially partition table) on the DoC.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
