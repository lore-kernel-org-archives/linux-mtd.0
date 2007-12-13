Received: from az33egw01.freescale.net ([192.88.158.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J2rfF-0000rq-TN
	for linux-mtd@lists.infradead.org; Thu, 13 Dec 2007 17:16:08 +0000
Date: Thu, 13 Dec 2007 11:15:28 -0600
From: Scott Wood <scottwood@freescale.com>
To: dwmw2@infradead.org
Subject: [PATCH 1/4] nand base: Don't panic if a controller driver does ecc
	its own way.
Message-ID: <20071213171528.GA4440@loki.buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
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
1.5.3.7
