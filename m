Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN7Xw-0004J9-LB
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 19:06:37 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 6/7] mtd: nand: add sanity check of ecc strength to
 nand_scan_tail()
Date: Wed, 25 Apr 2012 12:06:10 -0700
Message-Id: <1335380771-27805-7-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
References: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds sanity checks that ensure that drivers for controllers with
hardware ECC set the 'strength' element in struct nand_ecc_ctrl.  Also stylistic
changes to the line that calculates strength for software ECC.

This v2 simplifies the check.  Thanks Brian! [1]

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-April/040890.html

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/nand/nand_base.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 3137abd..dac0afa 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3345,8 +3345,13 @@ int nand_scan_tail(struct mtd_info *mtd)
 		if (!chip->ecc.write_oob)
 			chip->ecc.write_oob = nand_write_oob_syndrome;
 
-		if (mtd->writesize >= chip->ecc.size)
+		if (mtd->writesize >= chip->ecc.size) {
+			if (!chip->ecc.strength) {
+				pr_warn("Driver must set ecc.strength when using hardware ECC\n");
+				BUG();
+			}
 			break;
+		}
 		pr_warn("%d byte HW ECC not possible on "
 			   "%d byte page size, fallback to SW ECC\n",
 			   chip->ecc.size, mtd->writesize);
@@ -3401,7 +3406,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 			BUG();
 		}
 		chip->ecc.strength =
-			chip->ecc.bytes*8 / fls(8*chip->ecc.size);
+			chip->ecc.bytes * 8 / fls(8 * chip->ecc.size);
 		break;
 
 	case NAND_ECC_NONE:
-- 
1.7.3.4
