Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK2yW-0007hw-Fm
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 15:09:11 +0000
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
Subject: [PATCH v2 21/22] mtd: rawnand: Move the ->exec_op() method to
 nand_controller_ops
Date: Tue,  6 Nov 2018 16:08:09 +0100
Message-Id: <20181106150810.9569-22-boris.brezillon@bootlin.com>
In-Reply-To: <20181106150810.9569-1-boris.brezillon@bootlin.com>
References: <20181106150810.9569-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

->exec_op() is a controller method and has nothing to do in the
nand_chip struct. Let's move it to the nand_controller_ops struct and
adjust the core and drivers accordingly.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- Patch ams-delta
---
 drivers/mtd/nand/raw/ams-delta.c    |  7 +-
 drivers/mtd/nand/raw/fsmc_nand.c    |  2 +-
 drivers/mtd/nand/raw/internals.h    | 13 +++-
 drivers/mtd/nand/raw/marvell_nand.c |  2 +-
 drivers/mtd/nand/raw/nand_base.c    | 38 +++++------
 drivers/mtd/nand/raw/nand_hynix.c   |  4 +-
 drivers/mtd/nand/raw/nand_legacy.c  |  4 +-
 drivers/mtd/nand/raw/tegra_nand.c   |  2 +-
 drivers/mtd/nand/raw/vf610_nfc.c    |  4 +-
 include/linux/mtd/rawnand.h         | 99 ++++++++++++++---------------
 10 files changed, 93 insertions(+), 82 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 1c4aa0380599..ae32cce2eb43 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -174,6 +174,10 @@ static int ams_delta_exec_op(struct nand_chip *this,
 	return ret;
 }
 
+static const struct nand_controller_ops ams_delta_ops = {
+	.exec_op = ams_delta_exec_op,
+};
+
 /*
  * Main initialization routine
  */
@@ -214,8 +218,6 @@ static int ams_delta_init(struct platform_device *pdev)
 	priv->io_base = io_base;
 	nand_set_controller_data(this, priv);
 
-	this->exec_op = ams_delta_exec_op;
-
 	priv->gpiod_rdy = devm_gpiod_get_optional(&pdev->dev, "rdy", GPIOD_IN);
 	if (IS_ERR(priv->gpiod_rdy)) {
 		err = PTR_ERR(priv->gpiod_rdy);
@@ -275,6 +277,7 @@ static int ams_delta_init(struct platform_device *pdev)
 	ams_delta_dir_input(priv, true);
 
 	/* Initialize the NAND controller object embedded in ams_delta_nand. */
+	priv->base.ops = &ams_delta_ops;
 	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index ea69ac6e6d7a..1eb5008e7453 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -995,6 +995,7 @@ static int fsmc_nand_attach_chip(struct nand_chip *nand)
 
 static const struct nand_controller_ops fsmc_nand_controller_ops = {
 	.attach_chip = fsmc_nand_attach_chip,
+	.exec_op = fsmc_exec_op,
 };
 
 /*
@@ -1082,7 +1083,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand_set_flash_node(nand, pdev->dev.of_node);
 
 	mtd->dev.parent = &pdev->dev;
-	nand->exec_op = fsmc_exec_op;
 
 	/*
 	 * Setup default ECC mode. nand_dt_init() called from nand_scan_ident()
diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b62728d5884b..ac66b458566f 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -95,16 +95,25 @@ void nand_decode_ext_id(struct nand_chip *chip);
 void panic_nand_wait(struct nand_chip *chip, unsigned long timeo);
 void sanitize_string(uint8_t *s, size_t len);
 
+static inline bool nand_has_exec_op(struct nand_chip *chip)
+{
+	if (!chip->controller || !chip->controller->ops ||
+	    !chip->controller->ops->exec_op)
+		return false;
+
+	return true;
+}
+
 static inline int nand_exec_op(struct nand_chip *chip,
 			       const struct nand_operation *op)
 {
-	if (!chip->exec_op)
+	if (!nand_has_exec_op(chip))
 		return -ENOTSUPP;
 
 	if (WARN_ON(op->cs >= chip->numchips))
 		return -EINVAL;
 
-	return chip->exec_op(chip, op, false);
+	return chip->controller->ops->exec_op(chip, op, false);
 }
 
 /* BBT functions */
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index ba7a45fb1905..2e8257fe7d00 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2505,6 +2505,7 @@ static int marvell_nand_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops marvell_nand_controller_ops = {
 	.attach_chip = marvell_nand_attach_chip,
+	.exec_op = marvell_nfc_exec_op,
 };
 
 static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
@@ -2627,7 +2628,6 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	chip->controller = &nfc->controller;
 	nand_set_flash_node(chip, np);
 
-	chip->exec_op = marvell_nfc_exec_op;
 	if (!of_property_read_bool(np, "marvell,nand-keep-config"))
 		chip->setup_data_interface = marvell_nfc_setup_data_interface;
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index ee30394df0ff..8495cbca050f 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -678,7 +678,7 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
 	u8 status = 0;
 	int ret;
 
-	if (!chip->exec_op)
+	if (!nand_has_exec_op(chip))
 		return -ENOTSUPP;
 
 	/* Wait tWB before polling the STATUS reg. */
@@ -1117,7 +1117,7 @@ int nand_read_page_op(struct nand_chip *chip, unsigned int page,
 	if (offset_in_page + len > mtd->writesize + mtd->oobsize)
 		return -EINVAL;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		if (mtd->writesize > 512)
 			return nand_lp_exec_read_page_op(chip, page,
 							 offset_in_page, buf,
@@ -1156,7 +1156,7 @@ int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
 	if (len && !buf)
 		return -EINVAL;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
 			nand_get_sdr_timings(&chip->data_interface);
 		struct nand_op_instr instrs[] = {
@@ -1211,7 +1211,7 @@ int nand_change_read_column_op(struct nand_chip *chip,
 	if (mtd->writesize <= 512)
 		return -ENOTSUPP;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
 			nand_get_sdr_timings(&chip->data_interface);
 		u8 addrs[2] = {};
@@ -1270,7 +1270,7 @@ int nand_read_oob_op(struct nand_chip *chip, unsigned int page,
 	if (offset_in_oob + len > mtd->oobsize)
 		return -EINVAL;
 
-	if (chip->exec_op)
+	if (nand_has_exec_op(chip))
 		return nand_read_page_op(chip, page,
 					 mtd->writesize + offset_in_oob,
 					 buf, len);
@@ -1383,7 +1383,7 @@ int nand_prog_page_begin_op(struct nand_chip *chip, unsigned int page,
 	if (offset_in_page + len > mtd->writesize + mtd->oobsize)
 		return -EINVAL;
 
-	if (chip->exec_op)
+	if (nand_has_exec_op(chip))
 		return nand_exec_prog_page_op(chip, page, offset_in_page, buf,
 					      len, false);
 
@@ -1410,7 +1410,7 @@ int nand_prog_page_end_op(struct nand_chip *chip)
 	int ret;
 	u8 status;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
 			nand_get_sdr_timings(&chip->data_interface);
 		struct nand_op_instr instrs[] = {
@@ -1469,7 +1469,7 @@ int nand_prog_page_op(struct nand_chip *chip, unsigned int page,
 	if (offset_in_page + len > mtd->writesize + mtd->oobsize)
 		return -EINVAL;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		status = nand_exec_prog_page_op(chip, page, offset_in_page, buf,
 						len, true);
 	} else {
@@ -1517,7 +1517,7 @@ int nand_change_write_column_op(struct nand_chip *chip,
 	if (mtd->writesize <= 512)
 		return -ENOTSUPP;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
 			nand_get_sdr_timings(&chip->data_interface);
 		u8 addrs[2];
@@ -1572,7 +1572,7 @@ int nand_readid_op(struct nand_chip *chip, u8 addr, void *buf,
 	if (len && !buf)
 		return -EINVAL;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
 			nand_get_sdr_timings(&chip->data_interface);
 		struct nand_op_instr instrs[] = {
@@ -1611,7 +1611,7 @@ EXPORT_SYMBOL_GPL(nand_readid_op);
  */
 int nand_status_op(struct nand_chip *chip, u8 *status)
 {
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
 			nand_get_sdr_timings(&chip->data_interface);
 		struct nand_op_instr instrs[] = {
@@ -1648,7 +1648,7 @@ EXPORT_SYMBOL_GPL(nand_status_op);
  */
 int nand_exit_status_op(struct nand_chip *chip)
 {
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_READ0, 0),
 		};
@@ -1680,7 +1680,7 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
 	int ret;
 	u8 status;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
 			nand_get_sdr_timings(&chip->data_interface);
 		u8 addrs[3] = {	page, page >> 8, page >> 16 };
@@ -1739,7 +1739,7 @@ static int nand_set_features_op(struct nand_chip *chip, u8 feature,
 	const u8 *params = data;
 	int i, ret;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
 			nand_get_sdr_timings(&chip->data_interface);
 		struct nand_op_instr instrs[] = {
@@ -1786,7 +1786,7 @@ static int nand_get_features_op(struct nand_chip *chip, u8 feature,
 	u8 *params = data;
 	int i;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
 			nand_get_sdr_timings(&chip->data_interface);
 		struct nand_op_instr instrs[] = {
@@ -1812,7 +1812,7 @@ static int nand_get_features_op(struct nand_chip *chip, u8 feature,
 static int nand_wait_rdy_op(struct nand_chip *chip, unsigned int timeout_ms,
 			    unsigned int delay_ns)
 {
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		struct nand_op_instr instrs[] = {
 			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(timeout_ms),
 					 PSEC_TO_NSEC(delay_ns)),
@@ -1843,7 +1843,7 @@ static int nand_wait_rdy_op(struct nand_chip *chip, unsigned int timeout_ms,
  */
 int nand_reset_op(struct nand_chip *chip)
 {
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		const struct nand_sdr_timings *sdr =
 			nand_get_sdr_timings(&chip->data_interface);
 		struct nand_op_instr instrs[] = {
@@ -1880,7 +1880,7 @@ int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
 	if (!len || !buf)
 		return -EINVAL;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		struct nand_op_instr instrs[] = {
 			NAND_OP_DATA_IN(len, buf, 0),
 		};
@@ -1924,7 +1924,7 @@ int nand_write_data_op(struct nand_chip *chip, const void *buf,
 	if (!len || !buf)
 		return -EINVAL;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		struct nand_op_instr instrs[] = {
 			NAND_OP_DATA_OUT(len, buf, 0),
 		};
diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index 1e4499d01e14..343f477362d1 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -80,7 +80,7 @@ static bool hynix_nand_has_valid_jedecid(struct nand_chip *chip)
 
 static int hynix_nand_cmd_op(struct nand_chip *chip, u8 cmd)
 {
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(cmd, 0),
 		};
@@ -98,7 +98,7 @@ static int hynix_nand_reg_write_op(struct nand_chip *chip, u8 addr, u8 val)
 {
 	u16 column = ((u16)addr << 8) | addr;
 
-	if (chip->exec_op) {
+	if (nand_has_exec_op(chip)) {
 		struct nand_op_instr instrs[] = {
 			NAND_OP_ADDR(1, &addr, 0),
 			NAND_OP_8BIT_DATA_OUT(1, &val, 0),
diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index 4596a538b967..47364237861e 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -577,7 +577,7 @@ void nand_legacy_set_defaults(struct nand_chip *chip)
 {
 	unsigned int busw = chip->options & NAND_BUSWIDTH_16;
 
-	if (chip->exec_op)
+	if (nand_has_exec_op(chip))
 		return;
 
 	/* check for proper chip_delay setup, set 20us if not */
@@ -621,7 +621,7 @@ int nand_legacy_check_hooks(struct nand_chip *chip)
 	 * ->legacy.cmdfunc() is legacy and will only be used if ->exec_op() is
 	 * not populated.
 	 */
-	if (chip->exec_op)
+	if (nand_has_exec_op(chip))
 		return 0;
 
 	/*
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 590393d93ffc..2fe6de09f4ff 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1050,6 +1050,7 @@ static int tegra_nand_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops tegra_nand_controller_ops = {
 	.attach_chip = &tegra_nand_attach_chip,
+	.exec_op = tegra_nand_exec_op,
 };
 
 static int tegra_nand_chips_init(struct device *dev,
@@ -1112,7 +1113,6 @@ static int tegra_nand_chips_init(struct device *dev,
 		mtd->name = "tegra_nand";
 
 	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USE_BOUNCE_BUFFER;
-	chip->exec_op = tegra_nand_exec_op;
 	chip->setup_data_interface = tegra_nand_setup_data_interface;
 
 	ret = nand_scan(chip, 1);
diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 49a174e30211..0fa7cac4ce14 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -812,6 +812,8 @@ static int vf610_nfc_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops vf610_nfc_controller_ops = {
 	.attach_chip = vf610_nfc_attach_chip,
+	.exec_op = vf610_nfc_exec_op,
+
 };
 
 static int vf610_nfc_probe(struct platform_device *pdev)
@@ -879,8 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	chip->exec_op = vf610_nfc_exec_op;
-
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
 	init_completion(&nfc->cmd_done);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 40b74fb1792d..297b40c56403 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -240,49 +240,6 @@ struct nand_id {
 	int len;
 };
 
-/**
- * struct nand_controller_ops - Controller operations
- *
- * @attach_chip: this method is called after the NAND detection phase after
- *		 flash ID and MTD fields such as erase size, page size and OOB
- *		 size have been set up. ECC requirements are available if
- *		 provided by the NAND chip or device tree. Typically used to
- *		 choose the appropriate ECC configuration and allocate
- *		 associated resources.
- *		 This hook is optional.
- * @detach_chip: free all resources allocated/claimed in
- *		 nand_controller_ops->attach_chip().
- *		 This hook is optional.
- */
-struct nand_controller_ops {
-	int (*attach_chip)(struct nand_chip *chip);
-	void (*detach_chip)(struct nand_chip *chip);
-};
-
-/**
- * struct nand_controller - Structure used to describe a NAND controller
- *
- * @lock:               protection lock
- * @active:		the mtd device which holds the controller currently
- * @wq:			wait queue to sleep on if a NAND operation is in
- *			progress used instead of the per chip wait queue
- *			when a hw controller is available.
- * @ops:		NAND controller operations.
- */
-struct nand_controller {
-	spinlock_t lock;
-	struct nand_chip *active;
-	wait_queue_head_t wq;
-	const struct nand_controller_ops *ops;
-};
-
-static inline void nand_controller_init(struct nand_controller *nfc)
-{
-	nfc->active = NULL;
-	spin_lock_init(&nfc->lock);
-	init_waitqueue_head(&nfc->wq);
-}
-
 /**
  * struct nand_ecc_step_info - ECC step information of ECC engine
  * @stepsize: data bytes per ECC step
@@ -897,6 +854,55 @@ struct nand_operation {
 int nand_op_parser_exec_op(struct nand_chip *chip,
 			   const struct nand_op_parser *parser,
 			   const struct nand_operation *op, bool check_only);
+/**
+ * struct nand_controller_ops - Controller operations
+ *
+ * @attach_chip: this method is called after the NAND detection phase after
+ *		 flash ID and MTD fields such as erase size, page size and OOB
+ *		 size have been set up. ECC requirements are available if
+ *		 provided by the NAND chip or device tree. Typically used to
+ *		 choose the appropriate ECC configuration and allocate
+ *		 associated resources.
+ *		 This hook is optional.
+ * @detach_chip: free all resources allocated/claimed in
+ *		 nand_controller_ops->attach_chip().
+ *		 This hook is optional.
+ * @exec_op:	 controller specific method to execute NAND operations.
+ *		 This method replaces chip->legacy.cmdfunc(),
+ *		 chip->legacy.{read,write}_{buf,byte,word}(),
+ *		 chip->legacy.dev_ready() and chip->legacy.waifunc().
+ */
+struct nand_controller_ops {
+	int (*attach_chip)(struct nand_chip *chip);
+	void (*detach_chip)(struct nand_chip *chip);
+	int (*exec_op)(struct nand_chip *chip,
+		       const struct nand_operation *op,
+		       bool check_only);
+};
+
+/**
+ * struct nand_controller - Structure used to describe a NAND controller
+ *
+ * @lock:               protection lock
+ * @active:		the mtd device which holds the controller currently
+ * @wq:			wait queue to sleep on if a NAND operation is in
+ *			progress used instead of the per chip wait queue
+ *			when a hw controller is available.
+ * @ops:		NAND controller operations.
+ */
+struct nand_controller {
+	spinlock_t lock;
+	struct nand_chip *active;
+	wait_queue_head_t wq;
+	const struct nand_controller_ops *ops;
+};
+
+static inline void nand_controller_init(struct nand_controller *nfc)
+{
+	nfc->active = NULL;
+	spin_lock_init(&nfc->lock);
+	init_waitqueue_head(&nfc->wq);
+}
 
 /**
  * struct nand_legacy - NAND chip legacy fields/hooks
@@ -956,10 +962,6 @@ struct nand_legacy {
  *			you're modifying an existing driver that is using those
  *			fields/hooks, you should consider reworking the driver
  *			avoid using them.
- * @exec_op:		controller specific method to execute NAND operations.
- *			This method replaces ->cmdfunc(),
- *			->legacy.{read,write}_{buf,byte,word}(),
- *			->legacy.dev_ready() and ->waifunc().
  * @setup_read_retry:	[FLASHSPECIFIC] flash (vendor) specific function for
  *			setting the read-retry mode. Mostly needed for MLC NAND.
  * @ecc:		[BOARDSPECIFIC] ECC control structure
@@ -1041,9 +1043,6 @@ struct nand_chip {
 
 	struct nand_legacy legacy;
 
-	int (*exec_op)(struct nand_chip *chip,
-		       const struct nand_operation *op,
-		       bool check_only);
 	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
 	int (*setup_data_interface)(struct nand_chip *chip, int chipnr,
 				    const struct nand_data_interface *conf);
-- 
2.17.1
