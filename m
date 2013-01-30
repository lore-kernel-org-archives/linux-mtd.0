Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U0eNE-0008PF-Fq
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2013 20:35:14 +0000
From: John Crispin <blogic@openwrt.org>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] mtd: lantiq: Add NAND support on Lantiq Falcon SoC.
Date: Wed, 30 Jan 2013 21:32:16 +0100
Message-Id: <1359577936-7004-1-git-send-email-blogic@openwrt.org>
Cc: Thomas Langer <thomas.langer@lantiq.com>, linux-mtd@lists.infradead.org,
 John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver uses plat_nand. As the platform_device is loaded from DT, we need
to lookup the node and attach our falcon specific "struct platform_nand_data"
to it.

Signed-off-by: Thomas Langer <thomas.langer@lantiq.com>
Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/mtd/nand/Kconfig       |    8 ++++
 drivers/mtd/nand/Makefile      |    1 +
 drivers/mtd/nand/falcon_nand.c |   83 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 drivers/mtd/nand/falcon_nand.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5819eb5..058939d 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -575,4 +575,12 @@ config MTD_NAND_XWAY
 	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is attached
 	  to the External Bus Unit (EBU).
 
+config MTD_NAND_FALCON
+	tristate "Support for NAND on Lantiq FALC-ON SoC"
+	depends on LANTIQ && SOC_FALCON
+	select MTD_NAND_PLATFORM
+	help
+	  Enables support for NAND Flash chips on Lantiq FALC-ON SoCs. NAND is
+	  attached to the External Bus Unit (EBU).
+
 endif # MTD_NAND
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index d76d912..1a61bf0 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -53,5 +53,6 @@ obj-$(CONFIG_MTD_NAND_JZ4740)		+= jz4740_nand.o
 obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
 obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
 obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
+obj-$(CONFIG_MTD_NAND_FALCON)		+= falcon_nand.o
 
 nand-objs := nand_base.o nand_bbt.o
diff --git a/drivers/mtd/nand/falcon_nand.c b/drivers/mtd/nand/falcon_nand.c
new file mode 100644
index 0000000..13458d3
--- /dev/null
+++ b/drivers/mtd/nand/falcon_nand.c
@@ -0,0 +1,83 @@
+/*
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation.
+ *
+ * Copyright (C) 2011 Thomas Langer <thomas.langer@lantiq.com>
+ * Copyright (C) 2011 John Crispin <blogic@openwrt.org>
+ */
+
+#include <linux/mtd/nand.h>
+#include <linux/of_platform.h>
+
+#include <lantiq_soc.h>
+
+/* address lines used for NAND control signals */
+#define NAND_ADDR_ALE		0x10000
+#define NAND_ADDR_CLE		0x20000
+
+/* Ready/Busy Status */
+#define MODCON_STS		0x0002
+
+/* Ready/Busy Status Edge */
+#define MODCON_STSEDGE		0x0004
+#define LTQ_EBU_MODCON		0x000C
+
+static const char const *part_probes[] = { "cmdlinepart", "ofpart", NULL };
+
+static int falcon_nand_ready(struct mtd_info *mtd)
+{
+	u32 modcon = ltq_ebu_r32(LTQ_EBU_MODCON);
+
+	return (((modcon & (MODCON_STS | MODCON_STSEDGE)) ==
+						(MODCON_STS | MODCON_STSEDGE)));
+}
+
+static void falcon_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
+{
+	struct nand_chip *this = mtd->priv;
+	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
+
+	if (ctrl & NAND_CTRL_CHANGE) {
+		nandaddr &= ~(NAND_ADDR_ALE | NAND_ADDR_CLE);
+
+		if (ctrl & NAND_CLE)
+			nandaddr |= NAND_ADDR_CLE;
+		if (ctrl & NAND_ALE)
+			nandaddr |= NAND_ADDR_ALE;
+
+		this->IO_ADDR_W = (void __iomem *) nandaddr;
+	}
+
+	if (cmd != NAND_CMD_NONE)
+		writeb(cmd, this->IO_ADDR_W);
+}
+
+static struct platform_nand_data falcon_nand_data = {
+	.chip = {
+		.nr_chips		= 1,
+		.chip_delay		= 25,
+		.part_probe_types	= part_probes,
+	},
+	.ctrl = {
+		.cmd_ctrl		= falcon_hwcontrol,
+		.dev_ready		= falcon_nand_ready,
+	}
+};
+
+int __init falcon_register_nand(void)
+{
+	struct device_node *node;
+	struct platform_device *pdev;
+
+	node = of_find_compatible_node(NULL, NULL, "lantiq,nand-falcon");
+	if (!node)
+		return -1;
+	pdev = of_find_device_by_node(node);
+	if (pdev)
+		pdev->dev.platform_data = &falcon_nand_data;
+	of_node_put(node);
+	return 0;
+}
+
+arch_initcall(falcon_register_nand);
-- 
1.7.10.4
