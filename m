Received: from lakermmtao11.cox.net ([68.230.240.28])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVeXr-0006kT-Ux
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2004 18:49:19 -0400
Received: from tinker ([68.100.254.2]) by lakermmtao11.cox.net
	(InterMail vM.6.01.03.02 201-2131-111-104-20040324) with SMTP
	id <20040602224846.GTHS15427.lakermmtao11.cox.net@tinker>
	for <linux-mtd@lists.infradead.org>; Wed, 2 Jun 2004 18:48:46 -0400
Message-ID: <002301c448f3$bf552e60$4402a8c0@tinker>
From: "Dan Brown" <dan_brown@ieee.org>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 2 Jun 2004 18:48:39 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: NAND driver for DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For the project I'm working on, I have a board with a DiscOnChip 2000 TSOP.
I need to get Linux support for this chip working, and yes I'm volunteering
:)

As I see it, there are two options:
    1) Fix bad block support in the INFTL driver so that I can then use some
other FS (ext2, etc) on top of INFTL.
    2) Finish NAND support for the DOC (starting with the incomplete
nand/diskonchip.c driver) so I can use JFFS2 or YAFFS.

I prefer the latter option in the long run, and my feeling from a brief
reading of both files is that the work required will be similar either way.
I imagine both will get done eventually, since each is useful in different
situations.

I'd like some guidance to make sure I don't go down a wrong path.  Is
someone else already busily working on this?

To fix the INFTL driver, it seems (based on prior postings from David) that
I need to know how to parse the INFTL bad block table.  The relevant code in
inftlmount.c is #ifdef'd out, and looks like a straight port of the
nftlmount.c code.  Presumably removing the #ifdef 0 is not the solution, or
it would already be done.

I've been staring at hex dumps of my 192M DOC (both data and OOB) and I must
confess it isn't obvious to me how INFTL bad block marking works.
M-Systems' dinfo reports 3 bad blocks, but all of the bytes in the bad block
area that NFTL would use (the sector after the BNAND header) are 0xff.
Examining the OOB data shows clear differences for those 3 blocks, but that
doesn't let me narrow it down to a particular OOB byte(s).

So, does anyone know how it works?

Switching gears to diskonchip.c:  It looks like the major thing missing is
(once again) bad block handling.  It occurs to me that as a first cut, one
could clear all the OOB data and use the default bbt handling in nand_bbt.c.
Suitably configured, this would do an integrity test on every block and
either store the results at an arbitrary OOB position, or construct a bbt at
the end of the device (or both).  I know it isn't ideal to simply throw away
the manufacturer's bbt info, but is it really a disaster (assuming we
rescan)?  Can anyone explain to me why this wouldn't work?

The more elaborate solution would be to utilize the bad block info provided
by an existing NFTL/INFTL format.  I can see two suboptions for this:
    a) Write a user-space utility that extracts the (I)NFTL bbt info to a
file, and (possibly another utility) that formats the chip in default
nand_bbt.c style (possibly just creating OOB markers, possibly creating an
end-of-device bbt) using the data from this file.  When we're done, we've
effectively thrown away (I)NFTL.
    b) Preserve the (I)NFTL media header and bbt (mark them as unusable from
the NAND driver).  Parse the (I)NFTL bbt at startup and update it as
necessary.  The rest of the device gets used by the fs (JFFS2,YAFFS) even
though the (I)NFTL media header implies that it contains (I)NFTL data.

Comments?  Has this stuff already been thought out?  I'd be happy to defer
to wiser heads.

Sorry for the long posting, and thanks for any help you can give.

    -Dan Brown
