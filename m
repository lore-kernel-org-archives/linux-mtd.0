Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffMhZ-0005dl-5j
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 09:55:28 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 1/3] mtd: rawnand: better name for the controller structure
Date: Tue, 17 Jul 2018 11:54:52 +0200
Message-Id: <20180717095454.27935-2-miquel.raynal@bootlin.com>
In-Reply-To: <20180717095454.27935-1-miquel.raynal@bootlin.com>
References: <20180717095454.27935-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the raw NAND core, a NAND chip is described by a nand_chip structure,
while a NAND controller is described with a nand_hw_control structure
which is not very meaningful. 'control' is misleading and 'hw' has no
meaning here has it refers to hardware ECC operations only, which is too
restrictive.

Rename this structure nand_controller.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c |  8 ++++----
 drivers/mtd/nand/raw/brcmnand/brcmnand.c     |  2 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c         |  2 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c          |  2 +-
 drivers/mtd/nand/raw/jz4780_nand.c           |  5 +++--
 drivers/mtd/nand/raw/marvell_nand.c          |  4 ++--
 drivers/mtd/nand/raw/mtk_nand.c              |  2 +-
 drivers/mtd/nand/raw/ndfc.c                  |  2 +-
 drivers/mtd/nand/raw/omap2.c                 |  2 +-
 drivers/mtd/nand/raw/oxnas_nand.c            |  2 +-
 drivers/mtd/nand/raw/qcom_nandc.c            |  2 +-
 drivers/mtd/nand/raw/s3c2410.c               |  2 +-
 drivers/mtd/nand/raw/sunxi_nand.c            |  4 ++--
 drivers/mtd/nand/raw/tango_nand.c            |  2 +-
 drivers/mtd/nand/raw/tegra_nand.c            |  4 ++--
 drivers/mtd/nand/raw/txx9ndfmc.c             |  2 +-
 include/linux/mtd/rawnand.h                  | 11 ++++++-----
 17 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index e686fe73159e..8fcb66df10ea 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -216,7 +216,7 @@ struct atmel_nand_controller_caps {
 };
 
 struct atmel_nand_controller {
-	struct nand_hw_control base;
+	struct nand_controller base;
 	const struct atmel_nand_controller_caps *caps;
 	struct device *dev;
 	struct regmap *smc;
@@ -227,7 +227,7 @@ struct atmel_nand_controller {
 };
 
 static inline struct atmel_nand_controller *
-to_nand_controller(struct nand_hw_control *ctl)
+to_nand_controller(struct nand_controller *ctl)
 {
 	return container_of(ctl, struct atmel_nand_controller, base);
 }
@@ -239,7 +239,7 @@ struct atmel_smc_nand_controller {
 };
 
 static inline struct atmel_smc_nand_controller *
-to_smc_nand_controller(struct nand_hw_control *ctl)
+to_smc_nand_controller(struct nand_controller *ctl)
 {
 	return container_of(to_nand_controller(ctl),
 			    struct atmel_smc_nand_controller, base);
@@ -263,7 +263,7 @@ struct atmel_hsmc_nand_controller {
 };
 
 static inline struct atmel_hsmc_nand_controller *
-to_hsmc_nand_controller(struct nand_hw_control *ctl)
+to_hsmc_nand_controller(struct nand_controller *ctl)
 {
 	return container_of(to_nand_controller(ctl),
 			    struct atmel_hsmc_nand_controller, base);
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 1306aaa7a8bf..2c8e3d3977c0 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -114,7 +114,7 @@ enum {
 
 struct brcmnand_controller {
 	struct device		*dev;
-	struct nand_hw_control	controller;
+	struct nand_controller	controller;
 	void __iomem		*nand_base;
 	void __iomem		*nand_fc; /* flash cache */
 	void __iomem		*flash_dma_base;
diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index 51f0b340bc0d..756431ec055b 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -61,7 +61,7 @@ struct fsl_elbc_mtd {
 /* Freescale eLBC FCM controller information */
 
 struct fsl_elbc_fcm_ctrl {
-	struct nand_hw_control controller;
+	struct nand_controller controller;
 	struct fsl_elbc_mtd *chips[MAX_BANKS];
 
 	u8 __iomem *addr;        /* Address of assigned FCM buffer        */
diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 382b67e97174..92b8b63a8b75 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -51,7 +51,7 @@ struct fsl_ifc_mtd {
 
 /* overview of the fsl ifc controller */
 struct fsl_ifc_nand_ctrl {
-	struct nand_hw_control controller;
+	struct nand_controller controller;
 	struct fsl_ifc_mtd *chips[FSL_IFC_BANK_COUNT];
 
 	void __iomem *addr;	/* Address of assigned IFC buffer	*/
diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
index e69f6ae4c539..b9afd41132ac 100644
--- a/drivers/mtd/nand/raw/jz4780_nand.c
+++ b/drivers/mtd/nand/raw/jz4780_nand.c
@@ -44,7 +44,7 @@ struct jz4780_nand_cs {
 struct jz4780_nand_controller {
 	struct device *dev;
 	struct jz4780_bch *bch;
-	struct nand_hw_control controller;
+	struct nand_controller controller;
 	unsigned int num_banks;
 	struct list_head chips;
 	int selected;
@@ -65,7 +65,8 @@ static inline struct jz4780_nand_chip *to_jz4780_nand_chip(struct mtd_info *mtd)
 	return container_of(mtd_to_nand(mtd), struct jz4780_nand_chip, chip);
 }
 
-static inline struct jz4780_nand_controller *to_jz4780_nand_controller(struct nand_hw_control *ctrl)
+static inline struct jz4780_nand_controller
+*to_jz4780_nand_controller(struct nand_controller *ctrl)
 {
 	return container_of(ctrl, struct jz4780_nand_controller, controller);
 }
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 80a074cccb82..fa7d284ac8af 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -318,7 +318,7 @@ struct marvell_nfc_caps {
  * @dma_buf:		32-bit aligned buffer for DMA transfers (NFCv1 only)
  */
 struct marvell_nfc {
-	struct nand_hw_control controller;
+	struct nand_controller controller;
 	struct device *dev;
 	void __iomem *regs;
 	struct clk *core_clk;
@@ -335,7 +335,7 @@ struct marvell_nfc {
 	u8 *dma_buf;
 };
 
-static inline struct marvell_nfc *to_marvell_nfc(struct nand_hw_control *ctrl)
+static inline struct marvell_nfc *to_marvell_nfc(struct nand_controller *ctrl)
 {
 	return container_of(ctrl, struct marvell_nfc, controller);
 }
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 75c845adb050..254ee76d354d 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -145,7 +145,7 @@ struct mtk_nfc_clk {
 };
 
 struct mtk_nfc {
-	struct nand_hw_control controller;
+	struct nand_controller controller;
 	struct mtk_ecc_config ecc_cfg;
 	struct mtk_nfc_clk clk;
 	struct mtk_ecc *ecc;
diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index d8a806894937..fdc55fda5db6 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -39,7 +39,7 @@ struct ndfc_controller {
 	void __iomem *ndfcbase;
 	struct nand_chip chip;
 	int chip_select;
-	struct nand_hw_control ndfc_control;
+	struct nand_controller ndfc_control;
 };
 
 static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index e50c64adc3c8..e943b2e5a5e2 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -145,7 +145,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 /* Shared among all NAND instances to synchronize access to the ECC Engine */
-static struct nand_hw_control omap_gpmc_controller = {
+static struct nand_controller omap_gpmc_controller = {
 	.lock = __SPIN_LOCK_UNLOCKED(omap_gpmc_controller.lock),
 	.wq = __WAIT_QUEUE_HEAD_INITIALIZER(omap_gpmc_controller.wq),
 };
diff --git a/drivers/mtd/nand/raw/oxnas_nand.c b/drivers/mtd/nand/raw/oxnas_nand.c
index d649d5944826..3621c29e7221 100644
--- a/drivers/mtd/nand/raw/oxnas_nand.c
+++ b/drivers/mtd/nand/raw/oxnas_nand.c
@@ -32,7 +32,7 @@
 #define OXNAS_NAND_MAX_CHIPS	1
 
 struct oxnas_nand_ctrl {
-	struct nand_hw_control base;
+	struct nand_controller base;
 	void __iomem *io_base;
 	struct clk *clk;
 	struct nand_chip *chips[OXNAS_NAND_MAX_CHIPS];
diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 994f980c6d86..98800a26b2c7 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -365,7 +365,7 @@ struct nandc_regs {
  *				from all connected NAND devices pagesize
  */
 struct qcom_nand_controller {
-	struct nand_hw_control controller;
+	struct nand_controller controller;
 	struct list_head host_list;
 
 	struct device *dev;
diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index 19661c5d3220..aee043dd4fa9 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -162,7 +162,7 @@ enum s3c_nand_clk_state {
  */
 struct s3c2410_nand_info {
 	/* mtd info */
-	struct nand_hw_control		controller;
+	struct nand_controller		controller;
 	struct s3c2410_nand_mtd		*mtds;
 	struct s3c2410_platform_nand	*platform;
 
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d831a141a196..de19c81a1789 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -234,7 +234,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *			controller events
  */
 struct sunxi_nfc {
-	struct nand_hw_control controller;
+	struct nand_controller controller;
 	struct device *dev;
 	void __iomem *regs;
 	struct clk *ahb_clk;
@@ -247,7 +247,7 @@ struct sunxi_nfc {
 	struct dma_chan *dmac;
 };
 
-static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_hw_control *ctrl)
+static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
 {
 	return container_of(ctrl, struct sunxi_nfc, controller);
 }
diff --git a/drivers/mtd/nand/raw/tango_nand.c b/drivers/mtd/nand/raw/tango_nand.c
index f2052fae21c7..94c8e9ac20b6 100644
--- a/drivers/mtd/nand/raw/tango_nand.c
+++ b/drivers/mtd/nand/raw/tango_nand.c
@@ -83,7 +83,7 @@
 #define MAX_CS		4
 
 struct tango_nfc {
-	struct nand_hw_control hw;
+	struct nand_controller hw;
 	void __iomem *reg_base;
 	void __iomem *mem_base;
 	void __iomem *pbus_base;
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 22d6a7f9ff80..1d5a646ca1e5 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -164,7 +164,7 @@
 				HWSTATUS_RBSY_VALUE(NAND_STATUS_READY))
 
 struct tegra_nand_controller {
-	struct nand_hw_control controller;
+	struct nand_controller controller;
 	struct device *dev;
 	void __iomem *regs;
 	int irq;
@@ -187,7 +187,7 @@ struct tegra_nand_chip {
 };
 
 static inline struct tegra_nand_controller *
-			to_tegra_ctrl(struct nand_hw_control *hw_ctrl)
+			to_tegra_ctrl(struct nand_controller *hw_ctrl)
 {
 	return container_of(hw_ctrl, struct tegra_nand_controller, controller);
 }
diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index b567d212fe7d..89ec8d4c4e83 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -73,7 +73,7 @@ struct txx9ndfmc_drvdata {
 	void __iomem *base;
 	unsigned char hold;	/* in gbusclock */
 	unsigned char spw;	/* in gbusclock */
-	struct nand_hw_control hw_control;
+	struct nand_controller hw_control;
 };
 
 static struct platform_device *mtd_to_platdev(struct mtd_info *mtd)
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index e383c7f32574..cfe39fc18417 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -510,20 +510,21 @@ struct nand_id {
 };
 
 /**
- * struct nand_hw_control - Control structure for hardware controller (e.g ECC generator) shared among independent devices
+ * struct nand_controller - Control structure for hardware controller
+ *                          shared among independent devices
  * @lock:               protection lock
  * @active:		the mtd device which holds the controller currently
  * @wq:			wait queue to sleep on if a NAND operation is in
  *			progress used instead of the per chip wait queue
  *			when a hw controller is available.
  */
-struct nand_hw_control {
+struct nand_controller {
 	spinlock_t lock;
 	struct nand_chip *active;
 	wait_queue_head_t wq;
 };
 
-static inline void nand_hw_control_init(struct nand_hw_control *nfc)
+static inline void nand_hw_control_init(struct nand_controller *nfc)
 {
 	nfc->active = NULL;
 	spin_lock_init(&nfc->lock);
@@ -1334,11 +1335,11 @@ struct nand_chip {
 	flstate_t state;
 
 	uint8_t *oob_poi;
-	struct nand_hw_control *controller;
+	struct nand_controller *controller;
 
 	struct nand_ecc_ctrl ecc;
 	unsigned long buf_align;
-	struct nand_hw_control hwcontrol;
+	struct nand_controller hwcontrol;
 
 	uint8_t *bbt;
 	struct nand_bbt_descr *bbt_td;
-- 
2.14.1
