Received: from mail-yk0-f175.google.com ([209.85.160.175])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNEMi-0007VR-Vo
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 04:32:33 +0000
Received: by mail-yk0-f175.google.com with SMTP id 131so21829312ykp.6
 for <linux-mtd@lists.infradead.org>; Mon, 10 Mar 2014 21:32:08 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: nand: fix mention to CONFIG_MTD_NAND_ECC_BCH
Date: Tue, 11 Mar 2014 01:31:26 -0300
Message-Id: <1394512286-31481-1-git-send-email-nunes.erico@gmail.com>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 b32955@freescale.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, Erico Nunes <nunes.erico@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mention to CONFIG_MTD_ECC_BCH in the warning message can be confusing as this
doesn't match the exact name of the configuration option.
This warning showed up once to me when I was starting to set up BCH. After
checking my .config file, it took a moment before realizing it is
CONFIG_MTD_NAND_ECC_BCH instead of CONFIG_MTD_ECC_BCH.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9715a7b..5a93787 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3825,7 +3825,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 	case NAND_ECC_SOFT_BCH:
 		if (!mtd_nand_has_bch()) {
-			pr_warn("CONFIG_MTD_ECC_BCH not enabled\n");
+			pr_warn("CONFIG_MTD_NAND_ECC_BCH not enabled\n");
 			BUG();
 		}
 		ecc->calculate = nand_bch_calculate_ecc;
-- 
1.9.0
