Received: from imf23aec.mail.bellsouth.net ([205.152.59.71])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19pzT4-0002ok-0x
	for <linux-mtd@lists.infradead.org>; Fri, 22 Aug 2003 01:07:50 +0100
Received: from luna.siliconmotorsports.com ([68.158.3.61])
	by imf23aec.mail.bellsouth.netESMTP
	<20030822000659.OGAA21889.imf23aec.mail.bellsouth.net@luna.siliconmotorsports.com>
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2003 20:06:59 -0400
From: "Tim Drury" <tdrury@siliconmotorsports.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 21 Aug 2003 20:06:56 -0400
Message-ID: <000601c36841$4d06a570$3301a8c0@SIMOTORSPORTS>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: NFTL device not found (boot floppies)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I'm building a couple boot floppies for my target system - an Elan/586
based system with a 32MB DOC 2000.  I built the kernel with MTD built in
(not modules) according to the faq.  On bootup I get the following:

----
NFTL driver: nftlcore.c $Revision: 1.94 $, nftlmount.c $Revision: 1.34 $
DiskOnChip 2000 found at address 0xE0000 Flash chip found: Manufacturer
ID: EC, Chip ID: 75 (Samsung: NAND 32MiB 3,3V) 1 flash chips found.
Total DiskOnChip size: 32 MiB Could not find valid boot record
NFTL: could not mount device
----

Could this be because I'm using 2-floppy boot system with the /dev fs on
the second floppy (which hasn't been inserted yet)?  After I insert it
and /dev is loaded, I try to do anything with /dev/nftla I get errors. I
made /dev/nftla and /dev/nftla1 using 'mknod /dev/nftla b 90 0' and
'mknod /dev/nftla b 90 1' on the 2nd boot disk.

% fdisk /dev/nftla

Unable to open /dev/nftla

% fdisk /dev/nftla1

Unable to open /dev/nftla1

I can see the MTD via /proc:

% cat /proc/mtd
dev:   size    erasesize   name
mtd0: 02000000 00004000 "DiskOnChip 2000"

Any ideas?

-tim
