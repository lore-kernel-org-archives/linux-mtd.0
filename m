Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6tot-0006zP-4T
	for linux-mtd@lists.infradead.org; Thu, 12 Jun 2008 20:54:56 +0000
Date: Thu, 12 Jun 2008 21:54:53 +0100
From: Alexander Clouter <alex@digriz.org.uk>
To: linux-mtd@lists.infradead.org
Subject: generic NAND driver for TS-72[56]0 and TS-7800
Message-ID: <20080612205453.GC12892@inskipp.digriz.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Really just a request for comments on an alternative driver I have put 
together that works on the TS-72[56]0 (currently covered by the ts7250.c 
driver) and the TS-7800 that I submitted to the ARM mailing list the other 
week[1].

The NAND on the TS boards is more or less identical except for:
 * the partitioning layout
 * the io memory port addresses
 * the TS-7800 supports DMA and HW ECC

So to tackle this I did the following:
 1. moved the paritioning handling to become a runtime decision and to come 
	from a function called lurking in the platform code
 2. IO addresses get passed in the platform_device struct
 3. [coming soon] to enable (if on a TS-78xx) the DMA HW ECC code; you can 
	see how I'm adding the hooks, it's just the code currently does not 
	work properly yet ;)

For those familiar with the ts7250.c code, you will notice my ts7xxx.c code 
is rather similar...unsurprisingly it's what I deried it from.

Comments, flames, and explanations on how to properly do all this MTD 
malarkey welcomed.  I already chatted to the ts7250.c author who no longer 
uses the board and he said I should just go right ahead and post my patch 
here.  I own and have obviously tested this on the TS-7800 and got some Joe 
Public's on the TS-7000 mailing list with TS-7[56]0's to test it too[2] for 
me.

Cheers

Alex

N.B. worth noting that the parition layout in the current ts7250.c driver is 
	wrong.  My patch sets it corrrectly to what it should be.

[1] http://marc.info/?l=linux-arm-kernel&m=121280018602505&w=2
[2] http://tech.groups.yahoo.com/group/ts-7000/message/11616?var=0&l=1

-- 
 _________________________________________
/ Walking on water wasn't built in a day. \
|                                         |
\ -- Jack Kerouac                         /
 -----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx.c
index 3a4bf90..2bbfbd4 100644
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -17,6 +17,8 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/mtd/physmap.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/ts7xxx.h>
 #include <linux/platform_device.h>
 #include <linux/m48t86.h>
 #include <asm/io.h>
@@ -131,6 +133,84 @@ static struct platform_device ts72xx_flash = {
 	.resource	= &ts72xx_flash_resource,
 };
 
+/*****************************************************************************
+ * NAND Flash
+ ****************************************************************************/
+static struct mtd_partition ts72xx_nand_parts32[] = {
+	{
+		.name		= "TS-BOOTROM",
+		.offset		= 0,
+		.size		= SZ_128K,
+		.mask_flags	= MTD_WRITEABLE,
+	}, {
+		.name		= "Linux",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= 29 * SZ_1M,
+	}, {
+		.name		= "RedBoot",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= MTDPART_SIZ_FULL,
+	}
+};
+
+static struct mtd_partition ts72xx_nand_parts128[] = {
+	{
+		.name		= "TS-BOOTROM",
+		.offset		= 0,
+		.size		= SZ_128K,
+		.mask_flags	= MTD_WRITEABLE,
+	}, {
+		.name		= "Linux",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= 125 * SZ_1M,
+	}, {
+		.name		= "RedBoot",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= MTDPART_SIZ_FULL,
+	}
+};
+
+static struct ts7xxx_nand_data ts72xx_nand_data = {
+	.partitions	= NULL,
+	.nr_partitions	= 0,
+
+	.ioports	= {
+		.ctrl	= (void *__iomem) TS72XX_NAND_CONTROL_VIRT_BASE,
+		.data	= (void *__iomem) TS72XX_NAND_DATA_VIRT_BASE,
+
+		.busy	= (void *__iomem) TS72XX_NAND_BUSY_VIRT_BASE,
+	},
+};
+
+static struct ts7xxx_nand_data *ts72xx_nand(unsigned int size)
+{
+	/*
+	 * The TS-72[56]0's come with either 32MiB or 128MiB of NAND
+	 */
+	if (size == 32 * SZ_1M) {
+		ts72xx_nand_data.partitions	= ts72xx_nand_parts32;
+		ts72xx_nand_data.nr_partitions
+					= ARRAY_SIZE(ts72xx_nand_parts32);
+	} else if (size == 128 * SZ_1M) {
+		ts72xx_nand_data.partitions	= ts72xx_nand_parts128;
+		ts72xx_nand_data.nr_partitions
+					= ARRAY_SIZE(ts72xx_nand_parts128);
+	}
+
+	return &ts72xx_nand_data;
+};
+
+static struct platform_device ts72xx_nand_flash = {
+	.name		= "ts7xxx_nand",
+	.id		= -1,
+	.dev		= {
+		.platform_data	= &ts72xx_nand,
+	},
+	.num_resources	= 0,
+};
+
+/****************************************************************************/
+
 static unsigned char ts72xx_rtc_readbyte(unsigned long addr)
 {
 	__raw_writeb(addr, TS72XX_RTC_INDEX_VIRT_BASE);
@@ -188,6 +268,8 @@ static void __init ts72xx_init_machine(void)
 	ep93xx_init_devices();
 	if (board_is_ts7200())
 		platform_device_register(&ts72xx_flash);
+	if (!board_is_ts7200())
+		platform_device_register(&ts72xx_nand_flash);
 	platform_device_register(&ts72xx_rtc_device);
 
 	memcpy(ts72xx_eth_data.dev_addr,
diff --git a/arch/arm/mach-orion5x/ts78xx-setup.c b/arch/arm/mach-orion5x/ts78xx-setup.c
index bbf87a4..071ecae 100644
--- a/arch/arm/mach-orion5x/ts78xx-setup.c
+++ b/arch/arm/mach-orion5x/ts78xx-setup.c
@@ -12,6 +12,8 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/physmap.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/ts7xxx.h>
 #include <linux/mv643xx_eth.h>
 #include <linux/ata_platform.h>
 #include <linux/m48t86.h>
@@ -37,6 +39,10 @@
 #define TS78XX_FPGA_REGS_SYSCON_LCDI	(TS78XX_FPGA_REGS_VIRT_BASE | 0x004)
 #define TS78XX_FPGA_REGS_SYSCON_LCDO	(TS78XX_FPGA_REGS_VIRT_BASE | 0x008)
 
+#define TS78XX_FPGA_REGS_DMA		(TS78XX_FPGA_REGS_VIRT_BASE | 0x400)
+
+#define TS78XX_FPGA_REGS_NAND_CTRL	(TS78XX_FPGA_REGS_VIRT_BASE | 0x800)
+#define TS78XX_FPGA_REGS_NAND_DATA	(TS78XX_FPGA_REGS_VIRT_BASE | 0x804)
 #define TS78XX_FPGA_REGS_RTC_CTRL	(TS78XX_FPGA_REGS_VIRT_BASE | 0x808)
 #define TS78XX_FPGA_REGS_RTC_DATA	(TS78XX_FPGA_REGS_VIRT_BASE | 0x80c)
 
@@ -100,6 +106,68 @@ static struct platform_device ts78xx_nor_boot_flash = {
 };
 
 /*****************************************************************************
+ * NAND Flash
+ ****************************************************************************/
+static struct mtd_partition ts78xx_nand_parts512[] = {
+	{
+		.name		= "mbr",
+		.offset		= 0,
+		.size		= SZ_128K,
+		.mask_flags	= MTD_WRITEABLE,
+	}, {
+		.name		= "kernel",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= SZ_4M,
+	}, {
+		.name		= "initrd",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= SZ_4M,
+	}, {
+		.name		= "rootfs",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= MTDPART_SIZ_FULL,
+	}
+};
+
+static struct ts7xxx_nand_data ts78xx_nand_data = {
+	.partitions	= NULL,
+	.nr_partitions	= 0,
+
+	.ioports	= {
+		.ctrl	= (void *__iomem) TS78XX_FPGA_REGS_NAND_CTRL,
+		.data	= (void *__iomem) TS78XX_FPGA_REGS_NAND_DATA,
+
+		.busy	= (void *__iomem) TS78XX_FPGA_REGS_NAND_CTRL,
+
+		.dma	= (void *__iomem) TS78XX_FPGA_REGS_DMA,
+		.hcdr	= (void *__iomem) ORION5X_BRIDGE_REG(0x400),
+	},
+};
+
+static struct ts7xxx_nand_data *ts78xx_nand(unsigned int size)
+{
+	/*
+	 * currently only the TS-7800 is out there with a 512MiB NAND
+	 */
+	if (size == 512 * SZ_1M) {
+		ts78xx_nand_data.partitions	= ts78xx_nand_parts512;
+		ts78xx_nand_data.nr_partitions
+					= ARRAY_SIZE(ts78xx_nand_parts512);
+	}
+
+	return &ts78xx_nand_data;
+};
+
+static struct platform_device ts78xx_nand_flash = {
+	.name		= "ts7xxx_nand",
+	.id		= -1,
+	.dev		= {
+		.platform_data	= &ts78xx_nand,
+	},
+	.num_resources	= 0,
+};
+
+/*****************************************************************************
  * Ethernet
  ****************************************************************************/
 static struct mv643xx_eth_platform_data ts78xx_eth_data = {
@@ -256,6 +324,10 @@ static void __init ts78xx_init(void)
 				   TS78XX_NOR_BOOT_SIZE);
 	platform_device_register(&ts78xx_nor_boot_flash);
 
+#ifdef CONFIG_MTD_NAND_TS7XXX
+	platform_device_register(&ts78xx_nand_flash);
+#endif
+
 	if (!ts78xx_rtc_init())
 		printk(KERN_INFO "TS-78xx RTC not detected or enabled\n");
 }
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5076faf..9079051 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -81,6 +81,12 @@ config MTD_NAND_TS7250
 	help
 	  Support for NAND flash on Technologic Systems TS-7250 platform.
 
+config MTD_NAND_TS7XXX
+	tristate "NAND Flash device on TS-7xxx boards"
+	depends on MACH_TS72XX || MACH_TS78XX
+	help
+	  Support for NAND flash on Technologic Systems TS-7xxx platforms.
+
 config MTD_NAND_IDS
 	tristate
 
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index a6e74a4..a565a12 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_MTD_NAND_H1900)		+= h1910.o
 obj-$(CONFIG_MTD_NAND_RTC_FROM4)	+= rtc_from4.o
 obj-$(CONFIG_MTD_NAND_SHARPSL)		+= sharpsl.o
 obj-$(CONFIG_MTD_NAND_TS7250)		+= ts7250.o
+obj-$(CONFIG_MTD_NAND_TS7XXX)		+= ts7xxx.o
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
 obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
diff --git a/drivers/mtd/nand/ts7xxx.c b/drivers/mtd/nand/ts7xxx.c
new file mode 100644
index 0000000..0f3d0f3
--- /dev/null
+++ b/drivers/mtd/nand/ts7xxx.c
@@ -0,0 +1,268 @@
+/*
+ * drivers/mtd/nand/ts7xxx.c
+ *
+ * Copyright (C) 2008 Alexander Clouter (alex@digriz.org.uk)
+ *
+ * Derived from drivers/mtd/nand/ts7250.c
+ *   Copyright (C) 2004 Technologic Systems (support@embeddedARM.com)
+ *
+ * More information of course gleaned from Technologic Systems driver
+ * in their supplied kernel drivers/mtd/nand/ts7800.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Overview:
+ *   This is a device driver for the NAND flash device found on the TS-7xxx
+ *   board ranges.  DMA and HW ECC support is only available on the TS-78xx
+ */
+
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/ts7xxx.h>
+#include <linux/platform_device.h>
+#include <asm/io.h>
+#include <asm/arch/hardware.h>
+#include <asm/mach-types.h>
+#include <asm/cacheflush.h>
+
+/*
+ * MTD structure for TS7xxx board
+ */
+static struct mtd_info *ts7xxx_mtd;
+
+static struct ts7xxx_nand_data *ts7xxx_nand_data;
+
+/*
+ * hardware specific access to control-lines
+ *
+ * ctrl:
+ * NAND_NCE: bit 0 -> bit 2
+ * NAND_CLE: bit 1 -> bit 1
+ * NAND_ALE: bit 2 -> bit 0
+ */
+static void ts7xxx_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
+{
+	struct nand_chip *this = mtd->priv;
+
+	if (ctrl & NAND_CTRL_CHANGE) {
+		unsigned char bits;
+
+		bits = (ctrl & NAND_NCE) << 2;
+		bits |= ctrl & NAND_CLE;
+		bits |= (ctrl & NAND_ALE) >> 2;
+
+		writeb((readb(ts7xxx_nand_data->ioports.ctrl) & ~0x7) | bits,
+					ts7xxx_nand_data->ioports.ctrl);
+	}
+
+	if (cmd != NAND_CMD_NONE)
+		writeb(cmd, this->IO_ADDR_W);
+}
+
+static int ts7xxx_device_ready(struct mtd_info *mtd)
+{
+	return readb(ts7xxx_nand_data->ioports.busy) & 0x20;
+}
+
+static void ts7xxx_enable_hwecc(struct mtd_info *mtd, int mode)
+{
+	unsigned int dummy;
+
+	/* we loop as the FIFO might need emptying */
+	dummy = readl(ts7xxx_nand_data->ioports.ctrl);
+	while ((dummy & 0x18) != 0x18) {
+		writel(dummy | 0x8, ts7xxx_nand_data->ioports.ctrl);
+		dummy = readl(ts7xxx_nand_data->ioports.ctrl);
+	}
+}
+
+static int ts7xxx_calculate_ecc(struct mtd_info *mtd, const uint8_t *dat,
+				uint8_t *ecc_code)
+{
+	unsigned int ecc, i;
+
+	for (i = 0; i < 8; i++) {
+		ecc = (readl(ts7xxx_nand_data->ioports.ctrl) >> 8) & 0xffffff;
+
+		*ecc_code++ = (ecc >> 16) & 0xff;
+		*ecc_code++ = (ecc >>  8) & 0xff;
+		*ecc_code++ = (ecc >>  0) & 0xff;
+	}
+
+	return 0;
+}
+
+static int ts7xx_correct_data(struct mtd_info *mtd, uint8_t *dat,
+				uint8_t *read_ecc, uint8_t *calc_ecc)
+{
+	int ret = 0;
+	unsigned int i;
+
+	for (i = 0; i < 8; i++) {
+		ret |= nand_correct_data(mtd, dat + (256 * i),
+						&read_ecc[i * 3],
+						&calc_ecc[i * 3]);
+	}
+
+	return ret;
+}
+
+/*
+ * Main initialization routine
+ */
+static int ts7xxx_nand_probe(struct platform_device *pdev)
+{
+	struct nand_chip *this;
+	struct ts7xxx_nand_data	*(*ts7xxx_nand_data_func)(unsigned int)
+						= pdev->dev.platform_data;
+#ifdef CONFIG_MTD_PARTITIONS
+	static const char *part_probes[] = { "cmdlinepart", NULL };
+	struct mtd_partition *mtd_parts = NULL;
+	int mtd_parts_nb = 0;
+	const char *part_type = NULL;
+#endif
+
+#ifdef CONFIG_MACH_TS72xx
+	if (!machine_is_ts72xx() || board_is_ts7200())
+		return -ENXIO;
+#endif
+#ifdef CONFIG_MACH_TS78XX
+	if (!machine_is_ts78xx())
+		return -ENXIO;
+#endif
+
+	/* Allocate memory for MTD device structure and private data */
+	ts7xxx_mtd = kmalloc(sizeof(struct mtd_info)
+					+ sizeof(struct nand_chip),
+				GFP_KERNEL);
+	if (!ts7xxx_mtd) {
+		printk(KERN_ERR "Unable to allocate TS7xxx NAND "
+				"MTD device structure.\n");
+		return -ENOMEM;
+	}
+
+	/* Get pointer to private data */
+	this = (struct nand_chip *)(&ts7xxx_mtd[1]);
+
+	/* Initialize structures */
+	memset(ts7xxx_mtd, 0, sizeof(struct mtd_info));
+	memset(this, 0, sizeof(struct nand_chip));
+
+	/* Link the private data with the MTD structure */
+	ts7xxx_mtd->priv = this;
+	ts7xxx_mtd->owner = THIS_MODULE;
+
+	/*
+	 * this is runtime as we do not know the size of the NAND, and thus
+	 * its partitioning scheme, until we scan it here
+	 *
+	 * N.B. we use a dummy size of zero to get the currently useful info
+	 */
+	ts7xxx_nand_data = (*ts7xxx_nand_data_func)(0);
+
+	/* insert callbacks */
+	this->IO_ADDR_R = this->IO_ADDR_W = ts7xxx_nand_data->ioports.data;
+	this->cmd_ctrl = ts7xxx_hwcontrol;
+	this->dev_ready = ts7xxx_device_ready;
+	this->chip_delay = 15;
+
+	do {
+		/* if (machine_is_ts78xx()) {
+			this->ecc.mode = NAND_ECC_HW;
+			/* the HW ECC has an eight entry FIFO */
+			this->ecc.size = 8 * 256;
+			this->ecc.bytes = 8 * 3;
+			this->ecc.hwctl  = ts7xxx_enable_hwecc;
+			this->ecc.calculate = ts7xxx_calculate_ecc;
+			this->ecc.correct  = ts7xx_correct_data;
+			break;
+		} */
+
+		this->ecc.mode = NAND_ECC_SOFT;
+	} while (0);
+
+	printk(KERN_NOTICE "Searching for NAND flash...\n");
+	/* Scan to find existence of the device */
+	if (nand_scan(ts7xxx_mtd, 1)) {
+		kfree(ts7xxx_mtd);
+		return -ENODEV;
+	}
+
+#ifdef CONFIG_MTD_PARTITIONS
+	ts7xxx_mtd->name = "ts7xxx-nand";
+	mtd_parts_nb = parse_mtd_partitions(ts7xxx_mtd,
+						part_probes, &mtd_parts, 0);
+	if (mtd_parts_nb > 0)
+		part_type = "command line";
+	else
+		mtd_parts_nb = 0;
+
+	if (mtd_parts_nb == 0) {
+		/*
+		 * ...and now we can use size to find the partitioning scheme
+		 */
+		ts7xxx_nand_data = (*ts7xxx_nand_data_func)(ts7xxx_mtd->size);
+
+		if (ts7xxx_nand_data->partitions == NULL) {
+			printk(KERN_ERR
+				"ts7xxx_nand: unsupported NAND size, received "
+				"no paritioning scheme from platform\n");
+			/* FIXME: is this the most suitable return value? */
+			return -ENXIO;
+		}
+
+		mtd_parts = ts7xxx_nand_data->partitions;
+		mtd_parts_nb = ts7xxx_nand_data->nr_partitions;
+		part_type = "static";
+	}
+
+	/* Register the partitions */
+	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
+	add_mtd_partitions(ts7xxx_mtd, mtd_parts, mtd_parts_nb);
+#endif
+
+	/* Return happy */
+	return 0;
+}
+
+static int ts7xxx_nand_remove(struct platform_device *pdev)
+{
+	kfree(ts7xxx_mtd);
+	return 0;
+}
+
+/* driver device registration */
+
+static struct platform_driver ts7xxx_nand_driver = {
+	.probe		= ts7xxx_nand_probe,
+	.remove		= ts7xxx_nand_remove,
+	.driver		= {
+		.name	= "ts7xxx_nand",
+		.owner	= THIS_MODULE,
+	},
+};
+
+static int __init ts7xxx_nand_init(void)
+{
+	return platform_driver_register(&ts7xxx_nand_driver);
+}
+
+static void __exit ts7xxx_nand_exit(void)
+{
+	platform_driver_unregister(&ts7xxx_nand_driver);
+}
+
+module_init(ts7xxx_nand_init);
+module_exit(ts7xxx_nand_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alexander Clouter <alex@digriz.org.uk>");
+MODULE_DESCRIPTION("MTD NAND driver for Technologic Systems TS-7xxx boards");
+
diff --git a/include/linux/mtd/ts7xxx.h b/include/linux/mtd/ts7xxx.h
new file mode 100644
index 0000000..d79aeb7
--- /dev/null
+++ b/include/linux/mtd/ts7xxx.h
@@ -0,0 +1,36 @@
+/*
+ * linux/include/linux/mtd/ts7xxx.h
+ *
+ * Copyright (c) 2008 Alexander Clouter <alex@digriz.org.uk>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/mtd/partitions.h>
+
+/*
+ * io ports listing
+ */
+struct ts7xxx_ioports {
+	void __iomem	*ctrl;
+	void __iomem	*data;
+
+	void __iomem	*busy;
+
+	void __iomem	*dma;
+	void __iomem	*hcdr;
+};
+
+/*
+ * struct ts7xxx_nand_data - chip level device structure
+ * @nr_partitions:	number of partitions pointed to by partitions (or zero)
+ * @partitions:		mtd partition list
+ */
+struct ts7xxx_nand_data {
+	int			nr_partitions;
+	struct mtd_partition	*partitions;
+
+	struct ts7xxx_ioports	ioports;
+};
