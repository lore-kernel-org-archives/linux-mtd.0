Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MWCO4-0005FS-Kn
	for linux-mtd@lists.infradead.org; Wed, 29 Jul 2009 16:52:25 +0000
Date: Wed, 29 Jul 2009 18:51:56 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V7] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090729165156.GA1471@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
Cc: STEricsson_nomadik_linux@list.st.com, vimal.newwork@gmail.com,
	linux@arm.linux.org.uk, andrea.gallo@stericsson.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alessandro Rubini <rubini@unipv.it>


Signed-off-by: Alessandro Rubini <rubini@unipv.it>
Acked-by: Andrea Gallo <andrea.gallo@stericsson.com>
Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
---

The patch applies to rmk's devel tree.

Changes in V7:
	- removed unused static function
	- use linux/io.h not asm/io.h
	- untabbed a too-tabbed lined
	- remove wrong headers in commit message (I made a mess)

changes in V6:
        - blindly applied checkpatch suggestions (even if I disagree)
        - switched to pm_ops
        - declare soft ecc instead of hard

The last point makes the driver non-working unless the patch by Vimal Singh
at http://patchwork.ozlabs.org/patch/13697/ is applied.


 arch/arm/configs/nhk8815_defconfig        |    2 +-
 arch/arm/mach-nomadik/board-nhk8815.c     |   92 +++++++++++
 arch/arm/mach-nomadik/include/mach/fsmc.h |   29 ++++
 arch/arm/mach-nomadik/include/mach/nand.h |   16 ++
 drivers/mtd/nand/Kconfig                  |    6 +
 drivers/mtd/nand/Makefile                 |    1 +
 drivers/mtd/nand/nomadik_nand.c           |  250 +++++++++++++++++++++++++++++
 7 files changed, 395 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-nomadik/include/mach/fsmc.h
 create mode 100644 arch/arm/mach-nomadik/include/mach/nand.h
 create mode 100644 drivers/mtd/nand/nomadik_nand.c

diff --git a/arch/arm/configs/nhk8815_defconfig b/arch/arm/configs/nhk8815_defconfig
index 9bb45b9..600cb27 100644
--- a/arch/arm/configs/nhk8815_defconfig
+++ b/arch/arm/configs/nhk8815_defconfig
@@ -498,7 +498,7 @@ CONFIG_MTD_CFI_I2=y
 # CONFIG_MTD_DOC2001PLUS is not set
 CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_VERIFY_WRITE=y
-# CONFIG_MTD_NAND_ECC_SMC is not set
+CONFIG_MTD_NAND_ECC_SMC=y
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
 # CONFIG_MTD_NAND_GPIO is not set
 CONFIG_MTD_NAND_IDS=y
diff --git a/arch/arm/mach-nomadik/board-nhk8815.c b/arch/arm/mach-nomadik/board-nhk8815.c
index 79bdea9..0924b19 100644
--- a/arch/arm/mach-nomadik/board-nhk8815.c
+++ b/arch/arm/mach-nomadik/board-nhk8815.c
@@ -16,12 +16,103 @@
 #include <linux/amba/bus.h>
 #include <linux/interrupt.h>
 #include <linux/gpio.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <linux/io.h>
+#include <asm/sizes.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/irq.h>
 #include <mach/setup.h>
+#include <mach/nand.h>
+#include <mach/fsmc.h>
 #include "clock.h"
 
+/* These adresses span 16MB, so use three individual pages */
+static struct resource nhk8815_nand_resources[] = {
+	{
+		.name = "nand_addr",
+		.start = NAND_IO_ADDR,
+		.end = NAND_IO_ADDR + 0xfff,
+		.flags = IORESOURCE_MEM,
+	}, {
+		.name = "nand_cmd",
+		.start = NAND_IO_CMD,
+		.end = NAND_IO_CMD + 0xfff,
+		.flags = IORESOURCE_MEM,
+	}, {
+		.name = "nand_data",
+		.start = NAND_IO_DATA,
+		.end = NAND_IO_DATA + 0xfff,
+		.flags = IORESOURCE_MEM,
+	}
+};
+
+static int nhk8815_nand_init(void)
+{
+	/* FSMC setup for nand chip select (8-bit nand in 8815NHK) */
+	writel(0x0000000E, FSMC_PCR(0));
+	writel(0x000D0A00, FSMC_PMEM(0));
+	writel(0x00100A00, FSMC_PATT(0));
+
+	/* enable access to the chip select area */
+	writel(readl(FSMC_PCR(0)) | 0x04, FSMC_PCR(0));
+
+	return 0;
+}
+
+/*
+ * These partitions are the same as those used in the 2.6.20 release
+ * shipped by the vendor; the first two partitions are mandated
+ * by the boot ROM, and the bootloader area is somehow oversized...
+ */
+static struct mtd_partition nhk8815_partitions[] = {
+	{
+		.name	= "X-Loader(NAND)",
+		.offset = 0,
+		.size	= SZ_256K,
+	}, {
+		.name	= "MemInit(NAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= SZ_256K,
+	}, {
+		.name	= "BootLoader(NAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= SZ_2M,
+	}, {
+		.name	= "Kernel zImage(NAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= 3 * SZ_1M,
+	}, {
+		.name	= "Root Filesystem(NAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= 22 * SZ_1M,
+	}, {
+		.name	= "User Filesystem(NAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= MTDPART_SIZ_FULL,
+	}
+};
+
+static struct nomadik_nand_platform_data nhk8815_nand_data = {
+	.parts		= nhk8815_partitions,
+	.nparts		= ARRAY_SIZE(nhk8815_partitions),
+	.options	= NAND_COPYBACK | NAND_CACHEPRG | NAND_NO_PADDING \
+			| NAND_NO_READRDY | NAND_NO_AUTOINCR,
+	.init		= nhk8815_nand_init,
+};
+
+static struct platform_device nhk8815_nand_device = {
+	.name		= "nomadik_nand",
+	.dev		= {
+		.platform_data = &nhk8815_nand_data,
+	},
+	.resource	= nhk8815_nand_resources,
+	.num_resources	= ARRAY_SIZE(nhk8815_nand_resources),
+};
+
+
 #define __MEM_4K_RESOURCE(x) \
 	.res = {.start = (x), .end = (x) + SZ_4K - 1, .flags = IORESOURCE_MEM}
 
@@ -81,6 +172,7 @@ static int __init nhk8815_eth_init(void)
 device_initcall(nhk8815_eth_init);
 
 static struct platform_device *nhk8815_platform_devices[] __initdata = {
+	&nhk8815_nand_device,
 	&nhk8815_eth_device,
 	/* will add more devices */
 };
diff --git a/arch/arm/mach-nomadik/include/mach/fsmc.h b/arch/arm/mach-nomadik/include/mach/fsmc.h
new file mode 100644
index 0000000..8c2c051
--- /dev/null
+++ b/arch/arm/mach-nomadik/include/mach/fsmc.h
@@ -0,0 +1,29 @@
+
+/* Definitions for the Nomadik FSMC "Flexible Static Memory controller" */
+
+#ifndef __ASM_ARCH_FSMC_H
+#define __ASM_ARCH_FSMC_H
+
+#include <mach/hardware.h>
+/*
+ * Register list
+ */
+
+/* bus control reg. and bus timing reg. for CS0..CS3 */
+#define FSMC_BCR(x)     (NOMADIK_FSMC_VA + (x << 3))
+#define FSMC_BTR(x)     (NOMADIK_FSMC_VA + (x << 3) + 0x04)
+
+/* PC-card and NAND:
+ * PCR = control register
+ * PMEM = memory timing
+ * PATT = attribute timing
+ * PIO = I/O timing
+ * PECCR = ECC result
+ */
+#define FSMC_PCR(x)     (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x00)
+#define FSMC_PMEM(x)    (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x08)
+#define FSMC_PATT(x)    (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x0c)
+#define FSMC_PIO(x)     (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x10)
+#define FSMC_PECCR(x)   (NOMADIK_FSMC_VA + ((2 + x) << 5) + 0x14)
+
+#endif /* __ASM_ARCH_FSMC_H */
diff --git a/arch/arm/mach-nomadik/include/mach/nand.h b/arch/arm/mach-nomadik/include/mach/nand.h
new file mode 100644
index 0000000..c3c8254
--- /dev/null
+++ b/arch/arm/mach-nomadik/include/mach/nand.h
@@ -0,0 +1,16 @@
+#ifndef __ASM_ARCH_NAND_H
+#define __ASM_ARCH_NAND_H
+
+struct nomadik_nand_platform_data {
+	struct mtd_partition *parts;
+	int nparts;
+	int options;
+	int (*init) (void);
+	int (*exit) (void);
+};
+
+#define NAND_IO_DATA	0x40000000
+#define NAND_IO_CMD	0x40800000
+#define NAND_IO_ADDR	0x41000000
+
+#endif				/* __ASM_ARCH_NAND_H */
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index ce96c09..b9fa465 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -426,6 +426,12 @@ config MTD_NAND_MXC
 	  This enables the driver for the NAND flash controller on the
 	  MXC processors.
 
+config MTD_NAND_NOMADIK
+	tristate "ST Nomadik 8815 NAND support"
+	depends on ARCH_NOMADIK
+	help
+	  Driver for the NAND flash controller on the Nomadik, with ECC.
+
 config MTD_NAND_SH_FLCTL
 	tristate "Support for NAND on Renesas SuperH FLCTL"
 	depends on MTD_NAND && SUPERH && CPU_SUBTYPE_SH7723
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index f3a786b..0fe9a0c 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -40,5 +40,6 @@ obj-$(CONFIG_MTD_NAND_SH_FLCTL)		+= sh_flctl.o
 obj-$(CONFIG_MTD_NAND_MXC)		+= mxc_nand.o
 obj-$(CONFIG_MTD_NAND_SOCRATES)		+= socrates_nand.o
 obj-$(CONFIG_MTD_NAND_TXX9NDFMC)	+= txx9ndfmc.o
+obj-$(CONFIG_MTD_NAND_NOMADIK)		+= nomadik_nand.o
 
 nand-objs := nand_base.o nand_bbt.o
diff --git a/drivers/mtd/nand/nomadik_nand.c b/drivers/mtd/nand/nomadik_nand.c
new file mode 100644
index 0000000..1946f6c
--- /dev/null
+++ b/drivers/mtd/nand/nomadik_nand.c
@@ -0,0 +1,250 @@
+/*
+ *  drivers/mtd/nand/nomadik_nand.c
+ *
+ *  Overview:
+ *  	Driver for on-board NAND flash on Nomadik Platforms
+ *
+ * Copyright (C) 2007 STMicroelectronics Pvt. Ltd.
+ * Author: Sachin Verma <sachin.verma@st.com>
+ *
+ * Copyright (C) 2009 Alessandro Rubini
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/nand_ecc.h>
+#include <linux/platform_device.h>
+#include <linux/mtd/partitions.h>
+#include <linux/io.h>
+#include <mach/nand.h>
+#include <mach/fsmc.h>
+
+#include <mtd/mtd-abi.h>
+
+struct nomadik_nand_host {
+	struct mtd_info		mtd;
+	struct nand_chip	nand;
+	void __iomem *data_va;
+	void __iomem *cmd_va;
+	void __iomem *addr_va;
+	struct nand_bbt_descr *bbt_desc;
+};
+
+static struct nand_ecclayout nomadik_ecc_layout = {
+	.eccbytes = 3 * 4,
+	.eccpos = { /* each subpage has 16 bytes: pos 2,3,4 hosts ECC */
+		0x02, 0x03, 0x04,
+		0x12, 0x13, 0x14,
+		0x22, 0x23, 0x24,
+		0x32, 0x33, 0x34},
+	/* let's keep bytes 5,6,7 for us, just in case we change ECC algo */
+	.oobfree = { {0x08, 0x08}, {0x18, 0x08}, {0x28, 0x08}, {0x38, 0x08} },
+};
+
+static void nomadik_ecc_control(struct mtd_info *mtd, int mode)
+{
+	/* No need to enable hw ecc, it's on by default */
+}
+
+static void nomadik_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
+{
+	struct nand_chip *nand = mtd->priv;
+	struct nomadik_nand_host *host = nand->priv;
+
+	if (cmd == NAND_CMD_NONE)
+		return;
+
+	if (ctrl & NAND_CLE)
+		writeb(cmd, host->cmd_va);
+	else
+		writeb(cmd, host->addr_va);
+}
+
+static int nomadik_nand_probe(struct platform_device *pdev)
+{
+	struct nomadik_nand_platform_data *pdata = pdev->dev.platform_data;
+	struct nomadik_nand_host *host;
+	struct mtd_info *mtd;
+	struct nand_chip *nand;
+	struct resource *res;
+	int ret = 0;
+
+	/* Allocate memory for the device structure (and zero it) */
+	host = kzalloc(sizeof(struct nomadik_nand_host), GFP_KERNEL);
+	if (!host) {
+		dev_err(&pdev->dev, "Failed to allocate device structure.\n");
+		return -ENOMEM;
+	}
+
+	/* Call the client's init function, if any */
+	if (pdata->init)
+		ret = pdata->init();
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Init function failed\n");
+		goto err;
+	}
+
+	/* ioremap three regions */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_addr");
+	if (!res) {
+		ret = -EIO;
+		goto err_unmap;
+	}
+	host->addr_va = ioremap(res->start, res->end - res->start + 1);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
+	if (!res) {
+		ret = -EIO;
+		goto err_unmap;
+	}
+	host->data_va = ioremap(res->start, res->end - res->start + 1);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_cmd");
+	if (!res) {
+		ret = -EIO;
+		goto err_unmap;
+	}
+	host->cmd_va = ioremap(res->start, res->end - res->start + 1);
+
+	if (!host->addr_va || !host->data_va || !host->cmd_va) {
+		ret = -ENOMEM;
+		goto err_unmap;
+	}
+
+	/* Link all private pointers */
+	mtd = &host->mtd;
+	nand = &host->nand;
+	mtd->priv = nand;
+	nand->priv = host;
+
+	host->mtd.owner = THIS_MODULE;
+	nand->IO_ADDR_R = host->data_va;
+	nand->IO_ADDR_W = host->data_va;
+	nand->cmd_ctrl = nomadik_cmd_ctrl;
+
+	/*
+	 * This stanza declares ECC_HW but uses soft routines. It's because
+	 * HW claims to make the calculation but not the correction. However,
+	 * I haven't managed to get the desired data out of it until now.
+	 */
+	nand->ecc.mode = NAND_ECC_SOFT;
+	nand->ecc.layout = &nomadik_ecc_layout;
+	nand->ecc.hwctl = nomadik_ecc_control;
+	nand->ecc.size = 512;
+	nand->ecc.bytes = 3;
+
+	nand->options = pdata->options;
+
+	/*
+	 * Scan to find existance of the device
+	 */
+	if (nand_scan(&host->mtd, 1)) {
+		ret = -ENXIO;
+		goto err_unmap;
+	}
+
+#ifdef CONFIG_MTD_PARTITIONS
+	add_mtd_partitions(&host->mtd, pdata->parts, pdata->nparts);
+#else
+	pr_info("Registering %s as whole device\n", mtd->name);
+	add_mtd_device(mtd);
+#endif
+
+	platform_set_drvdata(pdev, host);
+	return 0;
+
+ err_unmap:
+	if (host->cmd_va)
+		iounmap(host->cmd_va);
+	if (host->data_va)
+		iounmap(host->data_va);
+	if (host->addr_va)
+		iounmap(host->addr_va);
+ err:
+	kfree(host);
+	return ret;
+}
+
+/*
+ * Clean up routine
+ */
+static int nomadik_nand_remove(struct platform_device *pdev)
+{
+	struct nomadik_nand_host *host = platform_get_drvdata(pdev);
+	struct nomadik_nand_platform_data *pdata = pdev->dev.platform_data;
+
+	if (pdata->exit)
+		pdata->exit();
+
+	if (host) {
+		iounmap(host->cmd_va);
+		iounmap(host->data_va);
+		iounmap(host->addr_va);
+		kfree(host);
+	}
+	return 0;
+}
+
+static int nomadik_nand_suspend(struct device *dev)
+{
+	struct nomadik_nand_host *host = dev_get_drvdata(dev);
+	int ret = 0;
+	if (host)
+		ret = host->mtd.suspend(&host->mtd);
+	return ret;
+}
+
+static int nomadik_nand_resume(struct device *dev)
+{
+	struct nomadik_nand_host *host = dev_get_drvdata(dev);
+	if (host)
+		host->mtd.resume(&host->mtd);
+	return 0;
+}
+
+static struct dev_pm_ops nomadik_nand_pm_ops = {
+	.suspend = nomadik_nand_suspend,
+	.resume = nomadik_nand_resume,
+};
+
+static struct platform_driver nomadik_nand_driver = {
+	.probe = nomadik_nand_probe,
+	.remove = nomadik_nand_remove,
+	.driver = {
+		.owner = THIS_MODULE,
+		.name = "nomadik_nand",
+		.pm = &nomadik_nand_pm_ops,
+	},
+};
+
+static int __init nand_nomadik_init(void)
+{
+	pr_info("Nomadik NAND driver\n");
+	return platform_driver_register(&nomadik_nand_driver);
+}
+
+static void __exit nand_nomadik_exit(void)
+{
+	platform_driver_unregister(&nomadik_nand_driver);
+}
+
+module_init(nand_nomadik_init);
+module_exit(nand_nomadik_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("ST Microelectronics (sachin.verma@st.com)");
+MODULE_DESCRIPTION("NAND driver for Nomadik Platform");
-- 
1.6.0.2
