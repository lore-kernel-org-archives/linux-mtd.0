Received: from cindrpmx1.corp.harris.com ([137.237.241.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15SJaD-00082p-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 Aug 2001 15:36:17 +0100
Message-ID: <8D4C69676E66D511A1CB00508BBBB1921BCE95@ranmx1.ran.harris.com>
From: "Walser, Martin" <mwalser@harris.com>
To: linux-mtd@lists.infradead.org
Subject: Disk on Chip -> Could not find valid boot record
Date: Thu, 2 Aug 2001 10:41:11 -0400 
MIME-Version: 1.0
Content-Type: text/plain
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

I'v downloaded the newst driver.

This is, what I've done:

1. eraseall /dev/mtd0
2. nftl_format /dev/mtd0

Everything works fine, no errors were reported.

I've disabled DOC_SINGLE_DRIVER.

But when I restart the system, the following output is shown:

M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Using configured probe address 0x50000000
DiskOnChip Millennium found at address 0x50000000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
1 flash chips found. Total DiskOnChip size: 8 MiB
mtd: Giving out device 0 to DiskOnChip Millennium
NFTL driver: nftlcore.c $Revision: 1.76 $, nftlmount.c $Revision: 1.19 $
Could not find valid boot record
Could not mount NFTL device

What did I wrong?

best regards
Martin
