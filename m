Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12X9bX-00042l-00
	for mtd-list@infradead.org; Mon, 20 Mar 2000 21:20:51 +0000
Received: from out4.prserv.net ([32.97.166.34] helo=prserv.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12X9bT-00042f-00
	for mtd@infradead.org; Mon, 20 Mar 2000 21:20:47 +0000
From: Dvir Oren <dviro@ibm.net>
To: David Woodhouse <dwmw2@infradead.org>,MTD <mtd@infradead.org>
Subject: Re: Questions about MTD 
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8BIT
Date: Mon, 20 Mar 2000 21:34:49 +0200
Sender: owner-mtd@imladris.demon.co.uk
Message-Id: <E12X9bX-00042l-00@infradead.org>
List-ID: <linux-mtd.lists.infradead.org>

> We set aside 49152 bytes of that for the firmware. The firmware may not 
> actually take up all of that space, but it's allocated anyway.
> 
> The remainder of the flash is taken up with the actual NFTL filing system. 
> This is a kind of filesystem which emulates a block device.
> 
> Your boot sector is actually in this block device, not on the first 512 bytes 
> of the flash itself. When you overwrite the entire contents of the block 

When I do dd if=/dev/nftla of=some_file bs=512 count=1, what do I 
get?
When I do dd if=/dev/mtd0 of=some_file bs=512 count=1, what do I 
get?


When I do dd if=/dev/nftla of=some_file bs=48k count=1, what do I 
get?
When I do dd if=/dev/mtd0 of=some_file bs=48k count=1, what do I 
get?

> If this is after you've previously used nftl_format without specifying that 
> you want it to start at byte 49152, then there's an NFTL header at the 
> beginning of the flash which will be confusing things. 
> 
> Otherwise, I'm not sure, and I'd need a complete transcript of what you did, 
> and the errors you way.

Suppose I take a brand new flash, run nftl_format /dev/mtd0 49152. 
 I then run fdisk /dev/nftla to create the partition, and then mke2fs 
/dev/nftla1, and then reboot, or remove the modules, and then 
insert them.  When I'll mount /dev/nftla1, it will be trashed.  Before I 
took out the module, I could mount, e2fsck, or whatever, and 
everything was fine.

I have some other weird problems:
I run nftl_format, create a partition, remove the module, then insert 
it, and I get an invalid partition.

And at some point the drivers compiled into the 2.3 kernel stopped 
writing nftla:  nftla1 after writing the partition table in fdisk.  The 
modules still do it.

> The firmware that comes from M-Systems isn't supposed to be just loaded 
> directly into the flash - which is what doc_loadbios does. You're supposed to 
> spread out the first 8k of data over the first 16k of the flash, I think, 
> putting 256 bytes of data at the beginning of each 512-byte page of flash.

Then what should I pass doc_loadbios, and why not simply dd (and 
to where should I dd, and from where should I dd)?

> Not yet. I have grub loading from DiskOnChip, but not then capable of getting 
> a kernel off the NFTL.

I posted here a lilo that should work with MTD.  I'll repost it.

> 
> 
> 
> 
> 
> --
> dwmw2
> 
> 
> 
> 




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
