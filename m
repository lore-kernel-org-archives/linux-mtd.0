Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::6])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVJ2X-0002Oj-5X
 for linux-mtd@lists.infradead.org; Fri, 28 Aug 2015 12:45:54 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Roy Spliet <r.spliet@ultimaker.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: sunxi_nand.c: Select the chip in
 sunxi_nand_chip_init_timings()
Date: Fri, 28 Aug 2015 14:45:21 +0200
Message-Id: <1440765921-10972-1-git-send-email-sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_scan_ident() leaves the chip deselected. So just issuing some commands
from the sunxi driver does not work. We need to select the chip before
writing the commands to the NAND device. This patch takes care of this.

Set the new timing on all dies implemented as suggested by Boris.

This was detected on the in-circuit ICnova-A20 SoM equipped with the
Micron MT29F32G08CBACAWP (4GiB) ONFI NAND device.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Roy Spliet <r.spliet@ultimaker.com>
Cc: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/sunxi_nand.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index f97a58d..6e7941b 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -978,17 +978,23 @@ static int sunxi_nand_chip_init_timings(struct sunxi_nand_chip *chip,
 		mode = chip->nand.onfi_timing_mode_default;
 	} else {
 		uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {};
+		int i;
 
 		mode = fls(mode) - 1;
 		if (mode < 0)
 			mode = 0;
 
 		feature[0] = mode;
-		ret = chip->nand.onfi_set_features(&chip->mtd, &chip->nand,
-						ONFI_FEATURE_ADDR_TIMING_MODE,
-						feature);
-		if (ret)
-			return ret;
+		for (i = 0; i < chip->nsels; i++) {
+			chip->nand.select_chip(&chip->mtd, i);
+			ret = chip->nand.onfi_set_features(&chip->mtd,
+						&chip->nand,
+ 						ONFI_FEATURE_ADDR_TIMING_MODE,
+ 						feature);
+			chip->nand.select_chip(&chip->mtd, -1);
+			if (ret)
+				return ret;
+		}
 	}
 
 	timings = onfi_async_timing_mode_to_sdr_timings(mode);
-- 
2.5.0
