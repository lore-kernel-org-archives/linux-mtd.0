Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIM2H-0008Ni-JH
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:29:43 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3113364wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 07:29:41 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?q?=5BRFC=20PATCH=206/9=5D=20nand/denali=3A=20add=20an=20mmio=20driver?=
Date: Fri,  6 May 2011 15:29:00 +0100
Message-Id: <1304692143-22432-7-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org,
	chuanxiao.dong@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add an mmio driver so that the Denali controller can be used as a
platform_device.  This is useful on SoC devices.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/Kconfig       |   10 +++-
 drivers/mtd/nand/Makefile      |    1 +
 drivers/mtd/nand/denali.h      |    1 +
 drivers/mtd/nand/denali_mmio.c |  145 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 156 insertions(+), 1 deletions(-)
 create mode 100644 drivers/mtd/nand/denali_mmio.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index d629b68..6698bd5 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -78,7 +78,15 @@ config MTD_NAND_DENALI_PCI
         help
           Enable the driver for NAND flash on Intel Moorestown, using the
           Denali NAND controller core.
- 
+
+config MTD_NAND_DENALI_MMIO
+	tristate "Support Denali NAND controller as an MMIO device"
+	depends on HAVE_CLK && MTD_NAND_DENALI
+	help
+	  Enable the driver for NAND flash on platforms using a Denali NAND
+	  controller as an MMIO device.  This uses a platform_driver and
+	  platform_device as the driver model interface.
+
 config MTD_NAND_DENALI_SCRATCH_REG_ADDR
         hex "Denali NAND size scratch register address"
         default "0xFF108018"
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index ed4a2d8..c400549 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+= ams-delta.o
 obj-$(CONFIG_MTD_NAND_AUTCPU12)		+= autcpu12.o
 obj-$(CONFIG_MTD_NAND_DENALI)		+= denali.o
 obj-$(CONFIG_MTD_NAND_DENALI_PCI)	+= denali_pci.o
+obj-$(CONFIG_MTD_NAND_DENALI_MMIO)	+= denali_mmio.o
 obj-$(CONFIG_MTD_NAND_EDB7312)		+= edb7312.o
 obj-$(CONFIG_MTD_NAND_AU1550)		+= au1550nd.o
 obj-$(CONFIG_MTD_NAND_BF5XX)		+= bf5xx_nand.o
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index e5aa995..3f99b7b 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -466,6 +466,7 @@ struct nand_buf {
 
 #define INTEL_CE4100	1
 #define INTEL_MRST	2
+#define MMIO		3
 
 struct denali_nand_info {
 	struct mtd_info mtd;
diff --git a/drivers/mtd/nand/denali_mmio.c b/drivers/mtd/nand/denali_mmio.c
new file mode 100644
index 0000000..b9ef645
--- /dev/null
+++ b/drivers/mtd/nand/denali_mmio.c
@@ -0,0 +1,145 @@
+/*
+ * NAND Flash Controller Device Driver
+ *
+ * Copyright © 2011, Picochip.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ */
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "denali.h"
+
+struct denali_mmio {
+	struct denali_nand_info	denali;
+	struct clk		*clk;
+};
+
+static void __iomem *request_and_map(struct device *dev,
+				     const struct resource *res)
+{
+	void __iomem *ptr;
+
+	if (!devm_request_mem_region(dev, res->start, resource_size(res),
+				     "denali-mmio")) {
+		dev_err(dev, "unable to request %s\n", res->name);
+		return NULL;
+	}
+
+	ptr = devm_ioremap_nocache(dev, res->start, resource_size(res));
+	if (!res)
+		dev_err(dev, "ioremap_nocache of %s failed!", res->name);
+
+	return ptr;
+}
+
+static int __devinit denali_mmio_probe(struct platform_device *pdev)
+{
+	struct resource *reg, *mem;
+	struct denali_mmio *mmio;
+	struct denali_nand_info *denali;
+	int ret;
+
+	mmio = devm_kzalloc(&pdev->dev, sizeof(*mmio), GFP_KERNEL);
+	if (!mmio)
+		return -ENOMEM;
+	denali = &mmio->denali;
+
+	reg = platform_get_resource_byname(pdev, IORESOURCE_MEM, "reg");
+	mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mem");
+	if (!reg || !mem) {
+		dev_err(&pdev->dev, "resources not completely defined\n");
+		return -EINVAL;
+	}
+
+	denali->platform = MMIO;
+	denali->dev = &pdev->dev;
+	denali->irq = platform_get_irq(pdev, 0);
+	if (denali->irq < 0) {
+		dev_err(&pdev->dev, "no irq defined\n");
+		return -ENXIO;
+	}
+
+	denali->flash_reg = request_and_map(&pdev->dev, reg);
+	if (!denali->flash_reg)
+		return -ENOMEM;
+
+	denali->flash_mem = request_and_map(&pdev->dev, mem);
+	if (!denali->flash_mem)
+		return -ENOMEM;
+
+	mmio->clk = clk_get(&pdev->dev, NULL);
+	if (IS_ERR(mmio->clk)) {
+		dev_err(&pdev->dev, "no clk available\n");
+		return PTR_ERR(mmio->clk);
+	}
+
+	ret = clk_enable(mmio->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "unable to enable clk\n");
+		goto out_put_clk;
+	}
+
+	ret = denali_init(denali);
+	if (ret)
+		goto out_disable_clk;
+
+	platform_set_drvdata(pdev, mmio);
+
+	return 0;
+
+out_disable_clk:
+	clk_disable(mmio->clk);
+out_put_clk:
+	clk_put(mmio->clk);
+
+	return ret;
+}
+
+static int __devexit denali_mmio_remove(struct platform_device *pdev)
+{
+	struct denali_mmio *mmio = platform_get_drvdata(pdev);
+
+	denali_remove(&mmio->denali);
+	clk_disable(mmio->clk);
+	clk_put(mmio->clk);
+
+	return 0;
+}
+
+static struct platform_driver denali_mmio_driver = {
+	.probe		= denali_mmio_probe,
+	.remove		= __devexit_p(denali_mmio_remove),
+	.driver		= {
+		.name	= "denali-nand-mmio",
+	},
+};
+
+static int __init denali_init_mmio(void)
+{
+	return platform_driver_register(&denali_mmio_driver);
+}
+module_init(denali_init_mmio);
+
+static void __exit denali_exit_mmio(void)
+{
+	platform_driver_unregister(&denali_mmio_driver);
+}
+module_exit(denali_exit_mmio);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jamie Iles");
+MODULE_DESCRIPTION("MMIO driver for Denali NAND controller");
-- 
1.7.4.4
