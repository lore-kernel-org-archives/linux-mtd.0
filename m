Received: from dns.chez-thomas.org ([63.225.98.241]
	helo=hermes.chez-thomas.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BTioD-0004ol-I5
	for linux-mtd@lists.infradead.org; Fri, 28 May 2004 10:58:13 -0400
From: Gary Thomas <gary@mlbassoc.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: multipart/mixed; boundary="=-T0oPBw/jdKSgtaLUH+D5"
Message-Id: <1085756283.26522.8.camel@hermes>
Mime-Version: 1.0
Date: Fri, 28 May 2004 08:58:03 -0600
Cc: linux-mtd@lists.infradead.org
Subject: MTD updates
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-T0oPBw/jdKSgtaLUH+D5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

David,

Just a final check - here's what I propose to check in.  Note: I hope to
have these changes pushed into the Linux/PPC trees someday soon (I'm
working in it...)

-- 
Gary Thomas <gary@mlbassoc.com>
MLB Associates

--=-T0oPBw/jdKSgtaLUH+D5
Content-Disposition: attachment; filename=diffs
Content-Type: text/plain; name=diffs; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

? fs/jffs2/ecos/jffs2-200302041443.epk
? fs/jffs2/ecos/jffs2-200311190423.epk
? fs/jffs2/ecos/jffs2-200312111628.epk
? fs/jffs2/ecos/jffs2-200402170804.epk
? fs/jffs2/ecos/jffs2-200403090905.epk
? fs/jffs2/ecos/jffs2-200403310527.epk
? fs/jffs2/ecos/jffs2-200403312046.epk
? fs/jffs2/ecos/jffs2-200404211238.epk
Index: drivers/mtd/maps/Config.in
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/Config.in,v
retrieving revision 1.67
diff -u -5 -p -r1.67 Config.in
--- drivers/mtd/maps/Config.in	12 Apr 2004 06:38:39 -0000	1.67
+++ drivers/mtd/maps/Config.in	28 May 2004 14:54:32 -0000
@@ -33,10 +33,11 @@ if [ "$CONFIG_X86" = "y" ]; then
    dep_tristate '  CFI Flash device mapped on SnapGear/SecureEdge' CONFIG_MTD_NETtel $CONFIG_MTD_PARTITIONS
    dep_tristate '  BIOS flash chip on Intel SCB2 boards' CONFIG_MTD_SCB2_FLASH $CONFIG_MTD_GEN_PROBE
 fi
 
 if [ "$CONFIG_PPC32" = "y" ]; then
+  dep_tristate '  CFI Flash device mapping exported by RedBoot' CONFIG_MTD_CFI_REDBOOT $CONFIG_MTD_CFI
   if [ "$CONFIG_6xx" = "y" -a "$CONFIG_8260" = "y" ]; then
     dep_tristate '  Flash device on SBC8240' CONFIG_MTD_SBC8240 $CONFIG_MTD_JEDECPROBE
   fi
   if [ "$CONFIG_8xx" = "y" ]; then
     if [ "$CONFIG_TQM8xxL" = "y" ]; then
Index: drivers/mtd/maps/Makefile.common
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/Makefile.common,v
retrieving revision 1.11
diff -u -5 -p -r1.11 Makefile.common
--- drivers/mtd/maps/Makefile.common	13 May 2004 22:21:26 -0000	1.11
+++ drivers/mtd/maps/Makefile.common	28 May 2004 14:54:32 -0000
@@ -66,7 +66,8 @@ obj-$(CONFIG_MTD_ARCTIC)	+= arctic-mtd.o
 obj-$(CONFIG_MTD_H720X)		+= h720x-flash.o
 obj-$(CONFIG_MTD_SBC8240)	+= sbc8240.o
 obj-$(CONFIG_MTD_NOR_TOTO)	+= omap-toto-flash.o
 obj-$(CONFIG_MTD_MPC1211)	+= mpc1211.o
 obj-$(CONFIG_MTD_IXP4XX)	+= ixp4xx.o
+obj-$(CONFIG_MTD_CFI_REDBOOT)	+= redboot-mtd.o
 
 -include $(TOPDIR)/Rules.make
Index: drivers/mtd/maps/redboot-mtd.c
===================================================================
RCS file: drivers/mtd/maps/redboot-mtd.c
diff -N drivers/mtd/maps/redboot-mtd.c
--- /dev/null	1 Jan 1970 00:00:00 -0000
+++ drivers/mtd/maps/redboot-mtd.c	28 May 2004 14:54:32 -0000
@@ -0,0 +1,103 @@
+/*
+ * $Id: redboot-mtd.c,v 1.1.6.1 2004/05/28 12:19:31 gthomas Exp $
+ *
+ * Handle mapping of the flash on various Motorola PPC platforms
+ * Patterned after "rpxlite.c"
+ *
+ * Copyright (c) 2003, 2004 Gary Thomas <gary@mlbassoc.com>
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <asm/io.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+
+#if 0
+#define dprintk(p) printk p
+#else
+#define dprintk(p)
+#endif
+
+extern int parse_cmdline_partitions(struct mtd_info *master, 
+				    struct mtd_partition **pparts,
+				    const char *mtd_id);
+
+static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
+
+static struct mtd_partition *mtd_parts;
+static struct mtd_info *mymtd;
+#define PROBETYPES { "cfi_probe", 0 }
+#define MTDID      "RedBoot-nor"    /* for mtdparts= partitioning */
+
+struct map_info redboot_mtd_map = {
+    .name = "PowerPC/RedBoot 8xx/8xxx boards",
+};
+
+int __init init_redboot_mtd(void)
+{
+    struct mtd_partition *parts;
+    int nb_parts = 0;
+    int parsed_nr_parts = 0;
+    char *part_type;
+    bd_t *bp = (bd_t *)__res;
+
+    redboot_mtd_map.phys = bp->bi_flashbase;
+    redboot_mtd_map.size = bp->bi_flashsize;
+    redboot_mtd_map.buswidth = bp->bi_flashwidth/8;
+    redboot_mtd_map.virt = (unsigned long)ioremap(bp->bi_flashbase, bp->bi_flashsize);
+    if (!redboot_mtd_map.virt) {
+        printk("%s: can't ioremap FLASH\n", __FUNCTION__);
+        return -EIO;
+    }
+    printk("PowerPC/RedBoot 8xx/8xxx flash device: 0x%x bytes at 0x%x (%d bits wide)\n", 
+           bp->bi_flashsize, bp->bi_flashbase, bp->bi_flashwidth);
+
+    simple_map_init(&redboot_mtd_map);
+
+    mymtd = do_map_probe("cfi_probe", &redboot_mtd_map);
+    if (mymtd) {
+        mymtd->owner = THIS_MODULE;
+#ifdef CONFIG_MTD_REDBOOT_PARTS
+        parsed_nr_parts = parse_mtd_partitions(mymtd, probes, &mtd_parts, 0);
+        if (parsed_nr_parts > 0)
+            part_type = "detected";
+#endif
+	if (parsed_nr_parts > 0) {
+            parts = mtd_parts;
+            nb_parts = parsed_nr_parts;
+	}
+	if (nb_parts == 0) {
+            printk("PowerPC/RedBoot 8xx/8xxx flash: no partition info available, registering whole flash at once\n");
+            add_mtd_device(mymtd);
+	} else {
+            add_mtd_partitions(mymtd, parts, nb_parts);
+	}
+        return 0;
+    }
+
+    iounmap((void *)redboot_mtd_map.map_priv_1);
+    return -ENXIO;
+}
+
+static void __exit cleanup_redboot_mtd(void)
+{
+    if (mymtd) {
+        del_mtd_device(mymtd);
+        map_destroy(mymtd);
+    }
+    if (redboot_mtd_map.map_priv_1) {
+        iounmap((void *)redboot_mtd_map.map_priv_1);
+        redboot_mtd_map.map_priv_1 = 0;
+    }
+}
+
+module_init(init_redboot_mtd);
+module_exit(cleanup_redboot_mtd);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gary Thomas <gary@mlbassoc.com>");
+MODULE_DESCRIPTION("MTD map driver for PowerPC 8xx/8xxx boards running RedBoot");
Index: drivers/mtd/nand/Config.in
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/Config.in,v
retrieving revision 1.17
diff -u -5 -p -r1.17 Config.in
--- drivers/mtd/nand/Config.in	10 May 2004 07:28:18 -0000	1.17
+++ drivers/mtd/nand/Config.in	28 May 2004 14:54:32 -0000
@@ -39,6 +39,11 @@ if [ "$CONFIG_PPCHAMELEONEVB" = "y" ]; t
 fi
 
 if [ "$CONFIG_SOC_AU1550" = "y" ]; then
    dep_tristate '  NAND Flash Driver for Au1550 controller' CONFIG_MTD_NAND_AU1550 $CONFIG_MTD_NAND 
 fi
+
+if [ "$CONFIG_TAMS_MOAB" = "y" ]; then
+   dep_tristate '  NAND Flash device on TAMS MOAB board' CONFIG_MTD_NAND_TAMS_MOAB $CONFIG_MTD_NAND
+fi
+
 endmenu
Index: drivers/mtd/nand/Makefile.common
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/Makefile.common,v
retrieving revision 1.7
diff -u -5 -p -r1.7 Makefile.common
--- drivers/mtd/nand/Makefile.common	26 May 2004 13:35:52 -0000	1.7
+++ drivers/mtd/nand/Makefile.common	28 May 2004 14:54:33 -0000
@@ -17,10 +17,11 @@ obj-$(CONFIG_MTD_NAND_EDB7312)  += edb73
 obj-$(CONFIG_MTD_NAND_TX4925NDFMC)  += tx4925ndfmc.o
 obj-$(CONFIG_MTD_NAND_TX4938NDFMC)  += tx4938ndfmc.o
 obj-$(CONFIG_MTD_NAND_AU1550)	  += au1550nd.o
 obj-$(CONFIG_MTD_NAND_IDS)	+= nand_ids.o
 obj-$(CONFIG_MTD_NAND_PPCHAMELEONEVB)   += ppchameleonevb.o
+obj-$(CONFIG_MTD_NAND_TAMS_MOAB)	+= tams_moab.o
 
 nand-objs = nand_base.o nand_bbt.o
 
 -include $(TOPDIR)/Rules.make
 
Index: drivers/mtd/nand/tams_moab.c
===================================================================
RCS file: drivers/mtd/nand/tams_moab.c
diff -N drivers/mtd/nand/tams_moab.c
--- /dev/null	1 Jan 1970 00:00:00 -0000
+++ drivers/mtd/nand/tams_moab.c	28 May 2004 14:54:33 -0000
@@ -0,0 +1,214 @@
+/*
+ *  drivers/mtd/nand/tams_moab.c
+ *    Coyright (C) Gary Thomas (linux@mlbassoc.com)
+ *
+ *  Derived from drivers/mtd/nand/edb7312.c & autcu12.c
+ *       Copyright (C) 2002 Marius Gröger (mag@sysgo.de)
+ *       Copyright (c) 2001 Thomas Gleixner (gleixner@autronix.de)
+ *
+ * $Id: tams_moab.c,v 1.1.2.3 2004/05/28 12:14:57 gthomas Exp $
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *  Overview:
+ *   This is a device driver for the NAND flash device found on the
+ *   TAMS MOAB board which utilizes the Toshiba TC58V256AFT part. This 
+ *   is a 256Mibit (32MiB x 8 bits) NAND flash device.
+ */
+
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <platforms/ibm405gpr.h>
+
+/*
+ * MTD structure for MOAB board
+ */
+static struct mtd_info *moab_mtd = NULL;
+
+/*
+ * Values specific to the MOAB board (PowerPC 405GPr)
+ */
+#define MOAB_NAND_PHYS_BASE 0xC0000000
+#define MOAB_NAND_CLE       0x00010000  // GPIO 15 - asserts CLE to NAND device
+#define MOAB_NAND_ALE       0x00020000  // GPIO 14 - asserts ALE to NAND device
+#define MOAB_NAND_CE        0x00004000  // GPIO 17 - asserts CE to NAND device (active low)
+#define MOAB_NAND_BSY       0x00000200  // GPIO 22 - NAND RDY
+
+/*
+ * Mapped access to device
+ */
+static int moab_dev_base;
+static gpio_t *moab_gpio_base;
+
+/*
+ * Module stuff
+ */
+
+#ifdef CONFIG_MTD_PARTITIONS
+/*
+ * Define static partitions for flash device
+ */
+static struct mtd_partition partition_info[] = {
+	{ name: "MOAB Nand Flash",
+		  offset: 0,
+		  size: 128*1024*1024 }
+};
+#define NUM_PARTITIONS 1
+
+extern int parse_cmdline_partitions(struct mtd_info *master, 
+				    struct mtd_partition **pparts,
+				    const char *mtd_id);
+
+static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
+
+#endif
+static u_char data_buf[512 + 16];
+static u_char oob_buf[16 * 32];
+
+
+/* 
+ *	hardware specific access to control-lines
+ */
+static void moab_hwcontrol(struct mtd_info *mtd, int cmd) 
+{
+    switch(cmd) {
+		
+    case NAND_CTL_SETCLE: 
+        moab_gpio_base->or |= MOAB_NAND_CLE;
+        break;
+    case NAND_CTL_CLRCLE: 
+        moab_gpio_base->or &= ~MOAB_NAND_CLE;
+        break;
+    case NAND_CTL_SETALE:
+        moab_gpio_base->or |= MOAB_NAND_ALE;
+        break;
+    case NAND_CTL_CLRALE:
+        moab_gpio_base->or &= ~MOAB_NAND_ALE;
+        break;
+    case NAND_CTL_SETNCE:
+        moab_gpio_base->or &= ~MOAB_NAND_CE;
+        break;
+    case NAND_CTL_CLRNCE:
+        moab_gpio_base->or |= MOAB_NAND_CE;
+        break;
+    }
+}
+
+/*
+ *	read device ready pin
+ */
+#include <linux/delay.h>
+static int moab_device_ready(struct mtd_info *mtd)
+{
+    udelay(1000);
+    return ((moab_gpio_base->ir & MOAB_NAND_BSY) != 0);
+}
+
+/*
+ * Main initialization routine
+ */
+static int __init moab_init (void)
+{
+	struct nand_chip *this;
+	const char *part_type = 0;
+	int mtd_parts_nb = 0;
+	struct mtd_partition *mtd_parts = 0;
+	int moab_fio_base;
+	
+	/* Allocate memory for MTD device structure and private data */
+        printk("%s.%d\n", __FUNCTION__, __LINE__);
+	moab_mtd = kmalloc(sizeof(struct mtd_info) + 
+			     sizeof(struct nand_chip),
+			     GFP_KERNEL);
+	if (!moab_mtd) {
+		printk("Unable to allocate MOAB NAND MTD device structure.\n");
+		return -ENOMEM;
+	}
+	
+	/* map physical adresses */
+        printk("%s.%d\n", __FUNCTION__, __LINE__);
+	moab_dev_base = (unsigned long)ioremap(MOAB_NAND_PHYS_BASE, 1024);
+        printk("NAND - %x at %x\n", MOAB_NAND_PHYS_BASE, moab_dev_base);
+	if(!moab_dev_base) {
+		printk("ioremap MOAB NAND flash failed\n");
+		kfree(moab_mtd);
+		return -EIO;
+	}
+        /* Why isn't the GPIO just mapped by the platform? */
+	moab_gpio_base = (gpio_t *)ioremap(GPIO0_BASE, 1024);
+	if(!moab_gpio_base) {
+		printk("ioremap MOAB GPIO failed\n");
+		iounmap((void *)moab_dev_base);
+		kfree(moab_mtd);
+		return -EIO;
+	}
+	
+	/* Get pointer to private data */
+	this = (struct nand_chip *) (&moab_mtd[1]);
+	
+	/* Initialize structures */
+	memset((char *) moab_mtd, 0, sizeof(struct mtd_info));
+	memset((char *) this, 0, sizeof(struct nand_chip));
+	
+	/* Link the private data with the MTD structure */
+	moab_mtd->priv = this;
+	
+	/* insert callbacks */
+	this->IO_ADDR_R = moab_dev_base;
+	this->IO_ADDR_W = moab_dev_base;
+	this->hwcontrol = moab_hwcontrol;
+	this->dev_ready = moab_device_ready;
+	/* 15 us command delay time */
+	this->chip_delay = 15;
+        this->eccmode = NAND_ECC_SOFT;
+        /* Set internal data buffer */
+        this->data_buf = data_buf;
+        this->oob_buf = oob_buf;
+
+	/* Scan to find existence of the device */
+	if (nand_scan (moab_mtd, 1)) {
+		iounmap((void *)moab_dev_base);
+		iounmap((void *)moab_gpio_base);
+		kfree (moab_mtd);
+		return -ENXIO;
+	}
+	
+        mtd_parts_nb = parse_mtd_partitions(moab_mtd, probes, &mtd_parts, 0);
+        if (mtd_parts_nb < 0)
+            return mtd_parts_nb;
+	
+	/* Register the partitions */
+	add_mtd_partitions(moab_mtd, mtd_parts, mtd_parts_nb);
+	
+	/* Return happy */
+	return 0;
+}
+module_init(moab_init);
+
+/*
+ * Clean up routine
+ */
+static void __exit moab_cleanup (void)
+{
+	struct nand_chip *this = (struct nand_chip *) &moab_mtd[1];
+	
+	/* Unregister the device */
+	del_mtd_device (moab_mtd);
+	
+	/* Free internal data buffer */
+	kfree (this->data_buf);
+	
+	/* Free the MTD device structure */
+	kfree (moab_mtd);
+}
+module_exit(moab_cleanup);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gary Thomas <linux@mlbassoc.com>");
+MODULE_DESCRIPTION("MTD map driver for TAMS MOAB board");

--=-T0oPBw/jdKSgtaLUH+D5--
