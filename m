Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6lb9-0003PD-NO
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2015 20:44:28 +0000
Subject: [PATCH linux-next (v2) 3/3] mtd: brcmnand: Add support for the BCM6368
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
References: <566891DA.1050208@simon.arlott.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>,
 Jonas Gorski <jogo@openwrt.org>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <5668928A.50601@simon.arlott.org.uk>
Date: Wed, 9 Dec 2015 20:43:54 +0000
MIME-Version: 1.0
In-Reply-To: <566891DA.1050208@simon.arlott.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The BCM6368 has a NAND interrupt register with combined status and enable
registers.

As the BCM6328, BCM6362 and BCM6368 all use v2.1 controllers, the first
variant that will work with this driver is the BCM63268 using a v4.0
controller.

Set up the device by disabling and acking all interrupts, then handle
the CTRL_READY interrupt.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
Changed "nand-intr-base" reg name to "nand-int-base".

 drivers/mtd/nand/brcmnand/Makefile       |   1 +
 drivers/mtd/nand/brcmnand/bcm6368_nand.c | 145 +++++++++++++++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 drivers/mtd/nand/brcmnand/bcm6368_nand.c

diff --git a/drivers/mtd/nand/brcmnand/Makefile b/drivers/mtd/nand/brcmnand/Makefile
index 3b1fbfd..b28ffb59 100644
--- a/drivers/mtd/nand/brcmnand/Makefile
+++ b/drivers/mtd/nand/brcmnand/Makefile
@@ -2,5 +2,6 @@
 # more specific iproc_nand.o, for instance
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= iproc_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= bcm63138_nand.o
+obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= bcm6368_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmstb_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand.o
diff --git a/drivers/mtd/nand/brcmnand/bcm6368_nand.c b/drivers/mtd/nand/brcmnand/bcm6368_nand.c
new file mode 100644
index 0000000..7f5359b
--- /dev/null
+++ b/drivers/mtd/nand/brcmnand/bcm6368_nand.c
@@ -0,0 +1,145 @@
+/*
+ * Copyright 2015 Simon Arlott
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * Derived from bcm63138_nand.c:
+ * Copyright © 2015 Broadcom Corporation
+ *
+ * Derived from bcm963xx_4.12L.06B_consumer/shared/opensource/include/bcm963xx/63268_map_part.h:
+ * Copyright 2000-2010 Broadcom Corporation
+ *
+ * Derived from bcm963xx_4.12L.06B_consumer/shared/opensource/flash/nandflash.c:
+ * Copyright 2000-2010 Broadcom Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "brcmnand.h"
+
+struct bcm6368_nand_soc {
+	struct brcmnand_soc soc;
+	void __iomem *base;
+};
+
+#define BCM6368_NAND_INT		0x00
+#define  BCM6368_NAND_STATUS_SHIFT	0
+#define  BCM6368_NAND_STATUS_MASK	(0xfff << BCM6368_NAND_STATUS_SHIFT)
+#define  BCM6368_NAND_ENABLE_SHIFT	16
+#define  BCM6368_NAND_ENABLE_MASK	(0xffff << BCM6368_NAND_ENABLE_SHIFT)
+#define BCM6368_NAND_BASE_ADDR0	0x04
+#define BCM6368_NAND_BASE_ADDR1	0x0c
+
+enum {
+	BCM6368_NP_READ		= BIT(0),
+	BCM6368_BLOCK_ERASE	= BIT(1),
+	BCM6368_COPY_BACK	= BIT(2),
+	BCM6368_PAGE_PGM	= BIT(3),
+	BCM6368_CTRL_READY	= BIT(4),
+	BCM6368_DEV_RBPIN	= BIT(5),
+	BCM6368_ECC_ERR_UNC	= BIT(6),
+	BCM6368_ECC_ERR_CORR	= BIT(7),
+};
+
+static bool bcm6368_nand_intc_ack(struct brcmnand_soc *soc)
+{
+	struct bcm6368_nand_soc *priv =
+			container_of(soc, struct bcm6368_nand_soc, soc);
+	void __iomem *mmio = priv->base + BCM6368_NAND_INT;
+	u32 val = brcmnand_readl(mmio);
+
+	if (val & (BCM6368_CTRL_READY << BCM6368_NAND_STATUS_SHIFT)) {
+		/* Ack interrupt */
+		val &= ~BCM6368_NAND_STATUS_MASK;
+		val |= BCM6368_CTRL_READY << BCM6368_NAND_STATUS_SHIFT;
+		brcmnand_writel(val, mmio);
+		return true;
+	}
+
+	return false;
+}
+
+static void bcm6368_nand_intc_set(struct brcmnand_soc *soc, bool en)
+{
+	struct bcm6368_nand_soc *priv =
+			container_of(soc, struct bcm6368_nand_soc, soc);
+	void __iomem *mmio = priv->base + BCM6368_NAND_INT;
+	u32 val = brcmnand_readl(mmio);
+
+	/* Don't ack any interrupts */
+	val &= ~BCM6368_NAND_STATUS_MASK;
+
+	if (en)
+		val |= BCM6368_CTRL_READY << BCM6368_NAND_ENABLE_SHIFT;
+	else
+		val &= ~(BCM6368_CTRL_READY << BCM6368_NAND_ENABLE_SHIFT);
+
+	brcmnand_writel(val, mmio);
+}
+
+static int bcm6368_nand_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct bcm6368_nand_soc *priv;
+	struct brcmnand_soc *soc;
+	struct resource *res;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	soc = &priv->soc;
+
+	res = platform_get_resource_byname(pdev,
+		IORESOURCE_MEM, "nand-int-base");
+	if (!res)
+		return -EINVAL;
+
+	priv->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	soc->ctlrdy_ack = bcm6368_nand_intc_ack;
+	soc->ctlrdy_set_enabled = bcm6368_nand_intc_set;
+
+	/* Disable and ack all interrupts  */
+	brcmnand_writel(0, priv->base + BCM6368_NAND_INT);
+	brcmnand_writel(BCM6368_NAND_STATUS_MASK,
+			priv->base + BCM6368_NAND_INT);
+
+	return brcmnand_probe(pdev, soc);
+}
+
+static const struct of_device_id bcm6368_nand_of_match[] = {
+	{ .compatible = "brcm,nand-bcm6368" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bcm6368_nand_of_match);
+
+static struct platform_driver bcm6368_nand_driver = {
+	.probe			= bcm6368_nand_probe,
+	.remove			= brcmnand_remove,
+	.driver = {
+		.name		= "bcm6368_nand",
+		.pm		= &brcmnand_pm_ops,
+		.of_match_table	= bcm6368_nand_of_match,
+	}
+};
+module_platform_driver(bcm6368_nand_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Simon Arlott");
+MODULE_DESCRIPTION("NAND driver for BCM6368");
-- 
2.1.4

-- 
Simon Arlott
