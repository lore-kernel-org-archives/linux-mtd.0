Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yq3dQ-0004Ah-Bc
 for linux-mtd@lists.infradead.org; Wed, 06 May 2015 18:01:32 +0000
Received: by pabsx10 with SMTP id sx10so15941643pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 06 May 2015 11:01:07 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Wed,  6 May 2015 10:59:50 -0700
Message-Id: <1430935194-7579-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The STB NAND controller is integrated into various non-STB SoCs, and
those SoCs integrate things like interrupts and busing differently. Add
support for masking/clearing interrupts via a custom hook, as well as
preparing/unpreparing the data bus for data transfers.

Does not support any new SoCs yet; support will be added incrementally.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/Makefile           |  3 +-
 drivers/mtd/nand/brcmnand.h         | 56 +++++++++++++++++++++++++++
 drivers/mtd/nand/brcmstb_nand.c     | 75 ++++++++++++++++++++++++++++++++++---
 drivers/mtd/nand/brcmstb_nand_soc.c | 65 ++++++++++++++++++++++++++++++++
 4 files changed, 193 insertions(+), 6 deletions(-)
 create mode 100644 drivers/mtd/nand/brcmnand.h
 create mode 100644 drivers/mtd/nand/brcmstb_nand_soc.c

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 3b1adddc83dd..806727d5a84b 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
 obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
 obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
 obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
-obj-$(CONFIG_MTD_NAND_BRCMSTB)		+= brcmstb_nand.o
+obj-$(CONFIG_MTD_NAND_BRCMSTB)		+= brcmnand.o
+brcmnand-objs				:= brcmstb_nand.o brcmstb_nand_soc.o
 
 nand-objs := nand_base.o nand_bbt.o nand_timings.o
diff --git a/drivers/mtd/nand/brcmnand.h b/drivers/mtd/nand/brcmnand.h
new file mode 100644
index 000000000000..59e0bfef2331
--- /dev/null
+++ b/drivers/mtd/nand/brcmnand.h
@@ -0,0 +1,56 @@
+/*
+ * Copyright © 2015 Broadcom Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __BRCMNAND_H__
+#define __BRCMNAND_H__
+
+#include <linux/types.h>
+
+struct device;
+struct device_node;
+
+struct brcmnand_soc {
+	struct device *dev; /* parent device */
+	struct device_node *dn;
+	bool (*ctlrdy_ack)(struct brcmnand_soc *soc);
+	void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
+	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare);
+	void *priv;
+};
+
+/**
+ * Probe for a custom Broadcom SoC
+ *
+ * @dev: device to bind devres objects to
+ * @dn: DT node for the custom SoC
+ *
+ * Return a new soc struct if successful. Should be freed with
+ * brcmnand_remove_soc().
+ * Return NULL for all other errors
+ */
+struct brcmnand_soc *devm_brcmnand_probe_soc(struct device *dev,
+					     struct device_node *dn);
+
+static inline void brcmnand_soc_data_bus_prepare(struct brcmnand_soc *soc)
+{
+	if (soc && soc->prepare_data_bus)
+		soc->prepare_data_bus(soc, true);
+}
+
+static inline void brcmnand_soc_data_bus_unprepare(struct brcmnand_soc *soc)
+{
+	if (soc && soc->prepare_data_bus)
+		soc->prepare_data_bus(soc, false);
+}
+
+#endif /* __BRCMNAND_H__ */
diff --git a/drivers/mtd/nand/brcmstb_nand.c b/drivers/mtd/nand/brcmstb_nand.c
index ec65a48d2487..5abc88cfe702 100644
--- a/drivers/mtd/nand/brcmstb_nand.c
+++ b/drivers/mtd/nand/brcmstb_nand.c
@@ -37,6 +37,8 @@
 #include <linux/list.h>
 #include <linux/log2.h>
 
+#include "brcmnand.h"
+
 /*
  * This flag controls if WP stays on between erase/write commands to mitigate
  * flash corruption due to power glitches. Values:
@@ -117,6 +119,9 @@ struct brcmnand_controller {
 	unsigned int		dma_irq;
 	int			nand_version;
 
+	/* Some SoCs provide custom interrupt status register(s) */
+	struct brcmnand_soc	*soc;
+
 	int			cmd_pending;
 	bool			dma_pending;
 	struct completion	done;
@@ -963,6 +968,17 @@ static irqreturn_t brcmnand_ctlrdy_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/* Handle SoC-specific interrupt hardware */
+static irqreturn_t brcmnand_irq(int irq, void *data)
+{
+	struct brcmnand_controller *ctrl = data;
+
+	if (ctrl->soc->ctlrdy_ack(ctrl->soc))
+		return brcmnand_ctlrdy_irq(irq, data);
+
+	return IRQ_NONE;
+}
+
 static irqreturn_t brcmnand_dma_irq(int irq, void *data)
 {
 	struct brcmnand_controller *ctrl = data;
@@ -1151,12 +1167,18 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd, unsigned command,
 	if (native_cmd == CMD_PARAMETER_READ ||
 			native_cmd == CMD_PARAMETER_CHANGE_COL) {
 		int i;
+
+		brcmnand_soc_data_bus_prepare(ctrl->soc);
+
 		/*
 		 * Must cache the FLASH_CACHE now, since changes in
 		 * SECTOR_SIZE_1K may invalidate it
 		 */
 		for (i = 0; i < FC_WORDS; i++)
 			ctrl->flash_cache[i] = brcmnand_read_fc(ctrl, i);
+
+		brcmnand_soc_data_bus_unprepare(ctrl->soc);
+
 		/* Cleanup from HW quirk: restore SECTOR_SIZE_1K */
 		if (host->hwcfg.sector_size_1k)
 			brcmnand_set_sector_size_1k(host,
@@ -1369,10 +1391,15 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 		brcmnand_send_cmd(host, CMD_PAGE_READ);
 		brcmnand_waitfunc(mtd, chip);
 
-		if (likely(buf))
+		if (likely(buf)) {
+			brcmnand_soc_data_bus_prepare(ctrl->soc);
+
 			for (j = 0; j < FC_WORDS; j++, buf++)
 				*buf = brcmnand_read_fc(ctrl, j);
 
+			brcmnand_soc_data_bus_unprepare(ctrl->soc);
+		}
+
 		if (oob)
 			oob += read_oob_from_regs(ctrl, i, oob,
 					mtd->oobsize / trans,
@@ -1544,12 +1571,17 @@ static int brcmnand_write(struct mtd_info *mtd, struct nand_chip *chip,
 				   lower_32_bits(addr));
 		(void)brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS);
 
-		if (buf)
+		if (buf) {
+			brcmnand_soc_data_bus_prepare(ctrl->soc);
+
 			for (j = 0; j < FC_WORDS; j++, buf++)
 				brcmnand_write_fc(ctrl, j, *buf);
-		else if (oob)
+
+			brcmnand_soc_data_bus_unprepare(ctrl->soc);
+		} else if (oob) {
 			for (j = 0; j < FC_WORDS; j++)
 				brcmnand_write_fc(ctrl, j, 0xffffffff);
+		}
 
 		if (oob) {
 			oob += write_oob_to_regs(ctrl, i, oob,
@@ -1993,6 +2025,11 @@ static int brcmnand_resume(struct device *dev)
 	brcmnand_write_reg(ctrl, BRCMNAND_CS_XOR, ctrl->nand_cs_nand_xor);
 	brcmnand_write_reg(ctrl, BRCMNAND_CORR_THRESHOLD,
 			ctrl->corr_stat_threshold);
+	if (ctrl->soc) {
+		/* Clear/re-enable interrupt */
+		ctrl->soc->ctlrdy_ack(ctrl->soc);
+		ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
+	}
 
 	list_for_each_entry(host, &ctrl->host_list, node) {
 		struct mtd_info *mtd = &host->mtd;
@@ -2122,8 +2159,36 @@ static int brcmnand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
-			DRV_NAME, ctrl);
+	/*
+	 * Some SoCs integrate this controller (e.g., its interrupt bits) in
+	 * interesting ways
+	 */
+	if (of_property_read_bool(dn, "brcm,nand-soc")) {
+		struct device_node *soc_dn;
+
+		soc_dn = of_parse_phandle(dn, "brcm,nand-soc", 0);
+		if (!soc_dn)
+			return -ENODEV;
+
+		ctrl->soc = devm_brcmnand_probe_soc(dev, soc_dn);
+		if (!ctrl->soc) {
+			dev_err(dev, "could not probe SoC data\n");
+			of_node_put(soc_dn);
+			return -ENODEV;
+		}
+
+		ret = devm_request_irq(dev, ctrl->irq, brcmnand_irq, 0,
+				       DRV_NAME, ctrl);
+
+		/* Enable interrupt */
+		ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
+
+		of_node_put(soc_dn);
+	} else {
+		/* Use standard interrupt infrastructure */
+		ret = devm_request_irq(dev, ctrl->irq, brcmnand_ctlrdy_irq, 0,
+				       DRV_NAME, ctrl);
+	}
 	if (ret < 0) {
 		dev_err(dev, "can't allocate IRQ %d: error %d\n",
 			ctrl->irq, ret);
diff --git a/drivers/mtd/nand/brcmstb_nand_soc.c b/drivers/mtd/nand/brcmstb_nand_soc.c
new file mode 100644
index 000000000000..970912c690a7
--- /dev/null
+++ b/drivers/mtd/nand/brcmstb_nand_soc.c
@@ -0,0 +1,65 @@
+/*
+ * Copyright © 2015 Broadcom Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+
+#include "brcmnand.h"
+
+#define DRV_NAME	"brcmnand-soc"
+
+struct brcmnand_soc_ofdata {
+	int (*init)(struct brcmnand_soc *soc);
+	bool (*ctlrdy_ack)(struct brcmnand_soc *soc);
+	void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
+	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare);
+};
+
+static const struct of_device_id brcmnand_soc_ofmatch[] = {
+	{},
+};
+
+struct brcmnand_soc *devm_brcmnand_probe_soc(struct device *dev,
+					     struct device_node *dn)
+{
+	const struct brcmnand_soc_ofdata *soc_data;
+	const struct of_device_id *match;
+	struct brcmnand_soc *soc;
+	int ret;
+
+	match = of_match_node(brcmnand_soc_ofmatch, dn);
+	if (!match)
+		return NULL;
+
+	soc_data = match->data;
+
+	soc = devm_kzalloc(dev, sizeof(*soc), GFP_KERNEL);
+	if (!soc)
+		return NULL;
+
+	soc->dev = dev;
+	soc->dn = dn;
+	soc->ctlrdy_ack = soc_data->ctlrdy_ack;
+	soc->ctlrdy_set_enabled = soc_data->ctlrdy_set_enabled;
+	soc->prepare_data_bus = soc_data->prepare_data_bus;
+	if (soc_data->init) {
+		ret = soc_data->init(soc);
+		if (ret)
+			return NULL;
+	}
+
+	return soc;
+}
-- 
1.9.1
