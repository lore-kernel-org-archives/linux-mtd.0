Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFCu7-000561-RM
	for linux-mtd@lists.infradead.org; Wed, 16 Jan 2008 18:22:24 +0000
Date: Wed, 16 Jan 2008 10:36:03 -0600
From: Scott Wood <scottwood@freescale.com>
To: dwmw2@infradead.org
Subject: [PATCH] Fix misparenthesization introduced by commit
	78b65179d08e7e4466ba69d5ede85035a2c96358
Message-ID: <20080116163603.GA4703@loki.buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 85a7283..971d58c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2472,9 +2472,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 		if ((!chip->ecc.calculate || !chip->ecc.correct ||
 		     !chip->ecc.hwctl) &&
 		    (!chip->ecc.read_page ||
-		     chip->ecc.read_page == nand_read_page_hwecc) ||
+		     chip->ecc.read_page == nand_read_page_hwecc ||
 		     !chip->ecc.write_page ||
-		     chip->ecc.write_page == nand_write_page_hwecc) {
+		     chip->ecc.write_page == nand_write_page_hwecc)) {
 			printk(KERN_WARNING "No ECC functions supplied, "
 			       "Hardware ECC not possible\n");
 			BUG();
-- 
1.5.3.8
