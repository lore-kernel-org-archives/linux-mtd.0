Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14GeVF-0004WU-00
	for mtd-list@infradead.org; Thu, 11 Jan 2001 09:58:41 +0000
Received: from [195.166.20.93] (helo=frumious.unidec.co.uk)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14GeVD-0004WO-00
	for mtd@infradead.org; Thu, 11 Jan 2001 09:58:39 +0000
From: dr john halewood <john@frumious.unidec.co.uk>
To: David Hamm <dhamm@itrepro.com>, mtd@infradead.org
Subject: Re: DiskOnChip200 howto
Date: Thu, 11 Jan 2001 09:58:06 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
References: <01010910331803.23650@workbox.atlanta.itserve.com>
In-Reply-To: <01010910331803.23650@workbox.atlanta.itserve.com>
MIME-Version: 1.0
Message-Id: <0101110958060C.27002@frumious.unidec.co.uk>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tuesday 09 January 2001 15:28, David Hamm wrote:
> I've been fighting with a DiskOnChip2000 box for a while now and its about
> to win.   I've searched the net for specific info on how to use the MTD
> drivers in the kernel rather than M-Sys driver.  Is there a howto or an old
> email that describes how to use the NFTL drivers?  Getting them in the
> kernel is easy but I don't know which device file to use to format the
> device.

As a quick guide:

Build the mtd support into the kernel.

If using modules, I'd suggest ordering them something like (depending on what 
support you've chosen of course)

mtdcore.o
nftl.o
mtdchar.o
mtdblock.o
doc2000.o
modprobe.o

Run the MAKEDEV script from the utils directory of the cvs tree to create the 
necessary files in /dev

Reboot. You should see a "Disk on Chip found at xxxxx" message followed by a 
"Giving out device <x> to DiskOnChip...". Generally I'd expect the DoC to be 
nftla


fdisk /dev/nftla and set up whatever partitions you want, then run mkfs to 
create the partitions. Mount and enjoy.

Alternatively you can create your own filesystems and dd them in directly.

cheers
john


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
