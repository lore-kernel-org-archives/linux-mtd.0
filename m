Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsKwP-0004zS-DO
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 00:54:31 +0000
Received: by pacyx8 with SMTP id yx8so31977532pac.1
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 17:54:08 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 07/11] mtd: brcmnand: add support for Broadcom's IPROC
 family
Date: Tue, 12 May 2015 17:53:40 -0700
Message-Id: <1431478424-29230-8-git-send-email-computersforpeace@gmail.com>
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
---
v4: split into its own proper platform driver

 drivers/mtd/nand/brcmnand/Makefile     |   3 +
 drivers/mtd/nand/brcmnand/iproc_nand.c | 150 +++++++++++++++++++++++++++++++++
 2 files changed, 153 insertions(+)
 create mode 100644 drivers/mtd/nand/brcmnand/iproc_nand.c

diff --git a/drivers/mtd/nand/brcmnand/Makefile b/drivers/mtd/nand/brcmnand/Makefile
index b7b24f8277cc..e78c3b932fd1 100644
--- a/drivers/mtd/nand/brcmnand/Makefile
+++ b/drivers/mtd/nand/brcmnand/Makefile
@@ -1,2 +1,5 @@
+# link order matters; don't link the more generic brcmstb_nand.o before the
+# more specific iproc_nand.o, for instance
+obj-$(CONFIG_MTD_NAND_BRCMSTB)		+= iproc_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMSTB)		+= brcmstb_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMSTB)		+= brcmnand.o
diff --git a/drivers/mtd/nand/brcmnand/iproc_nand.c b/drivers/mtd/nand/brcmnand/iproc_nand.c
new file mode 100644
index 000000000000..683495c74620
--- /dev/null
+++ b/drivers/mtd/nand/brcmnand/iproc_nand.c
@@ -0,0 +1,150 @@
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
+struct iproc_nand_soc_priv {
+	void __iomem *idm_base;
+	void __iomem *ext_base;
+	spinlock_t idm_lock;
+};
+
+#define IPROC_NAND_CTLR_READY_OFFSET       0x10
+#define IPROC_NAND_CTLR_READY              BIT(0)
+
+#define IPROC_NAND_IO_CTRL_OFFSET          0x00
+#define IPROC_NAND_APB_LE_MODE             BIT(24)
+#define IPROC_NAND_INT_CTRL_READ_ENABLE    BIT(6)
+
+static bool iproc_nand_intc_ack(struct brcmnand_soc *soc)
+{
+	struct iproc_nand_soc_priv *priv = soc->priv;
+	void __iomem *mmio = priv->ext_base + IPROC_NAND_CTLR_READY_OFFSET;
+	u32 val = brcmnand_readl(mmio);
+
+	if (val & IPROC_NAND_CTLR_READY) {
+		brcmnand_writel(IPROC_NAND_CTLR_READY, mmio);
+		return true;
+	}
+
+	return false;
+}
+
+static void iproc_nand_intc_set(struct brcmnand_soc *soc, bool en)
+{
+	struct iproc_nand_soc_priv *priv = soc->priv;
+	void __iomem *mmio = priv->idm_base + IPROC_NAND_IO_CTRL_OFFSET;
+	u32 val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->idm_lock, flags);
+
+	val = brcmnand_readl(mmio);
+
+	if (en)
+		val |= IPROC_NAND_INT_CTRL_READ_ENABLE;
+	else
+		val &= ~IPROC_NAND_INT_CTRL_READ_ENABLE;
+
+	brcmnand_writel(val, mmio);
+
+	spin_unlock_irqrestore(&priv->idm_lock, flags);
+}
+
+static void iproc_nand_apb_access(struct brcmnand_soc *soc, bool prepare)
+{
+	struct iproc_nand_soc_priv *priv = soc->priv;
+	void __iomem *mmio = priv->idm_base + IPROC_NAND_IO_CTRL_OFFSET;
+	u32 val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->idm_lock, flags);
+
+	val = brcmnand_readl(mmio);
+
+	if (prepare)
+		val |= IPROC_NAND_APB_LE_MODE;
+	else
+		val &= ~IPROC_NAND_APB_LE_MODE;
+
+	brcmnand_writel(val, mmio);
+
+	spin_unlock_irqrestore(&priv->idm_lock, flags);
+}
+
+static int iproc_nand_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iproc_nand_soc_priv *priv;
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
+	spin_lock_init(&priv->idm_lock);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "iproc-idm");
+	priv->idm_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->idm_base))
+		return PTR_ERR(priv->idm_base);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "iproc-ext");
+	priv->ext_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->ext_base))
+		return PTR_ERR(priv->ext_base);
+
+	soc->pdev = pdev;
+	soc->priv = priv;
+	soc->ctlrdy_ack = iproc_nand_intc_ack;
+	soc->ctlrdy_set_enabled = iproc_nand_intc_set;
+	soc->prepare_data_bus = iproc_nand_apb_access;
+
+	return brcmnand_probe(pdev, soc);
+}
+
+static const struct of_device_id iproc_nand_of_match[] = {
+	{ .compatible = "brcm,nand-iproc" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, iproc_nand_of_match);
+
+static struct platform_driver iproc_nand_driver = {
+	.probe			= iproc_nand_probe,
+	.remove			= brcmnand_remove,
+	.driver = {
+		.name		= "iproc_nand",
+		.pm		= &brcmnand_pm_ops,
+		.of_match_table	= iproc_nand_of_match,
+	}
+};
+module_platform_driver(iproc_nand_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Brian Norris");
+MODULE_AUTHOR("Ray Jui");
+MODULE_DESCRIPTION("NAND driver for Broadcom IPROC-based SoCs");
-- 
1.9.1
