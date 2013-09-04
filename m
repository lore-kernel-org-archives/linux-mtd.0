Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmC-0004mE-DO
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:01 +0000
Received: by mail-ie0-f174.google.com with SMTP id k14so1459554iea.33
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:38 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 00/12] mtd: miscellaneous fixes
Date: Wed,  4 Sep 2013 11:25:14 -0700
Message-Id: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
Cc: David Brownell <david-b@pacbell.net>, Huang Shijie <b32955@freescale.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

In poking around various drivers for my own work and for (sub)maintaining
MTD stuff, I found an assortment of fixes to make. Most of these should be
trivial and obvious, but they could use a glance by a few people. They have
generally been compile tested only.

Brian

Brian Norris (12):
  nand: docg4: use nand_base's default BBT scan
  mtd: nand: lpc32xx_slc: don't call nand_default_bbt directly
  mtd: nandsim: don't call nand_default_bbt() directly
  mtd: nand: stop exporting nand_default_bbt
  mtd: dataflash: remove unused field
  mtd: denali: make init function static
  mtd: nand: return failure when failing to get ECC from ONFI
  mtd: nand: don't print ONFI buswidth errors unless we need to
  mtd: onenand: remove redundant offset check
  mtd: nand: remove obsolete 'ecclayout' field
  mtd: onenand: remove unused variable assignments
  mtd: lpddr_cmds: make function static

 drivers/mtd/devices/mtd_dataflash.c |  2 --
 drivers/mtd/lpddr/lpddr_cmds.c      |  2 +-
 drivers/mtd/nand/denali.c           |  2 +-
 drivers/mtd/nand/docg4.c            |  1 -
 drivers/mtd/nand/fsl_elbc_nand.c    |  2 --
 drivers/mtd/nand/fsl_ifc_nand.c     |  2 --
 drivers/mtd/nand/lpc32xx_slc.c      |  8 --------
 drivers/mtd/nand/nand_base.c        | 23 ++++++++++++++++-------
 drivers/mtd/nand/nand_bbt.c         |  1 -
 drivers/mtd/nand/nandsim.c          |  2 +-
 drivers/mtd/onenand/onenand_base.c  | 17 ++++++-----------
 include/linux/mtd/nand.h            |  1 -
 12 files changed, 25 insertions(+), 38 deletions(-)

-- 
1.8.4
