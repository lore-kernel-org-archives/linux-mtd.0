Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LhLie-0005nK-8n
	for linux-mtd@lists.infradead.org; Wed, 11 Mar 2009 10:31:32 +0000
Date: Wed, 11 Mar 2009 11:30:24 +0100
From: Alessandro Rubini <rubini-list@gnudd.com>
To: linux-arm-kernel@lists.arm.linux.org.uk
Subject: [PATCH/RFC] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090311103024.GA475@mail.gnudd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
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

The patch is based on the base Nomadik support I posted to linux-arm-kernel
last week. I cleaned up the code as much as possible, but a V2 patch
is definitely expected, based on some cleanup in base Nomadik support.

I didn't split the headers as those have been added for this patch alone,
and I know there are unrelated changes in nhk15_defconfig, but this
patch as-is applies cleanly over the previous ones.

Signed-off-by: Alessandro Rubini <rubini@unipv.it>
Acked-by: Andrea Gallo <andrea.gallo@stericsson.com>
---
 arch/arm/configs/nhk15_defconfig              |  115 ++++++++-
 arch/arm/mach-nomadik/board-8815nhk.c         |   98 +++++++-
 arch/arm/mach-nomadik/include/mach/fsmc.h     |   36 +++
 arch/arm/mach-nomadik/include/mach/hardware.h |    5 +-
 arch/arm/mach-nomadik/include/mach/nand.h     |   16 ++
 drivers/mtd/nand/Kconfig                      |    6 +
 drivers/mtd/nand/Makefile                     |    1 +
 drivers/mtd/nand/nomadik_nand.c               |  328 +++++++++++++++++++++++++
 8 files changed, 590 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm/mach-nomadik/include/mach/fsmc.h
 create mode 100644 arch/arm/mach-nomadik/include/mach/nand.h
 create mode 100644 drivers/mtd/nand/nomadik_nand.c

diff --git a/arch/arm/configs/nhk15_defconfig b/arch/arm/configs/nhk15_defconfig
index 00c7b8d..1ef9bf1 100644
--- a/arch/arm/configs/nhk15_defconfig
+++ b/arch/arm/configs/nhk15_defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.29-rc6
-# Wed Mar  4 13:29:20 2009
+# Tue Mar 10 11:19:10 2009
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -93,6 +93,7 @@ CONFIG_HAVE_OPROFILE=y
 # CONFIG_KPROBES is not set
 CONFIG_HAVE_KPROBES=y
 CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_CLK=y
 CONFIG_HAVE_GENERIC_DMA_COHERENT=y
 CONFIG_SLABINFO=y
 CONFIG_RT_MUTEXES=y
@@ -138,8 +139,8 @@ CONFIG_FREEZER=y
 # CONFIG_ARCH_NETX is not set
 # CONFIG_ARCH_H720X is not set
 # CONFIG_ARCH_IMX is not set
-# CONFIG_ARCH_IOP13XX is not set
 CONFIG_ARCH_NOMADIK=y
+# CONFIG_ARCH_IOP13XX is not set
 # CONFIG_ARCH_IOP32X is not set
 # CONFIG_ARCH_IOP33X is not set
 # CONFIG_ARCH_IXP23XX is not set
@@ -167,6 +168,12 @@ CONFIG_ARCH_NOMADIK=y
 # CONFIG_ARCH_W90X900 is not set
 
 #
+# Nomadik boards
+#
+CONFIG_MACH_NOMADIK_8815NHK=y
+CONFIG_NOMADIK_8815=y
+
+#
 # Processor Type
 #
 CONFIG_CPU_32=y
@@ -208,7 +215,8 @@ CONFIG_VMSPLIT_3G=y
 CONFIG_PAGE_OFFSET=0xC0000000
 CONFIG_PREEMPT=y
 CONFIG_HZ=100
-# CONFIG_AEABI is not set
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
 CONFIG_ARCH_FLATMEM_HAS_HOLES=y
 # CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
 # CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
@@ -260,7 +268,6 @@ CONFIG_BINFMT_ELF=y
 CONFIG_HAVE_AOUT=y
 # CONFIG_BINFMT_AOUT is not set
 # CONFIG_BINFMT_MISC is not set
-# CONFIG_ARTHUR is not set
 
 #
 # Power management options
@@ -399,7 +406,88 @@ CONFIG_EXTRA_FIRMWARE=""
 # CONFIG_DEBUG_DEVRES is not set
 # CONFIG_SYS_HYPERVISOR is not set
 # CONFIG_CONNECTOR is not set
-# CONFIG_MTD is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=y
+CONFIG_MTD_TESTS=m
+# CONFIG_MTD_REDBOOT_PARTS is not set
+# CONFIG_MTD_CMDLINE_PARTS is not set
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+# CONFIG_FTL is not set
+# CONFIG_NFTL is not set
+# CONFIG_INFTL is not set
+# CONFIG_RFD_FTL is not set
+# CONFIG_SSFDC is not set
+# CONFIG_MTD_OOPS is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+# CONFIG_MTD_CFI is not set
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
+# CONFIG_MTD_BLOCK2MTD is not set
+
+#
+# Disk-On-Chip Device Drivers
+#
+# CONFIG_MTD_DOC2000 is not set
+# CONFIG_MTD_DOC2001 is not set
+# CONFIG_MTD_DOC2001PLUS is not set
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_VERIFY_WRITE=y
+# CONFIG_MTD_NAND_ECC_SMC is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+CONFIG_MTD_NAND_NOMADIK=y
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+
+#
+# UBI - Unsorted block images
+#
+# CONFIG_MTD_UBI is not set
 # CONFIG_PARPORT is not set
 CONFIG_BLK_DEV=y
 # CONFIG_BLK_DEV_COW_COMMON is not set
@@ -619,6 +707,8 @@ CONFIG_SSB_POSSIBLE=y
 # CONFIG_MFD_SM501 is not set
 # CONFIG_HTC_PASIC3 is not set
 # CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
 
 #
 # Multimedia devices
@@ -797,6 +887,17 @@ CONFIG_MISC_FILESYSTEMS=y
 # CONFIG_BEFS_FS is not set
 # CONFIG_BFS_FS is not set
 # CONFIG_EFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+# CONFIG_JFFS2_SUMMARY is not set
+# CONFIG_JFFS2_FS_XATTR is not set
+# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
+CONFIG_JFFS2_ZLIB=y
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=y
+# CONFIG_JFFS2_RUBIN is not set
 # CONFIG_CRAMFS is not set
 # CONFIG_SQUASHFS is not set
 # CONFIG_VXFS_FS is not set
@@ -1063,8 +1164,8 @@ CONFIG_CRC_CCITT=m
 CONFIG_CRC32=y
 # CONFIG_CRC7 is not set
 # CONFIG_LIBCRC32C is not set
-CONFIG_ZLIB_INFLATE=m
-CONFIG_ZLIB_DEFLATE=m
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
 CONFIG_PLIST=y
 CONFIG_HAS_IOMEM=y
 CONFIG_HAS_IOPORT=y
diff --git a/arch/arm/mach-nomadik/board-8815nhk.c b/arch/arm/mach-nomadik/board-8815nhk.c
index 566bf29..992b8c9 100644
--- a/arch/arm/mach-nomadik/board-8815nhk.c
+++ b/arch/arm/mach-nomadik/board-8815nhk.c
@@ -12,27 +12,113 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
-#include <linux/list.h>
 #include <linux/platform_device.h>
-#include <linux/string.h>
 #include <linux/sysdev.h>
 #include <linux/amba/bus.h>
 #include <linux/spi/spi.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
 #include <asm/io.h>
-#include <asm/irq.h>
 #include <asm/setup.h>
 #include <asm/param.h>
+#include <asm/sizes.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/irq.h>
-#include <asm/mach/map.h>
-#include <asm/mach/time.h>
 
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
+	writel(0x0000000E, FSMC_PCR0);
+	writel(0x000D0A00, FSMC_PMEM0);
+	writel(0x00100A00, FSMC_PATT0);
+
+	/* enable access to the chip select area */
+	writel(readl(FSMC_PCR0) | 0x04, FSMC_PCR0);
+
+	return 0;
+}
+
+static struct mtd_partition nhk8815_partitions[] = {
+	{
+		.name	= "X-Loader(NAND)",
+		.offset = 0,
+		.size	= SZ_256K,
+	},{
+		.name	= "MemInit(NAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= SZ_256K,
+	},{
+		.name	= "BootLoader(NAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= SZ_2M,
+	},{
+		.name	= "Kernel zImage(NAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= 3 * SZ_1M,
+	},{
+		.name	= "Root Filesystem(NAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= 22* SZ_1M,
+	},{
+		/* This can't be SIZ_FULL as we have the u-boot env */
+		.name	= "User Filesystem(NAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= 100 * SZ_1M,
+	},{
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
 
 static struct platform_device *nhk8815_platform_devices[] __initdata = {
-	/* currently empty, will add keypad, touchscreen etc */
+	&nhk8815_nand_device,
+	/* will add keypad, touchscreen etc */
 };
 
 static void __init nhk8815_map_io(void)
diff --git a/arch/arm/mach-nomadik/include/mach/fsmc.h b/arch/arm/mach-nomadik/include/mach/fsmc.h
new file mode 100644
index 0000000..f81621c
--- /dev/null
+++ b/arch/arm/mach-nomadik/include/mach/fsmc.h
@@ -0,0 +1,36 @@
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
+/* control and timing registers for CS0..CS3 */
+#define FSMC_BCR0	((void __iomem *)(NOMADIK_FSMC_VA + 0x00))
+#define FSMC_BTR0	((void __iomem *)(NOMADIK_FSMC_VA + 0x04))
+#define FSMC_BCR1	((void __iomem *)(NOMADIK_FSMC_VA + 0x08))
+#define FSMC_BTR1	((void __iomem *)(NOMADIK_FSMC_VA + 0x0c))
+#define FSMC_BCR2	((void __iomem *)(NOMADIK_FSMC_VA + 0x10))
+#define FSMC_BTR2	((void __iomem *)(NOMADIK_FSMC_VA + 0x14))
+#define FSMC_BCR3	((void __iomem *)(NOMADIK_FSMC_VA + 0x18))
+#define FSMC_BTR3	((void __iomem *)(NOMADIK_FSMC_VA + 0x1c))
+
+/* pc-card and nand flash */
+#define FSMC_PCR0	((void __iomem *)(NOMADIK_FSMC_VA + 0x40))
+#define FSMC_PMEM0	((void __iomem *)(NOMADIK_FSMC_VA + 0x48))
+#define FSMC_PATT0	((void __iomem *)(NOMADIK_FSMC_VA + 0x4c))
+#define FSMC_PIO0	((void __iomem *)(NOMADIK_FSMC_VA + 0x50))
+#define FSMC_PECCR0	((void __iomem *)(NOMADIK_FSMC_VA + 0x54))
+
+#define FSMC_PCR1	((void __iomem *)(NOMADIK_FSMC_VA + 0x60))
+#define FSMC_PMEM1	((void __iomem *)(NOMADIK_FSMC_VA + 0x68))
+#define FSMC_PATT1	((void __iomem *)(NOMADIK_FSMC_VA + 0x6c))
+#define FSMC_PIO1	((void __iomem *)(NOMADIK_FSMC_VA + 0x70))
+#define FSMC_PECCR1	((void __iomem *)(NOMADIK_FSMC_VA + 0x74))
+
+
+#endif /* __ASM_ARCH_FSMC_H */
diff --git a/arch/arm/mach-nomadik/include/mach/hardware.h b/arch/arm/mach-nomadik/include/mach/hardware.h
index 2ce3679..f31439b 100644
--- a/arch/arm/mach-nomadik/include/mach/hardware.h
+++ b/arch/arm/mach-nomadik/include/mach/hardware.h
@@ -96,7 +96,8 @@
 #define DENC_MODE_PAL		0
 #define DENC_MODE_NTSC		1
 
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
index 8b12e6e..41b4fc7 100644
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
index b661586..06acb94 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -36,5 +36,6 @@ obj-$(CONFIG_MTD_NAND_FSL_ELBC)		+= fsl_elbc_nand.o
 obj-$(CONFIG_MTD_NAND_FSL_UPM)		+= fsl_upm.o
 obj-$(CONFIG_MTD_NAND_SH_FLCTL)		+= sh_flctl.o
 obj-$(CONFIG_MTD_NAND_MXC)		+= mxc_nand.o
+obj-$(CONFIG_MTD_NAND_NOMADIK)		+= nomadik_nand.o
 
 nand-objs := nand_base.o nand_bbt.o
diff --git a/drivers/mtd/nand/nomadik_nand.c b/drivers/mtd/nand/nomadik_nand.c
new file mode 100644
index 0000000..a08275c
--- /dev/null
+++ b/drivers/mtd/nand/nomadik_nand.c
@@ -0,0 +1,328 @@
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
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/platform_device.h>
+#include <linux/mtd/partitions.h>
+#include <asm/io.h>
+#include <asm/types.h>
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
+			    u_char * ecc)
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
+        .eccbytes = 3 * 4,
+        .eccpos = { /* each subpage has 16 bytes: pos 2,3,4 hosts ECC */
+                0x02, 0x03, 0x04,
+                0x12, 0x13, 0x14,
+                0x22, 0x23, 0x24,
+                0x32, 0x33, 0x34},
+        /* let's keep bytes 5,6,7 for us, just in case we change ECC algo */
+        .oobfree = { {0x08, 0x08}, {0x18, 0x08}, {0x28, 0x08}, {0x38, 0x08} },
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
+		writeb(cmd,host->cmd_va);
+	else
+		writeb(cmd,host->addr_va);
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
+	host = (void *)kzalloc(sizeof(struct nomadik_nand_host), GFP_KERNEL);
+	if (!host) {
+		dev_err(&pdev->dev, "Failed to allocate device structure.\n");
+		return -ENOMEM;
+	}
+
+	/* Call the client's init function, if any */
+	if(pdata->init && (ret = pdata->init()) < 0){
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
+	if (pdata->exit && pdata->exit())
+		printk("Unable to cleanup resources completely...\n");
+
+	if(host) {
+		iounmap(host->cmd_va);
+		iounmap(host->data_va);
+		iounmap(host->addr_va);
+		kfree(host);
+	}
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int nomadik_nand_suspend(struct platform_device *pdev, pm_message_t state)
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
