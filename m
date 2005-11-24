Received: from natblindhugh.rzone.de ([81.169.145.175])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfOKi-00016k-QN
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2005 16:08:48 -0500
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Date: Thu, 24 Nov 2005 21:44:59 +0100
References: <AHEILKONAKAEJPHNMOPNIELBCDAA.hs@denx.de>
	<200511231311.51467.sr@denx.de>
	<1132831796.32542.183.camel@tglx.tec.linutronix.de>
In-Reply-To: <1132831796.32542.183.camel@tglx.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_MZihDrWi83rFD40"
Message-Id: <200511242145.00013.sr@denx.de>
Cc: tglx@linutronix.de
Subject: Re: [PATCH] MTD: Add P3P440 MTD support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Boundary-00=_MZihDrWi83rFD40
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 24 November 2005 12:29, Thomas Gleixner wrote:
> On Wed, 2005-11-23 at 13:11 +0100, Stefan Roese wrote:
> > This patch adds MTD support (NOR FLASH) for the Prodrive P3P440
> > (440GP) PMC module.
> >
> > Signed-off-by: Stefan Roese <sr@denx.de>
> >
> > +config MTD_P3P440
> > +       tristate "Flash devices mapped on Prodrive P3P440"
> > +       depends on MTD_CFI && P3P440
> > +       help
> > +         This enables access routined for the flash chips on the
> > Prodrive
>
> routined ?

Fixed.

> > +         P3P440 board.  If you have this board and would like to use the
> > +         flash chips on it, say 'Y'.
> > +
> > +#define RW_PART0_OF    0
> > +#define RW_PART0_SZ    0x180000
> > +#define RW_PART1_OF    RW_PART0_OF + RW_PART0_SZ
> > +#define RW_PART1_SZ    0x280000
> > +#define RW_PART2_OF    RW_PART1_OF + RW_PART1_SZ
> > +/* Partition 2 will be autosized dynamically... */
> > +#define RW_PART3_SZ    0x40000
> > +#define RW_PART4_SZ    0x40000
> > +
> > +static struct mtd_partition p3p440_flash_partitions[] = {
> > +       {
> > +               .name = "kernel",
> > +               .offset = RW_PART0_OF,
> > +               .size = RW_PART0_SZ
> > +       },
> > +       {
> > +               .name = "root",
> > +               .offset = RW_PART1_OF,
>
> Please use .offset = MTDPART_OFS_APPEND,

Done. Thanks for the tip.

<snip>

> > +               .size = RW_PART4_SZ,
> > +       }
> > +};
> > +
> > +struct map_info p3p440_flash_map = {
>
> static

Done.

> > +       .name = "p3p440-flash",
> > +       .bankwidth = 2,
> > +};
> > +
> > +static struct mtd_info *p3p440_mtd;
> > +
> > +int __init init_p3p440_flash(void)
>
> static

Dito.

> > +{
> > +       unsigned long long flash_base;
> > +       unsigned long flash_size;
> > +
> > +       flash_base = __res.bi_flashstart | 0x0000000100000000LL;
> > +       flash_size = __res.bi_flashsize;
> > +
> > +       p3p440_flash_map.size = flash_size;
> > +       p3p440_flash_map.phys = flash_base;
> > +       p3p440_flash_map.virt = ioremap64(flash_base,
> > +                                         p3p440_flash_map.size);
> > +
> > +
> > +       if (!p3p440_flash_map.virt) {
> > +               printk("init_p3p440_flash: failed to ioremap\n");
>
> printk log level missing

Done.

> > +               return -EIO;
> > +       }
> > +
> > +       /*
> > +        * Adjust partitions to flash size
> > +        */
> > +       p3p440_flash_partitions[2].size = p3p440_flash_map.size -
> > +               RW_PART0_SZ - RW_PART1_SZ - RW_PART3_SZ - RW_PART4_SZ;
>
> <NOT_NECESSARY_WITH_MTD_OFS_APPEND>
>
> > +       p3p440_flash_partitions[3].offset =
> > p3p440_flash_partitions[2].size + +               RW_PART2_OF;
> > +       p3p440_flash_partitions[4].offset =
> > p3p440_flash_partitions[3].size + +              
> > p3p440_flash_partitions[3].offset;
> > +
>
> </NOT_NECESSARY_WITH_MTD_OFS_APPEND>

Removed.

> > +       simple_map_init(&p3p440_flash_map);
> > +
> > +       p3p440_mtd = do_map_probe("cfi_probe", &p3p440_flash_map);
> > +
> > +       if (p3p440_mtd) {
> > +               p3p440_mtd->owner = THIS_MODULE;
> > +               return add_mtd_partitions(p3p440_mtd,
> > +                                         p3p440_flash_partitions,
> > +                                        
> > ARRAY_SIZE(p3p440_flash_partitions)); +       }
> > +
> > +       return -ENXIO;
> > +}
> > +
> > +static void __exit cleanup_p3p440_flash(void)
> > +{
> > +       if (p3p440_mtd) {
> > +               del_mtd_partitions(p3p440_mtd);
> > +               /* moved iounmap after map_destroy - armin */
>
> Is this comment relevant for understanding the code ?

Relict from "copy and paste". Removed.

> > +               map_destroy(p3p440_mtd);
> > +               iounmap((void *)p3p440_flash_map.virt);
>
> Bogus type cast	of void* to void*

Fixed.

Please let me know, if this version is still not acceptable:

This patch adds MTD support (NOR FLASH) for the Prodrive P3P440
(440GP) PMC module.

Signed-off-by: Stefan Roese <sr@denx.de>

Best regards,
Stefan

--Boundary-00=_MZihDrWi83rFD40
Content-Type: text/x-diff; charset="iso-8859-6";
	name="add-p3p440-mtd-support-2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="add-p3p440-mtd-support-2.patch"

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 846a533..97c37ec 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -339,6 +339,14 @@ config MTD_OCOTEA
 	  Ocotea board. If you have one of these boards and would like to
 	  use the flash chips on it, say 'Y'.
 
+config MTD_P3P440
+	tristate "Flash devices mapped on Prodrive P3P440"
+	depends on MTD_CFI && P3P440
+	help
+	  This enables access routines for the flash chips on the Prodrive
+	  P3P440 board.  If you have this board and would like to use the
+	  flash chips on it, say 'Y'.
+
 config MTD_REDWOOD
 	tristate "CFI Flash devices mapped on IBM Redwood"
 	depends on MTD_CFI && ( REDWOOD_4 || REDWOOD_5 || REDWOOD_6 )
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 7d9e940..73a681a 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -73,3 +73,4 @@ obj-$(CONFIG_MTD_OMAP_NOR)	+= omap_nor.o
 obj-$(CONFIG_MTD_PQ2FADS)	+= pq2fads.o
 obj-$(CONFIG_MTD_MTX1)		+= mtx-1_flash.o
 obj-$(CONFIG_MTD_TQM834x)	+= tqm834x.o
+obj-$(CONFIG_MTD_P3P440)	+= p3p440.o
diff --git a/drivers/mtd/maps/p3p440.c b/drivers/mtd/maps/p3p440.c
new file mode 100644
index 0000000..54be1e1
--- /dev/null
+++ b/drivers/mtd/maps/p3p440.c
@@ -0,0 +1,126 @@
+/*
+ * $Id: $
+ *
+ * drivers/mtd/maps/p3p440.c
+ *
+ * Mapping for Prodrive P3P440 flash
+ *
+ * Copyright (c) 2005 DENX Software Engineering
+ * Stefan Roese <sr@denx.de>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/config.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/io.h>
+#include <asm/ibm4xx.h>
+#include <asm/ppcboot.h>
+
+extern bd_t __res;
+
+#define RW_PART0_OF	0
+#define RW_PART0_SZ	0x180000
+#define RW_PART1_SZ	0x280000
+/* Partition 2 will be autosized dynamically... */
+#define RW_PART3_SZ	0x40000
+#define RW_PART4_SZ	0x40000
+
+static struct mtd_partition p3p440_flash_partitions[] = {
+	{
+		.name = "kernel",
+		.offset = RW_PART0_OF,
+		.size = RW_PART0_SZ
+	},
+	{
+		.name = "root",
+		.offset = MTDPART_OFS_APPEND,
+		.size = RW_PART1_SZ,
+	},
+	{
+		.name = "user",
+		.offset = MTDPART_OFS_APPEND,
+/*		.size = RW_PART2_SZ */ /* will be adjusted dynamically */
+	},
+	{
+		.name = "env",
+		.offset = MTDPART_OFS_APPEND,
+		.size = RW_PART3_SZ,
+	},
+	{
+		.name = "u-boot",
+		.offset = MTDPART_OFS_APPEND,
+		.size = RW_PART4_SZ,
+	}
+};
+
+static struct map_info p3p440_flash_map = {
+	.name = "p3p440-flash",
+	.bankwidth = 2,
+};
+
+static struct mtd_info *p3p440_mtd;
+
+static int __init init_p3p440_flash(void)
+{
+	unsigned long long flash_base;
+	unsigned long flash_size;
+
+	flash_base = __res.bi_flashstart | 0x0000000100000000LL;
+	flash_size = __res.bi_flashsize;
+
+	p3p440_flash_map.size = flash_size;
+	p3p440_flash_map.phys = flash_base;
+	p3p440_flash_map.virt = ioremap64(flash_base, p3p440_flash_map.size);
+
+	if (!p3p440_flash_map.virt) {
+		printk(KERN_NOTICE "init_p3p440_flash: failed to ioremap\n");
+		return -EIO;
+	}
+
+	/*
+	 * Adjust partitions to flash size
+	 */
+	p3p440_flash_partitions[2].size = p3p440_flash_map.size -
+		RW_PART0_SZ - RW_PART1_SZ - RW_PART3_SZ - RW_PART4_SZ;
+
+	simple_map_init(&p3p440_flash_map);
+
+	p3p440_mtd = do_map_probe("cfi_probe", &p3p440_flash_map);
+
+	if (p3p440_mtd) {
+		p3p440_mtd->owner = THIS_MODULE;
+		return add_mtd_partitions(p3p440_mtd,
+					  p3p440_flash_partitions,
+					  ARRAY_SIZE(p3p440_flash_partitions));
+	}
+
+	return -ENXIO;
+}
+
+static void __exit cleanup_p3p440_flash(void)
+{
+	if (p3p440_mtd) {
+		del_mtd_partitions(p3p440_mtd);
+		map_destroy(p3p440_mtd);
+		iounmap(p3p440_flash_map.virt);
+	}
+}
+
+module_init(init_p3p440_flash);
+module_exit(cleanup_p3p440_flash);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Stefan Roese <sr@denx.de>");
+MODULE_DESCRIPTION("MTD map and partitions for Prodrive P3P440 board");

--Boundary-00=_MZihDrWi83rFD40--
