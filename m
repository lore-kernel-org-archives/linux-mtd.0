Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dVjgs-0000Az-Vx
 for linux-mtd@lists.infradead.org; Thu, 13 Jul 2017 19:22:25 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: han.xu@nxp.com, boris.brezillon@free-electrons.com, richard@nod.at,
 linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd: gpmi-nand: do not fail setting ONFI timing mode if
 available
Date: Thu, 13 Jul 2017 21:20:30 +0200
Message-Id: <20170713192030.22177-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

GPMI NFC driver fails to apply timing mode if the ->onfi_get_features()
does not return the mode that was previously applied.

We can assume that a nand chip supports a timing as long as it is
read from the ONFI parameter page. Reading back a different mode than
the one previously applied does not mean the mode is unsupported but
that the nand chip does not implement the ONFI feature because it
probably does not need to.

The output of ->onfi_get_feature() is irrelevant so delete it.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 141bd70a49c2..4d137145439c 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -939,13 +939,6 @@ static int enable_edo_mode(struct gpmi_nand_data *this, int mode)
 	if (ret)
 		goto err_out;
 
-	/* [2] send GET FEATURE command to double-check the timing mode */
-	memset(feature, 0, ONFI_SUBFEATURE_PARAM_LEN);
-	ret = nand->onfi_get_features(mtd, nand,
-				ONFI_FEATURE_ADDR_TIMING_MODE, feature);
-	if (ret || feature[0] != mode)
-		goto err_out;
-
 	nand->select_chip(mtd, -1);
 
 	/* [3] set the main IO clock, 100MHz for mode 5, 80MHz for mode 4. */
-- 
2.11.0
