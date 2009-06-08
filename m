Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDcsO-0005D9-DB
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 11:18:58 +0000
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Please pull bjdooks' next-mtd tree
Message-Id: <E1MDcsM-0008PP-W7@kira.home.fluff.org>
From: Ben Dooks <ben@fluff.org.uk>
Date: Mon, 08 Jun 2009 12:18:50 +0100
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following changes since commit 9fa7eb283c5cdc2b0f4a8cfe6387ed82e5e9a3d3:
  Linus Torvalds (1):
        Linux 2.6.30-rc8

are available in the git repository at:

  git://aeryn.fluff.org.uk/bjdooks/linux.git next-mtd

Andy Green (3):
      [MTD] [NAND] S3C2410: NAND ECC by chip rather than global
      [MTD] [NAND] S3C2410: Fix CFG debug order
      [MTD] [NAND] S3C2410: Allow commandline partition processing

Ben Dooks (4):
      [MTD] [NAND] S3C2410: Move to using platform device table
      [MTD] [NAND] S3C2410: Basic kerneldoc comment updates
      [MTD] [NAND] S3C2410: Deal with unaligned lengths in S3C2440 buffer read/write
      [MTD] [NAND] S3C2410: Use DIV_ROUND_UP

Michel Pollet (2):
      [MTD] [NAND] S3C2410: Added a kerneldoc for s3c2410_nand_set
      [MTD] [NAND] S3C2410: Allow the machine code to get the BBT table from NAND

Nelson Castillo (2):
      [MTD] [NAND] S3C2410: Small colon cleanup
      [MTD] [NAND] S3C2410: Uninitialised variable cleanup

 arch/arm/plat-s3c/include/plat/nand.h |   31 +++--
 drivers/mtd/nand/s3c2410.c            |  259 ++++++++++++++++++++++-----------
 2 files changed, 194 insertions(+), 96 deletions(-)
