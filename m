Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LwX5f-0001dD-3r
	for linux-mtd@lists.infradead.org; Wed, 22 Apr 2009 07:42:02 +0000
Date: Wed, 22 Apr 2009 09:41:46 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: linux-arm-kernel@lists.arm.linux.org.uk
Subject: [PATCH 4/6] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <afa4979bd00ccb47ba28fcbbeec29f07a60c28e5.1240384958.git.rubini@gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
In-Reply-To: <cover.1240384958.git.rubini@gnudd.com>
References: <cover.1240384958.git.rubini@gnudd.com>
Cc: STEricsson_nomadik_linux@list.st.com, linux-mtd@lists.infradead.org,
	andrea.gallo@stericsson.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alessandro Rubini <rubini@unipv.it>

The patch is incremental over base Nomadik support
as posted to linux-arm-kernel.

Signed-off-by: Alessandro Rubini <rubini@unipv.it>
Acked-by: Andrea Gallo <andrea.gallo@stericsson.com>
---

This and one-nand are Cc: to the mtd list, the other patches
have been sent only to linux-arm-kernel.

 arch/arm/configs/nhk15_defconfig              |    1 +
 arch/arm/mach-nomadik/board-8815nhk.c         |   98 ++++++++-
 arch/arm/mach-nomadik/include/mach/fsmc.h     |   29 +++
 arch/arm/mach-nomadik/include/mach/hardware.h |    5 +-
 arch/arm/mach-nomadik/include/mach/nand.h     |   16 ++
 drivers/mtd/nand/Kconfig                      |    6 +
 drivers/mtd/nand/Makefile                     |    1 +
 drivers/mtd/nand/nomadik_nand.c               |  329 +++++++++++++++++++++++++
 8 files changed, 482 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/mach-nomadik/include/mach/fsmc.h
 create mode 100644 arch/arm/mach-nomadik/include/mach/nand.h
 create mode 100644 drivers/mtd/nand/nomadik_nand.c

diff --git a/arch/arm/configs/nhk15_defconfig b/arch/arm/configs/nhk15_defconfig
index cf11d79..1697efe 100644
--- a/arch/arm/configs/nhk15_defconfig
+++ b/arch/arm/configs/nhk15_defconfig
@@ -476,6 +476,7 @@ CONFIG_MTD_NAND_IDS=y
 # CONFIG_MTD_NAND_DISKONCHIP is not set
 # CONFIG_MTD_NAND_NANDSIM is not set
 # CONFIG_MTD_NAND_PLATFORM is not set
+CONFIG_MTD_NAND_NOMADIK=y
 # CONFIG_MTD_ONENAND is not set
 
 #
diff --git a/arch/arm/mach-nomadik/board-8815nhk.c b/arch/arm/mach-nomadik/board-8815nhk.c
index d6483bf..b7be6c2 100644
--- a/arch/arm/mach-nomadik/board-8815nhk.c
+++ b/arch/arm/mach-nomadik/board-8815nhk.c
@@ -19,12 +19,107 @@
 #include <linux/io.h>
 #include <linux/param.h>
 #include <asm/setup.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <asm/sizes.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/irq.h>
 
 #include <mach/hardware.h>
 #include <mach/setup.h>
+#include <mach/nand.h>
+#include <mach/fsmc.h>
+
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
+		/* This can't be SIZ_FULL as we have the u-boot env */
+		.name	= "User Filesystem(NAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= 100 * SZ_1M,
+	}, {
+		.name	= "U-Boot Environment",
+		.offset	= 0x8000000 - SZ_128K,
+		.size	= SZ_128K,
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
+				.platform_data = &nhk8815_nand_data,
+	},
+	.resource	= nhk8815_nand_resources,
+	.num_resources	= ARRAY_SIZE(nhk8815_nand_resources),
+};
+
 
 #define __MEM_4K_RESOURCE(x) \
 	.res = {.start = (x), .end = (x) + SZ_4K - 1, .flags = IORESOURCE_MEM}
@@ -63,7 +158,8 @@ static int __init nhk8815_init(void)
 arch_initcall(nhk8815_init);
 
 static struct platform_device *nhk8815_platform_devices[] __initdata = {
-	/* currently empty, will add keypad, touchscreen etc */
+	&nhk8815_nand_device,
+	/* will add keypad, touchscreen etc */
 };
 
 static void __init nhk8815_map_io(void)
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
diff --git a/arch/arm/mach-nomadik/include/mach/hardware.h b/arch/arm/mach-nomadik/include/mach/hardware.h
index 8cdee9b..05ea93b 100644
--- a/arch/arm/mach-nomadik/include/mach/hardware.h
+++ b/arch/arm/mach-nomadik/include/mach/hardware.h
@@ -82,7 +82,8 @@
 #define NOMADIK_HAMACA_DMEM	0xA0200000	/* HAMACA Data Memory Space */
 
 
-#define NOMADIK_MTU0_VA (IO_ADDRESS(NOMADIK_MTU0_BASE))
-#define NOMADIK_MTU1_VA (IO_ADDRESS(NOMADIK_MTU1_BASE))
+#define NOMADIK_FSMC_VA		IO_ADDRESS(NOMADIK_FSMC_BASE)
+#define NOMADIK_MTU0_VA		IO_ADDRESS(NOMADIK_MTU0_BASE)
+#define NOMADIK_MTU1_VA		IO_ADDRESS(NOMADIK_MTU1_BASE)
 
 #endif /* __ASM_ARCH_HARDWARE_H */
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
index 890936d..61d60fd 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -420,6 +420,12 @@ config MTD_NAND_MXC
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
index d33860a..404e9c6 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -39,5 +39,6 @@ obj-$(CONFIG_MTD_NAND_SH_FLCTL)		+= sh_flctl.o
 obj-$(CONFIG_MTD_NAND_MXC)		+= mxc_nand.o
 obj-$(CONFIG_MTD_NAND_SOCRATES)		+= socrates_nand.o
 obj-$(CONFIG_MTD_NAND_TXX9NDFMC)	+= txx9ndfmc.o
+obj-$(CONFIG_MTD_NAND_NOMADIK)		+= nomadik_nand.o
 
 nand-objs := nand_base.o nand_bbt.o
diff --git a/drivers/mtd/nand/nomadik_nand.c b/drivers/mtd/nand/nomadik_nand.c
new file mode 100644
index 0000000..bbd1925
--- /dev/null
+++ b/drivers/mtd/nand/nomadik_nand.c
@@ -0,0 +1,329 @@
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
+static inline int parity(int b) /* uses low 8 bits: returns 0 or all-1 */
+{
+	b = b ^ (b >> 4);
+	b = b ^ (b >> 2);
+	return (b ^ (b >> 1)) & 1
+		? ~0 : 0;
+}
+
+/*
+ * This is the ECC routine used in hardware, according to the manual.
+ * HW claims to make the calculation but not the correction. However,
+ * I haven't managed to get the desired data out of it; so do it in sw.
+ * There is problably some errata involved, but currently miss the info.
+ */
+static int nomadik_ecc512_calc(struct mtd_info *mtd, const u_char *data,
+			u_char *ecc)
+{
+	int gpar = 0;
+	int i, val, par;
+	int pbits = 0;		/* P8, P16, ... P2048 */
+	int pprime = 0;		/* P8', P16', ... P2048' */
+	int lowbits;		/* P1, P2, P4 and primes */
+
+	for (i = 0; i < 512; i++) {
+		par = parity((val = data[i]));
+		gpar ^= val;
+		pbits ^= (i & par);
+	}
+	/*
+	 * Ok, now gpar is global parity (xor of all bytes)
+	 * pbits are all the parity bits (non-prime ones)
+	 */
+	par = parity(gpar);
+	pprime = pbits ^ par;
+	/* Put low bits in the right position for ecc[2] (bits 7..2) */
+	lowbits = 0
+		| (parity(gpar & 0xf0) & 0x80)	/* P4  */
+		| (parity(gpar & 0x0f) & 0x40)	/* P4' */
+		| (parity(gpar & 0xcc) & 0x20)	/* P2  */
+		| (parity(gpar & 0x33) & 0x10)	/* P2' */
+		| (parity(gpar & 0xaa) & 0x08)	/* P1  */
+		| (parity(gpar & 0x55) & 0x04);	/* P1' */
+
+	ecc[2] = ~(lowbits | ((pbits & 0x100) >> 7) | ((pprime & 0x100) >> 8));
+	/* now intermix bits for ecc[1] (P1024..P128') and ecc[0] (P64..P8') */
+	ecc[1] = ~(    (pbits & 0x80) >> 0  | ((pprime & 0x80) >> 1)
+		    | ((pbits & 0x40) >> 1) | ((pprime & 0x40) >> 2)
+		    | ((pbits & 0x20) >> 2) | ((pprime & 0x20) >> 3)
+		    | ((pbits & 0x10) >> 3) | ((pprime & 0x10) >> 4));
+
+	ecc[0] = ~(    (pbits & 0x8) << 4  | ((pprime & 0x8) << 3)
+		    | ((pbits & 0x4) << 3) | ((pprime & 0x4) << 2)
+		    | ((pbits & 0x2) << 2) | ((pprime & 0x2) << 1)
+		    | ((pbits & 0x1) << 1) | ((pprime & 0x1) << 0));
+	return 0;
+}
+
+static int nomadik_ecc512_correct(struct mtd_info *mtd, uint8_t *dat,
+				uint8_t *r_ecc, uint8_t *c_ecc)
+{
+	struct nand_chip *chip = mtd->priv;
+	uint32_t r, c, d, diff; /*read, calculated, xor of them */
+
+	if (!memcmp(r_ecc, c_ecc, chip->ecc.bytes))
+		return 0;
+
+	/* Reorder the bytes into ascending-order 24 bits -- see manual */
+	r = r_ecc[2] << 22 | r_ecc[1] << 14 | r_ecc[0] << 6 | r_ecc[2] >> 2;
+	c = c_ecc[2] << 22 | c_ecc[1] << 14 | c_ecc[0] << 6 | c_ecc[2] >> 2;
+	diff = (r ^ c) & ((1 << 24) - 1); /* use 24 bits only */
+
+	/* If 12 bits are different, one per pair, it's correctable */
+	if (((diff | (diff>>1)) & 0x555555) == 0x555555) {
+		int bit = ((diff & 2) >> 1)
+			| ((diff & 0x8) >> 2) | ((diff & 0x20) >> 3);
+		int byte;
+
+		d = diff >> 6; /* remove bit-order info */
+		byte =  ((d & 2) >> 1)
+			| ((d & 0x8) >> 2) | ((d & 0x20) >> 3)
+			| ((d & 0x80) >> 4) | ((d & 0x200) >> 5)
+			| ((d & 0x800) >> 6) | ((d & 0x2000) >> 7)
+			| ((d & 0x8000) >> 8) | ((d & 0x20000) >> 9);
+		/* correct the single bit */
+		dat[byte] ^= 1 << bit;
+		return 0;
+	}
+	/* If 1 bit only differs, it's one bit error in ECC, ignore */
+	if ((diff ^ (1 << (ffs(diff) - 1))) == 0)
+		return 0;
+	/* Otherwise, uncorrectable */
+	return -1;
+}
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
+	if (pdata->init && (ret = pdata->init()) < 0) {
+		dev_err(&pdev->dev, "Init function failed\n");
+		goto err;
+	}
+
+	/* ioremap three regions */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_addr");
+	if (!res) {ret = -EIO; goto err_unmap; }
+	host->addr_va = ioremap(res->start, res->end - res->start + 1);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
+	if (!res) {ret = -EIO; goto err_unmap; }
+	host->data_va = ioremap(res->start, res->end - res->start + 1);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_cmd");
+	if (!res) {ret = -EIO; goto err_unmap; }
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
+	nand->ecc.mode = NAND_ECC_HW;
+	nand->ecc.layout = &nomadik_ecc_layout;
+	nand->ecc.calculate = nomadik_ecc512_calc;
+	nand->ecc.correct = nomadik_ecc512_correct;
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
+	if (host->cmd_va) iounmap(host->cmd_va);
+	if (host->data_va) iounmap(host->data_va);
+	if (host->addr_va) iounmap(host->addr_va);
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
+#ifdef CONFIG_PM
+static int nomadik_nand_suspend(struct platform_device *pdev,
+				pm_message_t state)
+{
+	struct nomadik_nand_host *host = platform_get_drvdata(pdev);
+	int ret = 0;
+	if (host)
+		ret = host->mtd.suspend(&host->mtd);
+	return ret;
+}
+
+static int nomadik_nand_resume(struct platform_device *pdev)
+{
+	struct nomadik_nand_host *host = platform_get_drvdata(pdev);
+	if (host)
+		host->mtd.resume(&host->mtd);
+	return 0;
+}
+
+#else
+#define nomadik_nand_suspend NULL
+#define nomadik_nand_resume NULL
+#endif /* CONFIG_PM */
+
+static struct platform_driver nomadik_nand_driver = {
+	.probe = nomadik_nand_probe,
+	.remove = nomadik_nand_remove,
+	.driver = {
+		   .owner = THIS_MODULE,
+		   .name = "nomadik_nand",
+		   },
+	.suspend = nomadik_nand_suspend,
+	.resume = nomadik_nand_resume,
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
