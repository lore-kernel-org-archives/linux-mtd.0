Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mwlz-0002Dg-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 13:01:59 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C95D945.2DCE55AA@wtms.nl> 
References: <3C95D945.2DCE55AA@wtms.nl> 
To: Wil Taphoorn <wil@wtms.nl>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: How to protect DoC 2000 from power fail? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Mar 2002 13:10:13 +0000
Message-ID: <30525.1016457013@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

wil@wtms.nl said:
>  I am looking for some rigid means of power fail protection for a DoC
> 2000 based embedded system. From what I have read so far I understand
> that almost any brand of journalling file system should do well but,
> then again, those readings also mention raw FLASH and not DoC, in
> other words, I think I am lost. Would someone be so kind to enlighten
> me? 

The M-Systems driver, and also the FTL and NFTL code in the Linux kernel, 
use a kind of pseudo-filesystem on the flash to emulate a normal block 
device. That pseudo-filesystem (or 'translation layer') is expected to 
be resilient to power failure, and generally expected to do wear levelling. 
It's essentially a journalling file system all of its own.

CompactFlash also uses such a pseudo-filesystem, but does it completely
internally. Electrically, it behaves just like an IDE drive. Reportedly CF 
devices are very bad w.r.t to power failure and wear levelling though, but 
the concept is similar. 

So now you have what appears to be a normal block device. You can use VFAT 
or ext2 on that, but obviously those are not resilient to power failure - 
the underlying translation layer will be fine, but if the file system on 
top will get corrupted, you're still screwed. Using VFAT or ext2 on CF or 
FTL/NFTL in most applications is fairly insane, if you're writing to it 
during normal operation.

So you probably want to use a real journalling file system on your pretend 
block device instead. But that has problems too...

Often, such journalling file systems work by keeping a part of the block
device for a 'log' or 'journal', then doing changes as follows:

	1. Write the change you're about to make to the log.
	2. Make the actual changes in the file system.
	3. Write a 'commit block' to the log.

If power is lost during step 1, the change we were about to make is lost - 
it's as if it never happened, and note that we didn't touch the traditional 
part of the file system.

If power is lost during step 2, when we reboot we'll 'play back' the log 
and go ahead and finish what we were doing.

If power is lost during step 3, we'll make the same changes to the file 
system again, but that won't matter.

So whenever we lose power, all the data are safe.

However, it should be immediately obvious that this form of journalling 
involves a lot more writes to the block device than a normal file system. 
On a real hard drive, that's fine. But on flash, that's precisely the kind 
of thing you want to avoid. The underlying translation layer will (normally)
try to distribute that wear around the real physical flash, but there will 
still be more writes than are necessary, and hence it will destroy the 
hardware faster and generally operate slower than necessary.

To be honest, I cannot recommend _any_ block-based journalling file system
for use on the DiskOnChip or similar devices. I would suggest that for most
situations where you actually want to write to the file system, using _any_
blkdev-based file system on top of such an emulated block device is insane.

The only justification for pretending to be a block device is that DOS
drivers were far easier to do that way; you could just hook into the INT 13h
handler and pretend to be a BIOS-supported hard drive. Porting to Windows 
was easier that way too. 

If you want to be able to write to it then the correct solution, IMO, is to
write a _real_ file system which operates on flash directly instead of
operating on a block device. Build in the wear levelling, journalling, etc. 

For many years I made this statement in the hope that someone would 
eventually get round to writing such a flash file system. Then eventually, 
Axis did it - see http://developer.axis.com/software/jffs/. I worked on 
this for a while before succumbing to Fred Brooks' wisdom and starting 
again from scratch.

The result is JFFS2 - http://sources.redhat.com/jffs2/. Originally it only 
worked on NOR flash and not the cheaper NAND flash which is in the 
DiskOnChip. But recently we've added basic support for NAND devices and it 
ought to be approaching beta quality on NAND. More testing would be useful. 

--
dwmw2
