Received: from sccrmhc12.comcast.net ([204.127.202.56])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMElZ-000207-K5
	for <linux-mtd@lists.infradead.org>; Tue, 18 Nov 2003 22:56:13 +0000
Received: from rick by c-67-164-61-95.client.comcast.net with local (Exim 3.35
	#1 (Debian))	id 1AMEjW-0005uD-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Nov 2003 14:54:06 -0800
From: Rick Bronson <rick@efn.org>
To: linux-mtd@lists.infradead.org
Message-Id: <E1AMEjW-0005uD-00@c-67-164-61-95.client.comcast.net>
Sender: Rick Bronson <rick@comcast.net>
Date: Tue, 18 Nov 2003 14:54:06 -0800
Subject: NAND JFFS2 bad block usage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  I'm trying to understand NAND bad block usage under JFFS2.  I'm
using the 11/16/03 cvs version of mtd on an ARM.  I have a partition
(mtd0) on my 32 Mbyte NAND (Toshiba TC58256FT/DC) that has no bad
blocks and I can erase/copy and cmp the file on NAND with the original
and it all works.

  I also have a partition (mtd1) with one bad block as reported by u-boot:

Uboot> nand bad                                                                 
Device 0 bad blocks:                                                            
 0x00dec000                                                                     

  and sure enough, when I do:

./eraseall --jffs2 /dev/mtd1

  I get:

Erasing 16 Kibyte @ e8000 --  8 % complete. Cleanmarker written at e8000.
Erasing 16 Kibyte @ ec000 --  8 % complete.
./eraseall: /dev/mtd1: MTD Erase failure: Input/output error

Erasing 16 Kibyte @ f0000 --  8 % complete. Cleanmarker written at f0000.
Erasing 16 Kibyte @ f4000 --  8 % complete. Cleanmarker written at f4000.

  mtd1 starts at 0x00d00000 so the offset of ec000 this makes sense
with what u-boot reported above.

  When I copy a file to mtd1, it doesn't report any errors but it
doesn't compare (using cmp) with the original file.  Looking in
nand.c, it doesn't look like there is any check for bad blocks in the
write routine.  I must be missing something?

I'm using linux-2.4.19, and here's my config:

CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_NAND=y

 Here's my hardware specific NAND stuff:

	my_nand->eccmode = NAND_ECC_SOFT;  /* enable ECC */
	my_nand->chip_delay = 20;		


  Any help greatly appreciated.

  Rick Bronson
