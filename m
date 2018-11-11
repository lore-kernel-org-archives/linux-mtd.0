Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLkb3-0004Yw-2p
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 07:55:54 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 22/22] mtd: rawnand: Move ->setup_data_interface() to
 nand_controller_ops
Date: Sun, 11 Nov 2018 08:55:24 +0100
Message-Id: <20181111075524.13123-23-boris.brezillon@bootlin.com>
In-Reply-To: <20181111075524.13123-1-boris.brezillon@bootlin.com>
References: <20181111075524.13123-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

->setup_data_interface() is a controller specific method and should
thus be placed in nand_controller_ops.

In order to make that work with controllers that support keeping
pre-configured timings we need to add a new NAND_KEEP_TIMINGS flag to
inform the core it should skip the timings selection step.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changes in v3:
- Add Janusz T-b

Changes in v2:
- None
---
 drivers/mtd/nand/raw/atmel/nand-controller.c |  5 +++--
 drivers/mtd/nand/raw/denali.c                |  3 ++-
 drivers/mtd/nand/raw/fsmc_nand.c             |  7 ++++---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c   |  2 +-
 drivers/mtd/nand/raw/internals.h             | 12 ++++++++++++
 drivers/mtd/nand/raw/marvell_nand.c          |  3 ++-
 drivers/mtd/nand/raw/mtk_nand.c              |  2 +-
 drivers/mtd/nand/raw/mxc_nand.c              | 12 +++++++++++-
 drivers/mtd/nand/raw/nand_base.c             | 14 ++++++++------
 drivers/mtd/nand/raw/nand_legacy.c           |  2 +-
 drivers/mtd/nand/raw/s3c2410.c               |  5 +++--
 drivers/mtd/nand/raw/sunxi_nand.c            |  2 +-
 drivers/mtd/nand/raw/tango_nand.c            |  2 +-
 drivers/mtd/nand/raw/tegra_nand.c            |  2 +-
 include/linux/mtd/rawnand.h                  | 20 ++++++++++++++------
 15 files changed, 65 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index d5c58eb040d8..dcd3bd73e549 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1479,8 +1479,8 @@ static void atmel_nand_init(struct atmel_nand_controller *nc,
 	chip->legacy.write_buf = atmel_nand_write_buf;
 	chip->legacy.select_chip = atmel_nand_select_chip;
 
-	if (nc->mck && nc->caps->ops->setup_data_interface)
-		chip->setup_data_interface = atmel_nand_setup_data_interface;
+	if (!nc->mck || !nc->caps->ops->setup_data_interface)
+		chip->options |= NAND_KEEP_TIMINGS;
 
 	/* Some NANDs require a longer delay than the default one (20us). */
 	chip->legacy.chip_delay = 40;
@@ -1908,6 +1908,7 @@ static int atmel_nand_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops atmel_nand_controller_ops = {
 	.attach_chip = atmel_nand_attach_chip,
+	.setup_data_interface = atmel_nand_setup_data_interface,
 };
 
 static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 64895ca68c8d..bad3b8ad5e0a 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1316,6 +1316,7 @@ static void denali_detach_chip(struct nand_chip *chip)
 static const struct nand_controller_ops denali_controller_ops = {
 	.attach_chip = denali_attach_chip,
 	.detach_chip = denali_detach_chip,
+	.setup_data_interface = denali_setup_data_interface,
 };
 
 int denali_init(struct denali_nand_info *denali)
@@ -1372,7 +1373,7 @@ int denali_init(struct denali_nand_info *denali)
 
 	/* clk rate info is needed for setup_data_interface */
 	if (denali->clk_rate && denali->clk_x_rate)
-		chip->setup_data_interface = denali_setup_data_interface;
+		chip->options |= NAND_KEEP_TIMINGS;
 
 	chip->dummy_controller.ops = &denali_controller_ops;
 	ret = nand_scan(chip, denali->max_banks);
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 1eb5008e7453..61927c4c2650 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -996,6 +996,7 @@ static int fsmc_nand_attach_chip(struct nand_chip *nand)
 static const struct nand_controller_ops fsmc_nand_controller_ops = {
 	.attach_chip = fsmc_nand_attach_chip,
 	.exec_op = fsmc_exec_op,
+	.setup_data_interface = fsmc_setup_data_interface,
 };
 
 /*
@@ -1108,10 +1109,10 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (host->dev_timings)
+	if (host->dev_timings) {
 		fsmc_nand_setup(host, host->dev_timings);
-	else
-		nand->setup_data_interface = fsmc_setup_data_interface;
+		nand->options |= NAND_KEEP_TIMINGS;
+	}
 
 	if (AMBA_REV_BITS(host->pid) >= 8) {
 		nand->ecc.read_page = fsmc_read_page_hwecc;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index c461d5efabc0..25f9fe79796a 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1889,6 +1889,7 @@ static int gpmi_nand_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops gpmi_nand_controller_ops = {
 	.attach_chip = gpmi_nand_attach_chip,
+	.setup_data_interface = gpmi_setup_data_interface,
 };
 
 static int gpmi_nand_init(struct gpmi_nand_data *this)
@@ -1908,7 +1909,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	nand_set_controller_data(chip, this);
 	nand_set_flash_node(chip, this->pdev->dev.of_node);
 	chip->legacy.select_chip	= gpmi_select_chip;
-	chip->setup_data_interface = gpmi_setup_data_interface;
 	chip->legacy.cmd_ctrl	= gpmi_cmd_ctrl;
 	chip->legacy.dev_ready	= gpmi_dev_ready;
 	chip->legacy.read_byte	= gpmi_read_byte;
diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index ac66b458566f..fbf6ca015cd7 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -116,6 +116,18 @@ static inline int nand_exec_op(struct nand_chip *chip,
 	return chip->controller->ops->exec_op(chip, op, false);
 }
 
+static inline bool nand_has_setup_data_iface(struct nand_chip *chip)
+{
+	if (!chip->controller || !chip->controller->ops ||
+	    !chip->controller->ops->setup_data_interface)
+		return false;
+
+	if (chip->options & NAND_KEEP_TIMINGS)
+		return false;
+
+	return true;
+}
+
 /* BBT functions */
 int nand_markbad_bbt(struct nand_chip *chip, loff_t offs);
 int nand_isreserved_bbt(struct nand_chip *chip, loff_t offs);
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 2e8257fe7d00..b7b4d9b14da1 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2506,6 +2506,7 @@ static int marvell_nand_attach_chip(struct nand_chip *chip)
 static const struct nand_controller_ops marvell_nand_controller_ops = {
 	.attach_chip = marvell_nand_attach_chip,
 	.exec_op = marvell_nfc_exec_op,
+	.setup_data_interface = marvell_nfc_setup_data_interface,
 };
 
 static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
@@ -2629,7 +2630,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	nand_set_flash_node(chip, np);
 
 	if (!of_property_read_bool(np, "marvell,nand-keep-config"))
-		chip->setup_data_interface = marvell_nfc_setup_data_interface;
+		chip->options |= NAND_KEEP_TIMINGS;
 
 	mtd = nand_to_mtd(chip);
 	mtd->dev.parent = dev;
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index ce124f8c02cd..b6b4602f5132 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1288,6 +1288,7 @@ static int mtk_nfc_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops mtk_nfc_controller_ops = {
 	.attach_chip = mtk_nfc_attach_chip,
+	.setup_data_interface = mtk_nfc_setup_data_interface,
 };
 
 static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
@@ -1339,7 +1340,6 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	nand->legacy.read_byte = mtk_nfc_read_byte;
 	nand->legacy.read_buf = mtk_nfc_read_buf;
 	nand->legacy.cmd_ctrl = mtk_nfc_cmd_ctrl;
-	nand->setup_data_interface = mtk_nfc_setup_data_interface;
 
 	/* set default mode in case dt entry is missing */
 	nand->ecc.mode = NAND_ECC_HW;
diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index c00b1d408a04..9b75d894cb74 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1738,8 +1738,17 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
 	return 0;
 }
 
+static int mxcnd_setup_data_interface(struct nand_chip *chip, int chipnr,
+				      const struct nand_data_interface *conf)
+{
+	struct mxc_nand_host *host = nand_get_controller_data(chip);
+
+	return host->devtype_data->setup_data_interface(chip, chipnr, conf);
+}
+
 static const struct nand_controller_ops mxcnd_controller_ops = {
 	.attach_chip = mxcnd_attach_chip,
+	.setup_data_interface = mxcnd_setup_data_interface,
 };
 
 static int mxcnd_probe(struct platform_device *pdev)
@@ -1800,7 +1809,8 @@ static int mxcnd_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	this->setup_data_interface = host->devtype_data->setup_data_interface;
+	if (!host->devtype_data->setup_data_interface)
+		this->options |= NAND_KEEP_TIMINGS;
 
 	if (host->devtype_data->needs_ip) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a62bbf22f135..a036333629dc 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -807,7 +807,7 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
 {
 	int ret;
 
-	if (!chip->setup_data_interface)
+	if (!nand_has_setup_data_iface(chip))
 		return 0;
 
 	/*
@@ -825,7 +825,8 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
 	 */
 
 	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
-	ret = chip->setup_data_interface(chip, chipnr, &chip->data_interface);
+	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
+							&chip->data_interface);
 	if (ret)
 		pr_err("Failed to configure data interface to SDR timing mode 0\n");
 
@@ -852,7 +853,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 	};
 	int ret;
 
-	if (!chip->setup_data_interface)
+	if (!nand_has_setup_data_iface(chip))
 		return 0;
 
 	/* Change the mode on the chip side (if supported by the NAND chip) */
@@ -866,7 +867,8 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 	}
 
 	/* Change the mode on the controller side */
-	ret = chip->setup_data_interface(chip, chipnr, &chip->data_interface);
+	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
+							&chip->data_interface);
 	if (ret)
 		return ret;
 
@@ -921,7 +923,7 @@ static int nand_init_data_interface(struct nand_chip *chip)
 {
 	int modes, mode, ret;
 
-	if (!chip->setup_data_interface)
+	if (!nand_has_setup_data_iface(chip))
 		return 0;
 
 	/*
@@ -947,7 +949,7 @@ static int nand_init_data_interface(struct nand_chip *chip)
 		 * Pass NAND_DATA_IFACE_CHECK_ONLY to only check if the
 		 * controller supports the requested timings.
 		 */
-		ret = chip->setup_data_interface(chip,
+		ret = chip->controller->ops->setup_data_interface(chip,
 						 NAND_DATA_IFACE_CHECK_ONLY,
 						 &chip->data_interface);
 		if (!ret) {
diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index 47364237861e..43575943f13b 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -364,7 +364,7 @@ static void nand_ccs_delay(struct nand_chip *chip)
 	 * Wait tCCS_min if it is correctly defined, otherwise wait 500ns
 	 * (which should be safe for all NANDs).
 	 */
-	if (chip->setup_data_interface)
+	if (nand_has_setup_data_iface(chip))
 		ndelay(chip->data_interface.timings.sdr.tCCS_min / 1000);
 	else
 		ndelay(500);
diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index a8905463701a..adc7a196e383 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -876,8 +876,8 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 	 * let's keep behavior unchanged for legacy boards booting via pdata and
 	 * auto-detect timings only when booting with a device tree.
 	 */
-	if (np)
-		chip->setup_data_interface = s3c2410_nand_setup_data_interface;
+	if (!np)
+		chip->options |= NAND_KEEP_TIMINGS;
 
 	switch (info->cpu_type) {
 	case TYPE_S3C2410:
@@ -1011,6 +1011,7 @@ static int s3c2410_nand_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops s3c24xx_nand_controller_ops = {
 	.attach_chip = s3c2410_nand_attach_chip,
+	.setup_data_interface = s3c2410_nand_setup_data_interface,
 };
 
 static const struct of_device_id s3c24xx_nand_dt_ids[] = {
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e489a6ff57d7..a5c83cbe4897 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1847,6 +1847,7 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 
 static const struct nand_controller_ops sunxi_nand_controller_ops = {
 	.attach_chip = sunxi_nand_attach_chip,
+	.setup_data_interface = sunxi_nfc_setup_data_interface,
 };
 
 static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
@@ -1927,7 +1928,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	nand->legacy.read_buf = sunxi_nfc_read_buf;
 	nand->legacy.write_buf = sunxi_nfc_write_buf;
 	nand->legacy.read_byte = sunxi_nfc_read_byte;
-	nand->setup_data_interface = sunxi_nfc_setup_data_interface;
 
 	mtd = nand_to_mtd(nand);
 	mtd->dev.parent = dev;
diff --git a/drivers/mtd/nand/raw/tango_nand.c b/drivers/mtd/nand/raw/tango_nand.c
index ebca4579c033..cb3beda88789 100644
--- a/drivers/mtd/nand/raw/tango_nand.c
+++ b/drivers/mtd/nand/raw/tango_nand.c
@@ -530,6 +530,7 @@ static int tango_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops tango_controller_ops = {
 	.attach_chip = tango_attach_chip,
+	.setup_data_interface = tango_set_timings,
 };
 
 static int chip_init(struct device *dev, struct device_node *np)
@@ -570,7 +571,6 @@ static int chip_init(struct device *dev, struct device_node *np)
 	chip->legacy.select_chip = tango_select_chip;
 	chip->legacy.cmd_ctrl = tango_cmd_ctrl;
 	chip->legacy.dev_ready = tango_dev_ready;
-	chip->setup_data_interface = tango_set_timings;
 	chip->options = NAND_USE_BOUNCE_BUFFER |
 			NAND_NO_SUBPAGE_WRITE |
 			NAND_WAIT_TCCS;
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 2fe6de09f4ff..13be32c38194 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1051,6 +1051,7 @@ static int tegra_nand_attach_chip(struct nand_chip *chip)
 static const struct nand_controller_ops tegra_nand_controller_ops = {
 	.attach_chip = &tegra_nand_attach_chip,
 	.exec_op = tegra_nand_exec_op,
+	.setup_data_interface = tegra_nand_setup_data_interface,
 };
 
 static int tegra_nand_chips_init(struct device *dev,
@@ -1113,7 +1114,6 @@ static int tegra_nand_chips_init(struct device *dev,
 		mtd->name = "tegra_nand";
 
 	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USE_BOUNCE_BUFFER;
-	chip->setup_data_interface = tegra_nand_setup_data_interface;
 
 	ret = nand_scan(chip, 1);
 	if (ret)
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 297b40c56403..f50f40643895 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -203,6 +203,13 @@ enum nand_ecc_algo {
  */
 #define NAND_IS_BOOT_MEDIUM	0x00400000
 
+/*
+ * Do not try to tweak the timings at runtime. This is needed when the
+ * controller initializes the timings on itself or when it relies on
+ * configuration done by the bootloader.
+ */
+#define NAND_KEEP_TIMINGS	0x00800000
+
 /* Cell info constants */
 #define NAND_CI_CHIPNR_MSK	0x03
 #define NAND_CI_CELLTYPE_MSK	0x0C
@@ -871,6 +878,11 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
  *		 This method replaces chip->legacy.cmdfunc(),
  *		 chip->legacy.{read,write}_{buf,byte,word}(),
  *		 chip->legacy.dev_ready() and chip->legacy.waifunc().
+ * @setup_data_interface: setup the data interface and timing. If
+ *			  chipnr is set to %NAND_DATA_IFACE_CHECK_ONLY this
+ *			  means the configuration should not be applied but
+ *			  only checked.
+ *			  This hook is optional.
  */
 struct nand_controller_ops {
 	int (*attach_chip)(struct nand_chip *chip);
@@ -878,6 +890,8 @@ struct nand_controller_ops {
 	int (*exec_op)(struct nand_chip *chip,
 		       const struct nand_operation *op,
 		       bool check_only);
+	int (*setup_data_interface)(struct nand_chip *chip, int chipnr,
+				    const struct nand_data_interface *conf);
 };
 
 /**
@@ -1019,10 +1033,6 @@ struct nand_legacy {
  *			cur_cs < numchips. NAND Controller drivers should not
  *			modify this value, but they're allowed to read it.
  * @read_retries:	[INTERN] the number of read retry modes supported
- * @setup_data_interface: [OPTIONAL] setup the data interface and timing. If
- *			  chipnr is set to %NAND_DATA_IFACE_CHECK_ONLY this
- *			  means the configuration should not be applied but
- *			  only checked.
  * @bbt:		[INTERN] bad block table pointer
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
  *			lookup.
@@ -1044,8 +1054,6 @@ struct nand_chip {
 	struct nand_legacy legacy;
 
 	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
-	int (*setup_data_interface)(struct nand_chip *chip, int chipnr,
-				    const struct nand_data_interface *conf);
 
 	unsigned int options;
 	unsigned int bbt_options;
-- 
2.17.1
