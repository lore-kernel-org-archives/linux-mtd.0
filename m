Received: from jeeves.momenco.com
	([64.169.228.99] helo=host099.momenco.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19DVfQ-0004Iw-1K
	for <linux-mtd@lists.infradead.org>; Wed, 07 May 2003 21:37:32 +0100
Received: from beagle (natbox.momenco.com [64.169.228.98])
	(authenticated)
	by  host099.momenco.com (8.11.6/8.11.6) with ESMTP id h47KbkH05190
	for <linux-mtd@lists.infradead.org>; Wed, 7 May 2003 13:37:46 -0700
From: "Matthew Dharm" <mdharm@momenco.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 7 May 2003 13:37:46 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAIMEFFDAAA.mdharm@momenco.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: DiskOnChip 2000 128Mb problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm porting Linux to our embedded PPC platform.  We have a DoC 2000
(apparently known as "Millenium") on the board, and I'm having
problems getting the driver working.  I'm hoping someone here can
help... I think the issue is that the driver doesn't support this
part, tho it should (are we really the first to try this?).

We're using kernel 2.4.17, upgraded with MTD from CVS as of today.
Our DoC is 128MB in size and operates at 3.3 V.

Here's our story:  The main DoC driver detects the device, but is
unable to identify any flash devices.  At boot time, it shows:

Using configured DiskOnChip probe address 0x70400000
DiskOnChip Millennium found at address 0x70400000
No flash chips recognised.
NFTL driver: nftlcore.c $Revision: 1.88 $, nftlmount.c $Revision: 1.31
$

And /proc/mtd shows no entries.  If I switch to the Millenium-only
driver, (config change and edit docprobe.c), we get:

Using configured DiskOnChip probe address 0x70400000
DiskOnChip Millennium found at address 0x70400000
Flash chip found: Manufacturer ID: EC, Chip ID: 76 (Samsung:NAND 64MB
3,3V)
1 flash chips found. Total DiskOnChip size: 64 MiB
mtd: Giving out device 0 to DiskOnChip Millennium
NFTL driver: nftlcore.c $Revision: 1.88 $, nftlmount.c $Revision: 1.31
$
NFTL_notify_add for DiskOnChip Millennium
mtd->read = c00cd470, size = 67108864, erasesize = 8192
NFTL_setup
Could not find valid boot record
Could not mount NFTL device

And, in /proc/mtd:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 04000000 00002000 "DiskOnChip Millennium"

Which is interesting, because it is exactly half the correct size.  A
quick check through the source code shows that MAX_CHIPS_MIL is set to
1, and there is a FIXME in doc2001.c "to deal with multi-flash on
multi-Millenium case more carefully".  If I change the definition of
MAX_CHIPS_MIL to 4, we get:

Using configured DiskOnChip probe address 0x70400000
DiskOnChip Millennium found at address 0x70400000
Flash chip found: Manufacturer ID: EC, Chip ID: 76 (Samsung:NAND 64MB
3,3V)
Flash chip found: Manufacturer ID: EC, Chip ID: 76 (Samsung:NAND 64MB
3,3V)
2 flash chips found. Total DiskOnChip size: 128 MiB
mtd: Giving out device 0 to DiskOnChip Millennium
NFTL driver: nftlcore.c $Revision: 1.88 $, nftlmount.c $Revision: 1.31
$
NFTL_notify_add for DiskOnChip Millennium
mtd->read = c00cd450, size = 134217728, erasesize = 8192
NFTL_setup
Could not find valid boot record
Could not mount NFTL device

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 08000000 00002000 "DiskOnChip Millennium"

So it looks like the driver can probe and see the multiple flash chips
present, but can't seem to actually do anything with them.  I didn't
really expect that change to make it work, but it does show that I
have the right amount of flash in the part

Of course, now you ask if the chip is formatted.  I believe it is, as
the part was tested under VxWorks and data was actually written to it.
My understanding is that the format is supposed to be compatible....

I've tried nftldump, but it doesn't seem to generate any output.
nftl_format just gives a large number of errors as it tries to format
the part.

Does anyone have any ideas on where to go from here?  Perhaps someone
can explain what the FIXME means (if applicable)

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com
