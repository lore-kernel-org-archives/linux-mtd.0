Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVepd-0007FX-Gp
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2004 19:07:38 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Dan Brown <dan_brown@ieee.org>
In-Reply-To: <002301c448f3$bf552e60$4402a8c0@tinker>
References: <002301c448f3$bf552e60$4402a8c0@tinker>
Content-Type: text/plain
Message-Id: <1086217653.26119.892.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 03 Jun 2004 00:07:33 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND driver for DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-06-02 at 18:48 -0400, Dan Brown wrote:
> For the project I'm working on, I have a board with a DiscOnChip 2000 TSOP.
> I need to get Linux support for this chip working, and yes I'm volunteering
> :)
> 
> As I see it, there are two options:
>     1) Fix bad block support in the INFTL driver so that I can then use some
> other FS (ext2, etc) on top of INFTL.
>     2) Finish NAND support for the DOC (starting with the incomplete
> nand/diskonchip.c driver) so I can use JFFS2 or YAFFS.
> 
> I prefer the latter option in the long run, and my feeling from a brief
> reading of both files is that the work required will be similar either way.
> I imagine both will get done eventually, since each is useful in different
> situations.

I'd like to ditch the old devices/doc200* drivers and use the NAND code
exclusively -- so you can use nand/diskonchip.c _either_ with
JFFS2/YAFFS directly or with the NFTL/INFTL translation layer code.

Yes, either way we need to implement the bad block table handling -- and
Thomas has just done a lot of the work you need for that.

> I'd like some guidance to make sure I don't go down a wrong path.  Is
> someone else already busily working on this?

No, although Thomas has been doing other bad block table stuff which was
designed with DiskOnChip in mind.

> To fix the INFTL driver, it seems (based on prior postings from David) that
> I need to know how to parse the INFTL bad block table.  The relevant code in
> inftlmount.c is #ifdef'd out, and looks like a straight port of the
> nftlmount.c code.  Presumably removing the #ifdef 0 is not the solution, or
> it would already be done.

It shouldn't like in INFTL code. It should live in the low-level driver
instead.

> I've been staring at hex dumps of my 192M DOC (both data and OOB) and I must
> confess it isn't obvious to me how INFTL bad block marking works.
> M-Systems' dinfo reports 3 bad blocks, but all of the bytes in the bad block
> area that NFTL would use (the sector after the BNAND header) are 0xff.
> Examining the OOB data shows clear differences for those 3 blocks, but that
> doesn't let me narrow it down to a particular OOB byte(s).

Hint: Look at the end of the device, not immediately after the BNAND
header. Actually at the end of each 'floor' not the end of the whole
logical device.

> So, does anyone know how it works?

Yeah, but unfortunately I'm not allowed to show you. Come to #mtd on
irc.freenode.net though and perhaps I can hint some more :)

> Switching gears to diskonchip.c:  It looks like the major thing missing is
> (once again) bad block handling.  It occurs to me that as a first cut, one
> could clear all the OOB data and use the default bbt handling in nand_bbt.c.
> Suitably configured, this would do an integrity test on every block and
> either store the results at an arbitrary OOB position, or construct a bbt at
> the end of the device (or both).  I know it isn't ideal to simply throw away
> the manufacturer's bbt info, but is it really a disaster (assuming we
> rescan)?  Can anyone explain to me why this wouldn't work?

Yes, it's a disaster. You can't rescan; you must not touch blocks which
were marked bad at shipping time. You _have_ to keep the original table.

> The more elaborate solution would be to utilize the bad block info provided
> by an existing NFTL/INFTL format.  I can see two suboptions for this:

Yes.

>     a) Write a user-space utility that extracts the (I)NFTL bbt info to a
> file, and (possibly another utility) that formats the chip in default
> nand_bbt.c style (possibly just creating OOB markers, possibly creating an
> end-of-device bbt) using the data from this file.  When we're done, we've
> effectively thrown away (I)NFTL.

Urgh.

>     b) Preserve the (I)NFTL media header and bbt (mark them as unusable from
> the NAND driver).  Parse the (I)NFTL bbt at startup and update it as
> necessary.  The rest of the device gets used by the fs (JFFS2,YAFFS) even
> though the (I)NFTL media header implies that it contains (I)NFTL data.

That's the way we're heading. The BBT code which Thomas committed
recently is designed to allow this. Although we don't update the BBT
live on DiskOnChip media -- I think we mark blocks bad in their OOB area
if they go bad during operation.

Get on IRC and we'll be more than happy to talk you through it.

-- 
dwmw2
