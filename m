Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JJMj-0003CS-00
	for mtd-list@infradead.org; Mon, 31 Jul 2000 18:28:37 +0100
Received: from mail.transzap.net ([207.239.241.226] helo=tzi.transzap.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13JJMi-0003CM-00
	for mtd@infradead.org; Mon, 31 Jul 2000 18:28:36 +0100
Received: from localhost (phiggins@localhost)
	by phiggins.transzap.com (8.9.3/8.8.7) with ESMTP id LAA32427
	for <mtd@infradead.org>; Mon, 31 Jul 2000 11:32:33 -0600
From: Patrick Higgins <phiggins@transzap.com>
To: mtd@infradead.org
Date: Mon, 31 Jul 2000 11:32:33 -0600 (MDT)
Subject: Re: nftl and multi page read write support 
In-Reply-To: <4314.965029230@cygnus.co.uk>
Message-ID: <Pine.LNX.4.21.0007311121400.32307-100000@phiggins.transzap.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 31 Jul 2000, David Woodhouse wrote:

> rogelio@evoserve.com said:
> > David - NFTL support is safe with the multipage read-write support. I
> > have a system running on ext2 on nftl and it is stable. 
> 
> Cool - you mean not only does it _not_ break it, but it magically makes it 
> stable too?

Unless you've made some changes to NFTL (you were just verifying that your
DoC2000 changes *didn't* break NFTL, right?) then NFTL still has some
problems.  I'm having trouble finding time to look into the cause, but
while I am able to read and write from a preexisting NFTL partition, I'm
unable to make changes to it.  Using M-Systems' dformat utility from
dosemu makes a single FAT partition.  When I try to use fdisk to toggle it
to a Linux partition, things seem to go normally, but then when I run it
again, the partition still shows up as FAT.  mke2fs also seems to complete
successfully, but doesn't actually make changes.  However, mounting the
FAT partition, touching a few files, unmounting, *rebooting*, and mounting
again shows that the changes were permanent.  I have no idea what's
wrong--but I assume, as David has pointed out, that something is probably
wrong with the block device setup and/or partition table setup.  I'll look
into it when I get the chance.

-Patrick


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
