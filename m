Received: from code-monsters.com ([65.67.50.169] helo=smash.codemonsters.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gaDO-00015q-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2002 23:43:59 +0000
Received: from ba.devicemonsters.com (adsl-65-70-211-41.dsl.austtx.swbell.net [65.70.211.41])
	by smash.codemonsters.net (8.9.3/8.8.7) with ESMTP id RAA14066
	for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2002 17:55:18 -0600
Date: Thu, 28 Feb 2002 19:03:21 -0600 (CST)
From: "Brian P. Austin" <baustin@codemonsters.net>
To: linux-mtd@lists.infradead.org
Subject: UnitSizeFactor of != 1 yet?
Message-ID: <Pine.LNX.4.21.0202281853280.898-100000@ba.devicemonsters.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hello all,

I have switched from the msys driver and moved to mtd.  Everything
compiles fine and this is what I get at boot up.

Using configured DiskOnChip probe address 0xd0000
DiskOnChip 2000 found at address 0xD0000
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba TC58256FT/DC)
9 flash chips found. Total DiskOnChip size: 288 MiB
mtd: Giving out device 0 to DiskOnChip 2000
NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
NFTL_notify_add for DiskOnChip 2000
NFTL_setup
Sorry, we don't support UnitSizeFactor of != 1 yet.
Could not find valid boot record
Could not mount NFTL device

when I do cat /proc/mtd, I get the following.

dev:    size   erasesize  name
mtd0: 12000000 00004000 "DiskOnChip 2000"

I'm using a DOC 2000 288MB flash chip with the DOC43.exb file on it.

I guess my question is...

What does "Sorry, we don't support UnitSizeFactor of != 1 yet." mean?

thanks in advance.

Brian Austin
