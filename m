Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eblxi-0005sY-KO
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 11:33:02 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de
Subject: [PATCH v2] mxc_nand controller fixes
Date: Wed, 17 Jan 2018 12:32:05 +0100
Message-Id: <20180117113213.15455-1-s.hauer@pengutronix.de>
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
mtd_nandbiterrs, mtd_oobtest, mtd_pagetest and mtd_readtest and the
corresponding userspace tests from mtd-utils on a i.MX27 board which
is a v1 controller and a i.MX25 board which is a v2 controller.

Based on nand/next.

Sascha

Changes since v1:
- drop mtd argument from read_page/write_page functions
- do not add function beginning with two underscores
- simplify bitflips counting for v1 controllers
- Add ecc argument to mxc_nand_write_page()
- drop unused oob_required argument from mxc_nand_write_page()
