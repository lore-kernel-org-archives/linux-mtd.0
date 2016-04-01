From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Han Xu <han.xu@nxp.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>
Cc: linux-omap@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Zhou Wang <wangzhou1@hisilicon.com>, Alex Smith <alex.smith@imgtec.com>,
 Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH 08/12] mtd: nand: lpc32xx: rely on generic DT parsing done in
 nand_scan_ident()
Date: Fri,  1 Apr 2016 14:54:28 +0200
Message-Id: <1459515272-31011-9-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459515272-31011-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459515272-31011-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The core now takes care of parsing generic DT properties in
nand_scan_ident() when nand_set_flash_node() has been called.
Rely on this initialization instead of calling of_get_nand_xxx()
manually.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/lpc32xx_slc.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index 3b8f373..99925a2 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -194,7 +194,6 @@ struct lpc32xx_nand_cfg_slc {
 	uint32_t rwidth;
 	uint32_t rhold;
 	uint32_t rsetup;
-	bool use_bbt;
 	int wp_gpio;
 	struct mtd_partition *parts;
 	unsigned num_parts;
@@ -747,7 +746,6 @@ static struct lpc32xx_nand_cfg_slc *lpc32xx_parse_dt(struct device *dev)
 		return NULL;
 	}
 
-	ncfg->use_bbt = of_get_nand_on_flash_bbt(np);
 	ncfg->wp_gpio = of_get_named_gpio(np, "gpios", 0);
 
 	return ncfg;
@@ -882,19 +880,15 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	chip->ecc.bytes = LPC32XX_SLC_DEV_ECC_BYTES;
 	chip->ecc.prepad = chip->ecc.postpad = 0;
 
-	/* Avoid extra scan if using BBT, setup BBT support */
-	if (host->ncfg->use_bbt) {
-		chip->bbt_options |= NAND_BBT_USE_FLASH;
-
-		/*
-		 * Use a custom BBT marker setup for small page FLASH that
-		 * won't interfere with the ECC layout. Large and huge page
-		 * FLASH use the standard layout.
-		 */
-		if (mtd->writesize <= 512) {
-			chip->bbt_td = &bbt_smallpage_main_descr;
-			chip->bbt_md = &bbt_smallpage_mirror_descr;
-		}
+	/*
+	 * Use a custom BBT marker setup for small page FLASH that
+	 * won't interfere with the ECC layout. Large and huge page
+	 * FLASH use the standard layout.
+	 */
+	if ((chip->bbt_options & NAND_BBT_USE_FLASH) &&
+	    mtd->writesize <= 512) {
+		chip->bbt_td = &bbt_smallpage_main_descr;
+		chip->bbt_md = &bbt_smallpage_mirror_descr;
 	}
 
 	/*
-- 
2.5.0
