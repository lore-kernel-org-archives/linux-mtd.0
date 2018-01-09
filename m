Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYqt3-00083B-Go
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 10:14:07 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de
Subject: mxc_nand controller fixes
Date: Tue,  9 Jan 2018 11:11:40 +0100
Message-Id: <20180109101148.13728-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series fixes several problems in the mxc_nand driver.

- Raw support does not work since hardware ECC is unconditionally
  enabled
- The v2/v3 controller code returns the number of corrected
  bitflips for the whole page for each subpage leading to 
  results for times too high
- The v1 controller code returns the number of corrected bitflips
  only for the last subpage. On 2k page NANDs bitflips in the
  first three subpages remain uncovered

This series fixes these issues. Tested with the mtd test modules
mtd_nandbiterrs, mtd_oobtest, mtd_pagetest and mtd_readtest on
a i.MX27 board which is a v1 controller and a i.MX25 board which
is a v2 controller. Boris, and yes, I just tried some of the userspace
mtd tests aswell, namely nandtest, nandsubpagetest and nandbiterrs
;)

Based on nand/next.

Sascha

----------------------------------------------------------------
Sascha Hauer (8):
      mtd: nand: mxc: reorder functions to avoid forward declarations
      mtd: nand: mxc: Add function to control hardware ECC
      mtd: nand: mxc: Add buffer argument to copy_spare
      mtd: nand: mxc: Fix failed/corrected values for v2/v3 controllers
      mtd: nand: mxc: Fix failed/corrected values for v1 controllers
      mtd: nand: mxc: Add own write_page
      mtd: nand: mxc: Drop now unnecessary functions
      mtd: nand: mxc: remove now unused code

 drivers/mtd/nand/mxc_nand.c | 519 +++++++++++++++++++++++++++-----------------
 1 file changed, 322 insertions(+), 197 deletions(-)
