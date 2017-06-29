Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQXte-0001Rj-Th
 for linux-mtd@lists.infradead.org; Thu, 29 Jun 2017 11:46:13 +0000
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] spi-nor: intel-spi: Add support for Intel Denverton SPI
 serial flash controller
Date: Thu, 29 Jun 2017 14:45:42 +0300
Message-Id: <20170629114542.74720-1-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Intel Denverton exposes the SPI serial flash controller as a PCI device
instead of being part of the LPC chip as previous generations did.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mtd/spi-nor/Kconfig         | 16 ++++++++
 drivers/mtd/spi-nor/Makefile        |  3 +-
 drivers/mtd/spi-nor/intel-spi-pci.c | 82 +++++++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/spi-nor/intel-spi-pci.c

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index bfdfb1e72b38..8cc9b4070d9e 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -106,6 +106,22 @@ config SPI_INTEL_SPI_PLATFORM
 	  To compile this driver as a module, choose M here: the module
 	  will be called intel-spi-platform.
 
+config SPI_INTEL_SPI_PCI
+	tristate "Intel PCH/PCU SPI flash PCI driver" if EXPERT
+	depends on X86 && PCI
+	select SPI_INTEL_SPI
+	help
+	  This enables PCI support for the Intel PCH/PCU SPI controller in
+	  master mode. This controller is present in modern Intel hardware
+	  and is used to hold BIOS and other persistent settings. Using
+	  this driver it is possible to upgrade BIOS directly from Linux.
+
+	  Say N here unless you know what you are doing. Overwriting the
+	  SPI flash may render the system unbootable.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called intel-spi-pci.
+
 config SPI_STM32_QUADSPI
 	tristate "STM32 Quad SPI controller"
 	depends on ARCH_STM32
diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 285aab86c7ca..92695f2eb7ae 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -8,4 +8,5 @@ obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
 obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
 obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
 obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
-obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
\ No newline at end of file
+obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
+obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/intel-spi-pci.c
new file mode 100644
index 000000000000..e82652335ede
--- /dev/null
+++ b/drivers/mtd/spi-nor/intel-spi-pci.c
@@ -0,0 +1,82 @@
+/*
+ * Intel PCH/PCU SPI flash PCI driver.
+ *
+ * Copyright (C) 2016, Intel Corporation
+ * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include "intel-spi.h"
+
+#define BCR		0xdc
+#define BCR_WPD		BIT(0)
+
+static const struct intel_spi_boardinfo bxt_info = {
+	.type = INTEL_SPI_BXT,
+};
+
+static int intel_spi_pci_probe(struct pci_dev *pdev,
+			       const struct pci_device_id *id)
+{
+	struct intel_spi_boardinfo *info;
+	struct intel_spi *ispi;
+	u32 bcr;
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	info = devm_kmemdup(&pdev->dev, (void *)id->driver_data, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	/* Try to make the chip read/write */
+	pci_read_config_dword(pdev, BCR, &bcr);
+	if (!(bcr & BCR_WPD)) {
+		bcr |= BCR_WPD;
+		pci_write_config_dword(pdev, BCR, bcr);
+		pci_read_config_dword(pdev, BCR, &bcr);
+	}
+	info->writeable = !!(bcr & BCR_WPD);
+
+	ispi = intel_spi_probe(&pdev->dev, &pdev->resource[0], info);
+	if (IS_ERR(ispi))
+		return PTR_ERR(ispi);
+
+	pci_set_drvdata(pdev, ispi);
+	return 0;
+}
+
+static void intel_spi_pci_remove(struct pci_dev *pdev)
+{
+	intel_spi_remove(pci_get_drvdata(pdev));
+}
+
+static const struct pci_device_id intel_spi_pci_ids[] = {
+	{ PCI_VDEVICE(INTEL, 0x19e0), (unsigned long)&bxt_info },
+	{ },
+};
+MODULE_DEVICE_TABLE(pci, intel_spi_pci_ids);
+
+static struct pci_driver intel_spi_pci_driver = {
+	.name = "intel-spi",
+	.id_table = intel_spi_pci_ids,
+	.probe = intel_spi_pci_probe,
+	.remove = intel_spi_pci_remove,
+};
+
+module_pci_driver(intel_spi_pci_driver);
+
+MODULE_DESCRIPTION("Intel PCH/PCU SPI flash PCI driver");
+MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.11.0
