Received: from pcp03710388pcs.westk01.tn.comcast.net ([68.34.200.110]
	helo=ori.thedillows.org)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ANHA2-0002hw-Iw
	for <linux-mtd@lists.infradead.org>; Fri, 21 Nov 2003 19:41:46 +0000
From: David Dillow <dave@thedillows.org>
To: avc@cctechnol.com
In-Reply-To: <7iu14yeq4s.fsf@thor.cctechnol.com>
References: <7iu14yeq4s.fsf@thor.cctechnol.com>
Message-Id: <1069443581.4444.12.camel@ori.thedillows.org>
Mime-Version: 1.0
Date: 21 Nov 2003 14:39:42 -0500
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 TSOP bad blocks table
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-11-20 at 15:33, Al Cousson wrote:
> I received this x86 compatible SBC computer with a DiskOnChip 2000
> TSOP for eval the other day.
> 
> I got the latest snapshot of the MTD source, compiled it with the
> latest 2.4.22 kernel and it recognized the chip.  It does produce a
> few curious messages at bootup though:
> 
> INTFL: corrupt block 390 in chain 390, chain length 0, erase mark 0x0?
> INTFL: formatting chain at block 390
> INTFL: formatting block 390
> Error erasing at 0x618000

I've seen the "Error erasing" messages on some of my DoC's as well, so
maybe something is goofy in my patches for the TSOP support. At first
glance, I don't see it, but it's going to be next month before I can
devote much time to it.

What's odd is sometimes it works, and sometimes it doesn't, for the same
block. I wonder if we're tripping into something timing sensitive, and
(not) catching an interrupt at the right time.

> INTFL: cannot calculate a geometry to match size of 0x3ea60.
> INTFL: using C:1002 H:16 S:16 (== 0x3ea00 sects)

This is fairly normal, don't worry about it -- it means you've lost 96
sectors off the end of the device. Consider them (extra) spare erase
units.


> The M-Systems dformat utility failed with "Error - Unreadable bad
> blocks table."  The M-Systems tech support told me to RMA it with my
> vendor.  I got a replacement DiskOnChip 2000 TSOP in.

You've definitely hosed the bad blocks table. I've done this myself a
few times....

While not the best solution (making a backup of the original BBT when
you get the chip), if you erase the entire DoC (or at least everything
but the IPL), dformat will rebuild the BBT for you, though it may miss a
few. Use the mtdchar driver and the erase utilities in the MTD
distribution to do this. Make sure you have the correct .EXB file to
replace the IPL!

> During bootup, I get the same INTFL messages.  Actually, the above
> messages are from the second chip.  The numbers may have been slightly
> different for the first one.  I haven't attempted the doc_loadbios on
> it, fearing the corrupted bad blocks table thing.  I never mounted or
> even fdisk'ed this second chip.
> 
> But, the M-Systems utilities are again reporting "Unreadable bad
> blocks table".
> 
> So, finally to my questions:
> 
> 1.  Is it possible that the INFTL driver is corrupting the bad blocks
>     table?

I'm seeing INFTL corruption on my DoC, but it may be a combination of
the patches I'm using. I've already caught one bug I introduced... When
I get them cleaned up, I'll be sending them to this list.

> 2.  Does doc_loadbios need to be updated to work on the DiskOnChip
>     2000 TSOP? 

Sorry, I've not played with this.

> 3.  Or, did I just get 2 bad DiskOnChips?

The bad erase mark is interesting, but it is possible the doc2000
patches for the TSOP are to blame. I doubt the DoCs you have are bad.

Dave
