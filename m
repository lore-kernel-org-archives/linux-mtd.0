Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcgK3-0004nP-1F
 for linux-mtd@lists.infradead.org; Wed, 24 Aug 2016 22:07:00 +0000
Received: by mail-pa0-x243.google.com with SMTP id ez1so1879345pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 24 Aug 2016 15:06:39 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: broonie@kernel.org, linux-spi@vger.kernel.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, f.fainelli@gmail.com,
 yendapally.reddy@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, jon.mason@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v6, 3/8] spi: brcmstb-qspi: Broadcom settop platform driver
Date: Wed, 24 Aug 2016 18:04:24 -0400
Message-Id: <1472076269-4731-4-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1472076269-4731-1-git-send-email-kdasu.kdev@gmail.com>
References: <1472076269-4731-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding the settop SoC platfrom driver, this driver is compatible
with the settop MSPI+BSPI and MSPI only blocks implemented on the
SoCs. Driver calls the spi-bcm-qspi probe(), remove() and pm_ops.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/spi/Makefile           |  2 +-
 drivers/spi/spi-brcmstb-qspi.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 drivers/spi/spi-brcmstb-qspi.c

diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 4a715f3..3e753db 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -21,7 +21,7 @@ obj-$(CONFIG_SPI_BCM2835AUX)		+= spi-bcm2835aux.o
 obj-$(CONFIG_SPI_BCM53XX)		+= spi-bcm53xx.o
 obj-$(CONFIG_SPI_BCM63XX)		+= spi-bcm63xx.o
 obj-$(CONFIG_SPI_BCM63XX_HSSPI)		+= spi-bcm63xx-hsspi.o
-obj-$(CONFIG_SPI_BCM_QSPI)		+= spi-bcm-qspi.o
+obj-$(CONFIG_SPI_BCM_QSPI)		+= spi-brcmstb-qspi.o spi-bcm-qspi.o
 obj-$(CONFIG_SPI_BFIN5XX)		+= spi-bfin5xx.o
 obj-$(CONFIG_SPI_ADI_V3)                += spi-adi-v3.o
 obj-$(CONFIG_SPI_BFIN_SPORT)		+= spi-bfin-sport.o
diff --git a/drivers/spi/spi-brcmstb-qspi.c b/drivers/spi/spi-brcmstb-qspi.c
new file mode 100644
index 0000000..c7df92e
--- /dev/null
+++ b/drivers/spi/spi-brcmstb-qspi.c
@@ -0,0 +1,53 @@
+/*
+ * Copyright 2016 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License, version 2, as
+ * published by the Free Software Foundation (the "GPL").
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License version 2 (GPLv2) for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * version 2 (GPLv2) along with this source code.
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include "spi-bcm-qspi.h"
+
+static const struct of_device_id brcmstb_qspi_of_match[] = {
+	{ .compatible = "brcm,spi-brcmstb-qspi" },
+	{ .compatible = "brcm,spi-brcmstb-mspi" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, brcmstb_qspi_of_match);
+
+static int brcmstb_qspi_probe(struct platform_device *pdev)
+{
+	return bcm_qspi_probe(pdev, NULL);
+}
+
+static int brcmstb_qspi_remove(struct platform_device *pdev)
+{
+	return bcm_qspi_remove(pdev);
+}
+
+static struct platform_driver brcmstb_qspi_driver = {
+	.probe			= brcmstb_qspi_probe,
+	.remove			= brcmstb_qspi_remove,
+	.driver = {
+		.name		= "brcmstb_qspi",
+		.pm		= &bcm_qspi_pm_ops,
+		.of_match_table = brcmstb_qspi_of_match,
+	}
+};
+module_platform_driver(brcmstb_qspi_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Kamal Dasu");
+MODULE_DESCRIPTION("Broadcom SPI driver for settop SoC");
-- 
1.9.1
