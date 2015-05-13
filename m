Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsKwM-0004zq-Ff
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 00:54:28 +0000
Received: by pacyx8 with SMTP id yx8so31978244pac.1
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 17:54:10 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 08/11] mtd: brcmnand: add BCM63138 support
Date: Tue, 12 May 2015 17:53:41 -0700
Message-Id: <1431478424-29230-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>,
 Kevin Cernekee <cernekee@gmail.com>, Corneliu Doban <cdoban@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
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

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>
---
v4: split into its own proper platform driver

 drivers/mtd/nand/brcmnand/Makefile        |   1 +
 drivers/mtd/nand/brcmnand/bcm63138_nand.c | 111 ++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 drivers/mtd/nand/brcmnand/bcm63138_nand.c

diff --git a/drivers/mtd/nand/brcmnand/Makefile b/drivers/mtd/nand/brcmnand/Makefile
index e78c3b932fd1..45a091e0550f 100644
--- a/drivers/mtd/nand/brcmnand/Makefile
+++ b/drivers/mtd/nand/brcmnand/Makefile
@@ -1,5 +1,6 @@
 # link order matters; don't link the more generic brcmstb_nand.o before the
 # more specific iproc_nand.o, for instance
 obj-$(CONFIG_MTD_NAND_BRCMSTB)		+= iproc_nand.o
+obj-$(CONFIG_MTD_NAND_BRCMSTB)		+= bcm63138_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMSTB)		+= brcmstb_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMSTB)		+= brcmnand.o
diff --git a/drivers/mtd/nand/brcmnand/bcm63138_nand.c b/drivers/mtd/nand/brcmnand/bcm63138_nand.c
new file mode 100644
index 000000000000..3f4c44c24e14
--- /dev/null
+++ b/drivers/mtd/nand/brcmnand/bcm63138_nand.c
@@ -0,0 +1,111 @@
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
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "brcmnand.h"
+
+struct bcm63138_nand_soc_priv {
+	void __iomem *base;
+};
+
+#define BCM63138_NAND_INT_STATUS		0x00
+#define BCM63138_NAND_INT_EN			0x04
+
+enum {
+	BCM63138_CTLRDY		= BIT(4),
+};
+
+static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
+{
+	struct bcm63138_nand_soc_priv *priv = soc->priv;
+	void __iomem *mmio = priv->base + BCM63138_NAND_INT_STATUS;
+	u32 val = brcmnand_readl(mmio);
+
+	if (val & BCM63138_CTLRDY) {
+		brcmnand_writel(val & ~BCM63138_CTLRDY, mmio);
+		return true;
+	}
+
+	return false;
+}
+
+static void bcm63138_nand_intc_set(struct brcmnand_soc *soc, bool en)
+{
+	struct bcm63138_nand_soc_priv *priv = soc->priv;
+	void __iomem *mmio = priv->base + BCM63138_NAND_INT_EN;
+	u32 val = brcmnand_readl(mmio);
+
+	if (en)
+		val |= BCM63138_CTLRDY;
+	else
+		val &= ~BCM63138_CTLRDY;
+
+	brcmnand_writel(val, mmio);
+}
+
+static int bcm63138_nand_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct bcm63138_nand_soc_priv *priv;
+	struct brcmnand_soc *soc;
+	struct resource *res;
+
+	soc = devm_kzalloc(dev, sizeof(*soc), GFP_KERNEL);
+	if (!soc)
+		return -ENOMEM;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand-int-base");
+	priv->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	soc->pdev = pdev;
+	soc->priv = priv;
+	soc->ctlrdy_ack = bcm63138_nand_intc_ack;
+	soc->ctlrdy_set_enabled = bcm63138_nand_intc_set;
+
+	return brcmnand_probe(pdev, soc);
+}
+
+static const struct of_device_id bcm63138_nand_of_match[] = {
+	{ .compatible = "brcm,nand-bcm63138" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bcm63138_nand_of_match);
+
+static struct platform_driver bcm63138_nand_driver = {
+	.probe			= bcm63138_nand_probe,
+	.remove			= brcmnand_remove,
+	.driver = {
+		.name		= "bcm63138_nand",
+		.pm		= &brcmnand_pm_ops,
+		.of_match_table	= bcm63138_nand_of_match,
+	}
+};
+module_platform_driver(bcm63138_nand_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Brian Norris");
+MODULE_DESCRIPTION("NAND driver for BCM63138");
-- 
1.9.1
