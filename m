Received: from sccrmhc11.comcast.net ([204.127.202.55])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ANwUl-0008Dd-7c
	for <linux-mtd@lists.infradead.org>; Sun, 23 Nov 2003 15:49:55 +0000
Received: from rick by c-67-164-61-95.client.comcast.net with local (Exim 3.35
	#1 (Debian))	id 1ANwSn-0000bd-00
	for <linux-mtd@lists.infradead.org>; Sun, 23 Nov 2003 07:47:53 -0800
From: Rick Bronson <rick@efn.org>
To: linux-mtd@lists.infradead.org
Message-Id: <E1ANwSn-0000bd-00@c-67-164-61-95.client.comcast.net>
Sender: Rick Bronson <rick@comcast.net>
Date: Sun, 23 Nov 2003 07:47:53 -0800
Subject: nand_write_ecc() broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  The routine nand_write_ecc() doesn't seem to account for bad blocks.
If I write an image over a known bad block, nand_erase() correctly
identifies and skips over the bad block (via nand_block_bad()) but
nand_write_ecc() seems to ignore the bad blocks.

  Anyone experienced the same problem?

I'm using 11/16/03 cvs version of mtd on an ARM, linux-2.4.19, and
here's my config:

CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_NAND=y

 Here's my hardware specific NAND stuff:

	my_nand->eccmode = NAND_ECC_SOFT;  /* enable ECC */
	my_nand->chip_delay = 20;		


  Any help greatly appreciated.

  Rick Bronson
