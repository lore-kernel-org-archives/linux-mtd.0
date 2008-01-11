Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JDQoI-0002pj-LV
	for linux-mtd@lists.infradead.org; Fri, 11 Jan 2008 20:49:08 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m0BKmrLo002101 for <linux-mtd@lists.infradead.org>;
	Fri, 11 Jan 2008 13:48:53 -0700 (MST)
Received: from loki (aoeu.am.freescale.net [10.82.16.43])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id m0BKmkl3012675
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Jan 2008 14:48:46 -0600 (CST)
Received: from scott by loki with local (Exim 4.68)
	(envelope-from <scottwood@freescale.com>) id 1JDQoI-0002wL-Tj
	for linux-mtd@lists.infradead.org; Fri, 11 Jan 2008 14:49:02 -0600
Date: Fri, 11 Jan 2008 14:49:02 -0600
From: Scott Wood <scottwood@freescale.com>
To: linux-mtd@lists.infradead.org
Subject: [RESEND PATCH 1/3] nand base: Don't panic if a controller driver
	does ecc its own way.
Message-ID: <20080111204902.GA11291@loki.buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Reply-To: scottwood@freescale.com, linux-mtd@lists.infradead.org,
	linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some hardware, such as the enhanced local bus controller used on some
mpc83xx chips, does ecc transparently when reading and writing data, rather
than providing a generic calculate/correct mechanism that can be exported to
the nand subsystem.

The subsystem should not BUG() when calculate, correct, or hwctl are
missing, if the methods that call them have been overridden.

Signed-off-by: Scott Wood <scottwood@freescale.com>
---
Patch series resent with the right list address.  Was previously sent
to David and the linuxppc-dev list.

 drivers/mtd/nand/nand_base.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e29c1da..85a7283 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2469,8 +2469,12 @@ int nand_scan_tail(struct mtd_info *mtd)
 			chip->ecc.write_oob = nand_write_oob_std;
 
 	case NAND_ECC_HW_SYNDROME:
-		if (!chip->ecc.calculate || !chip->ecc.correct ||
-		    !chip->ecc.hwctl) {
+		if ((!chip->ecc.calculate || !chip->ecc.correct ||
+		     !chip->ecc.hwctl) &&
+		    (!chip->ecc.read_page ||
+		     chip->ecc.read_page == nand_read_page_hwecc) ||
+		     !chip->ecc.write_page ||
+		     chip->ecc.write_page == nand_write_page_hwecc) {
 			printk(KERN_WARNING "No ECC functions supplied, "
 			       "Hardware ECC not possible\n");
 			BUG();
-- 
1.5.3.8
