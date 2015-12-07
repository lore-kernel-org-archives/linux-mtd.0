From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Josh Wu <josh.wu@atmel.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 punnaiah choudary kalluri <punnaia@xilinx.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 22/23] mtd: nand: kill layout field
Date: Mon,  7 Dec 2015 23:26:17 +0100
Message-Id: <1449527178-5930-23-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 8 --------
 drivers/mtd/nand/nand_bch.c  | 9 ---------
 include/linux/mtd/nand.h     | 1 -
 3 files changed, 18 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 6440c5d..85deacb 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4148,13 +4148,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	chip->oob_poi = chip->buffers->databuf + mtd->writesize;
 
 	/*
-	 * Set the provided ECC layout. If ecc->layout is NULL, the MTD core
-	 * will just leave mtd->ooblayout to NULL, if it's not NULL, it will
-	 * set ->ooblayout to the default ecclayout wrapper.
-	 */
-	mtd_set_ecclayout(mtd, ecc->layout);
-
-	/*
 	 * If no default placement scheme is given, select an appropriate one.
 	 */
 	if (!mtd->ooblayout && (ecc->mode != NAND_ECC_SOFT_BCH)) {
@@ -4401,7 +4394,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->writebufsize = mtd->writesize;
 
 	/* propagate ecc info to mtd_info */
-	mtd_set_ecclayout(mtd, ecc->layout);
 	mtd->ecc_strength = ecc->strength;
 	mtd->ecc_step_size = ecc->size;
 	/*
diff --git a/drivers/mtd/nand/nand_bch.c b/drivers/mtd/nand/nand_bch.c
index 2937b49..3b90643 100644
--- a/drivers/mtd/nand/nand_bch.c
+++ b/drivers/mtd/nand/nand_bch.c
@@ -158,15 +158,6 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 
 	eccsteps = mtd->writesize/eccsize;
 
-	/*
-	 * Rely on the default ecclayout to ooblayout wrapper provided by MTD
-	 * core if ecc.layout is not NULL.
-	 * FIXME: this should be removed when all callers have moved to the
-	 * mtd_ooblayout_ops approach.
-	 */
-	if (nand->ecc.layout)
-		mtd_set_ecclayout(mtd, nand->ecc.layout);
-
 	/* if no ecc placement scheme was provided, build one */
 	if (!mtd->ooblayout) {
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9ba9daba..f4ba147 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -494,7 +494,6 @@ struct nand_ecc_ctrl {
 	int strength;
 	int prepad;
 	int postpad;
-	struct nand_ecclayout	*layout;
 	void *priv;
 	void (*hwctl)(struct mtd_info *mtd, int mode);
 	int (*calculate)(struct mtd_info *mtd, const uint8_t *dat,
-- 
2.1.4
