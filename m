Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14TLQB-0003sz-00
	for mtd-list@infradead.org; Thu, 15 Feb 2001 10:13:55 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14TLQ8-0003ss-00
	for mtd@infradead.org; Thu, 15 Feb 2001 10:13:53 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200102150323.TAA01327@concorde.cs.ucla.edu> 
References: <200102150323.TAA01327@concorde.cs.ucla.edu> 
To: Jeremy Elson <jelson@isi.edu>
Cc: jffs-dev@axis.com, mtd@infradead.org
Subject: Re: Does JFFS respect partitions? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 15 Feb 2001 10:10:11 +0000
Message-ID: <20534.982231811@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jelson@isi.edu said:
>  I am trying to get JFFS to run on one of 2 partitions on a DOC2000. I
> ran fdisk on /dev/nftl/disc0/disc (in devfs-parlance; equivalant to /
> dev/nftla I think; it's major 93 minor 0).  Using fdisk I was able to
> create 2 partitions, /dev/nftl/disc/part[34], and successfully created
> an ext2 partition in part3.  Now, I want to use JFFS on part4.  But,
> it seems that JFFS only wants to talk to the raw block device (/dev/
> mtdblock/0), not the partitioned block device.

> I need to do this because I need one bootable readonly partition (ext2
> works fine, I'll probably use cramfs eventually if the bootloader
> supports it).  The 2nd partition needs to be writable, and therefore
> wear-levelled, so I want to use JFFS.  But JFFS doesn't want to play
> along :-).

> The design of the system demands 2 partitions: one of which is
> guaranteed to never be corrupted (the readonly partition), and a
> writable but disposable partition, so unfortunately using JFFS for the
> entire block device is not an option. 

Don't do that.

The DiskOnChip is a clever ASIC and a handful of NAND flash chips. It's 
shipped with a pseudo-filesystem on it which emulates a block device, 
called NFTL (NAND Flash Translation Layer). The sectors in your emulated 
block device may end up anywhere on the physical flash, as you'd expect 
from a filesystem.

On top of that emulated block device, you put your normal partition table 
and filesystems. 

Having a read-only partition on the _emulated_ block device doesn't help. 
The blocks of that partition will still be shifted around to perform 
wear-levelling while you write to the other partition. If the NFTL 
filesystem gets corrupted (note the BETA in capital letters in the 
CONFIG_NFTL_RW config option), you've still lost your read-only filesystem.

Note that you _could_ in theory have two NFTL 'filesystems' on the same 
DiskOnChip - giving you two separate block devices nftla and nftlb. The 
NFTL write code is slightly suspect ATM, but I don't expect it to be so 
screwed that it writes to the flash _outside_ its own space. You don't 
bother partitioning them - use the whole device for the filesystem. Mount 
one of them read-only and mount the other read-write.

It's also possible to register the DiskOnChip raw flash as two separate MTD 
devices, which is how we 'partition' normal flash. Then you let the NFTL 
code put a filesystem on one of them and use JFFS on the other. 

jelson@isi.edu said:
>  Will there be any ill effects if I just remove the check in JFFS for
> MTD_BLOCK_MAJOR?

It cannot work on a block device (at the moment); only on a real flash
device. The only thing it does with the block device it's passed is use the
minor number to lookup an MTD device.

> Also, what's jffs2?  Is it safe to use that, and how is it different? 

Pay no attention to the man behind the curtain. The garbage collect code,
and half of the code to scan the filesystem on mount, are absent presumed 
not written yet. But if you mount an empty filesystem, it seems to work 
fine until the log gets to the end of the first pass of the flash. :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
