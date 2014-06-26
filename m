Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1X0GVt-0006vH-Q0
 for linux-mtd@lists.infradead.org; Thu, 26 Jun 2014 20:43:22 +0000
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mxc_nand: fix err_limit and err_mask
Date: Thu, 26 Jun 2014 22:42:47 +0200
Message-Id: <1403815368-29469-1-git-send-email-m.grzeschik@pengutronix.de>
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes the error detection limits for the used
eccsize of the 1, 4 and 8 bit eccmode.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index cb6c845..7fd495e 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -657,10 +657,14 @@ static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
 	u32 ecc_stat, err;
 	int no_subpages = 1;
 	int ret = 0;
-	u8 ecc_bit_mask, err_limit;
+	u8 ecc_bit_mask, err_limit = 0x1;
 
-	ecc_bit_mask = (host->eccsize == 4) ? 0x7 : 0xf;
-	err_limit = (host->eccsize == 4) ? 0x4 : 0x8;
+	ecc_bit_mask = 0xf;
+
+	if (host->eccsize == 4)
+		err_limit = 0x2;
+	else if (host->eccsize == 8)
+		err_limit = 0x4;
 
 	no_subpages = mtd->writesize >> 9;
 
-- 
2.0.0
