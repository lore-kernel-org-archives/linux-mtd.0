From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <ezequiel@vanguardiasur.com.ar>, <javier@dowhile0.org>,
 <fcooper@ti.com>, <nsekhar@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v3 19/27] memory: omap-gpmc: Prevent GPMC_STATUS from being
 accessed via gpmc_regs
Date: Fri, 18 Sep 2015 17:53:41 +0300
Message-ID: <1442588029-13769-20-git-send-email-rogerq@ti.com>
In-Reply-To: <1442588029-13769-1-git-send-email-rogerq@ti.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

GPMC_STATUS register is private to the GPMC module and must not be
accessed directly by NAND driver through the gpmc_regs.

They must use gpmc_omap_get_nand_ops() instead.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/memory/omap-gpmc.c                   | 2 +-
 include/linux/platform_data/mtd-nand-omap2.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 764e24a..4c630ad 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -1051,7 +1051,7 @@ void gpmc_update_nand_reg(struct gpmc_nand_regs *reg, int cs)
 {
 	int i;
 
-	reg->gpmc_status = gpmc_base + GPMC_STATUS;
+	reg->gpmc_status = NULL;	/* deprecated */
 	reg->gpmc_nand_command = gpmc_base + GPMC_CS0_OFFSET +
 				GPMC_CS_NAND_COMMAND + GPMC_CS_SIZE * cs;
 	reg->gpmc_nand_address = gpmc_base + GPMC_CS0_OFFSET +
diff --git a/include/linux/platform_data/mtd-nand-omap2.h b/include/linux/platform_data/mtd-nand-omap2.h
index 19e509d..17d57a1 100644
--- a/include/linux/platform_data/mtd-nand-omap2.h
+++ b/include/linux/platform_data/mtd-nand-omap2.h
@@ -45,7 +45,6 @@ enum omap_ecc {
 };
 
 struct gpmc_nand_regs {
-	void __iomem	*gpmc_status;
 	void __iomem	*gpmc_nand_command;
 	void __iomem	*gpmc_nand_address;
 	void __iomem	*gpmc_nand_data;
@@ -64,6 +63,8 @@ struct gpmc_nand_regs {
 	void __iomem	*gpmc_bch_result4[GPMC_BCH_NUM_REMAINDER];
 	void __iomem	*gpmc_bch_result5[GPMC_BCH_NUM_REMAINDER];
 	void __iomem	*gpmc_bch_result6[GPMC_BCH_NUM_REMAINDER];
+	/* Deprecated. Do not use */
+	void __iomem	*gpmc_status;
 };
 
 struct omap_nand_platform_data {
-- 
2.1.4
