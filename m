Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CWCYi-0008O4-4f
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2004 06:40:43 -0500
From: Ian Campbell <icampbell@arcom.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1101121681.8191.7439.camel@hades.cambridge.redhat.com>
References: <1099057831.24918.1684.camel@icampbell-debian>
	<1101121681.8191.7439.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Date: Mon, 22 Nov 2004 11:40:37 +0000
Message-Id: <1101123638.2922.289.camel@icampbell-debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] fix detection of redboot fis partition table
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-22 at 11:08 +0000, David Woodhouse wrote:
> On Fri, 2004-10-29 at 14:50 +0100, Ian Campbell wrote:
> > The patch (against BK) below sorts these out. Is it OK to commit to MTD
> > CVS and then send to Linus?
> 
> Please commit them. I'll put them in the BK tree for pulling after
> 2.6.10 is released.

Done. 

Would you object to my updating the sbc_gxx.c map driver as well? It has
gotten rather out of sync with the code we are currently running. 

The patch is pretty huge but I've attached it anyway... It adds support
for the SRAM device and updates the partitioning code, I think I also
lindented it at some point in the last couple of years as well.

Ian.

--- 2.6.orig/drivers/mtd/maps/sbc_gxx.c	2004-11-02 15:15:41.968615497 +0000
+++ 2.6/drivers/mtd/maps/sbc_gxx.c	2004-11-02 15:17:46.294907093 +0000
@@ -1,50 +1,47 @@
-/* sbc_gxx.c -- MTD map driver for Arcom Control Systems SBC-MediaGX,
-                SBC-GXm and SBC-GX1 series boards.
- 
-   Copyright (C) 2001 Arcom Control System Ltd
- 
-   This program is free software; you can redistribute it and/or modify
-   it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 2 of the License, or
-   (at your option) any later version.
- 
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
- 
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
-
-   $Id: sbc_gxx.c,v 1.32 2004/11/16 18:29:02 dwmw2 Exp $
-
-The SBC-MediaGX / SBC-GXx has up to 16 MiB of 
-Intel StrataFlash (28F320/28F640) in x8 mode.  
-
-This driver uses the CFI probe and Intel Extended Command Set drivers.
-
-The flash is accessed as follows:
-
-   16 KiB memory window at 0xdc000-0xdffff
-   
-   Two IO address locations for paging
-   
-   0x258
-       bit 0-7: address bit 14-21
-   0x259
-       bit 0-1: address bit 22-23
-       bit 7:   0 - reset/powered down
-                1 - device enabled
-
-The single flash device is divided into 3 partition which appear as 
-separate MTD devices.
-
-25/04/2001 AJL (Arcom)  Modified signon strings and partition sizes
-                        (to support bzImages up to 638KiB-ish)
-*/
-
-// Includes
+/* sbc_gxx.c -- MTD map driver for Arcom Control Systems SBC-GXx boards.
+ * 
+ *   Copyright (C) 2001-2004 Arcom Control System Ltd
+ * 
+ *   This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ * 
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
+ *
+ *  $Id: sbc_gxx.c,v 1.32 2004/11/16 18:29:02 dwmw2 Exp $
+ */
+
+/*
+ * The SBC-MediaGX / SBC-GXx has up to 16 MiB of 
+ * Intel StrataFlash (28F320/28F640) in x8 mode.  
+ *
+ * This driver uses the CFI probe and Intel Extended Command Set drivers.
+ *
+ * The flash is accessed as follows:
+ *
+ *   16 KiB memory window at 0xdc000-0xdffff
+ *
+ *   Two IO address locations for paging
+ *   
+ *   0x258
+ *       bit 0-7: address bit 14-21
+ *   0x259
+ *       bit 0-1: address bit 22-23
+ *       bit 6:   0 - select Flash
+ *                1 - select SRAM
+ *       bit 7:   0 - reset/powered down
+ *                1 - device enabled
+ *
+ * 
+ */
 
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -56,10 +53,7 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
 
-// Defines
-
-// - Hardware specific
-
+/* location of flash memory window */
 #define WINDOW_START 0xdc000
 
 /* Number of bits in offset. */
@@ -73,66 +67,74 @@
 
 /* bit 7 of 0x259 must be 1 to enable device. */
 #define DEVICE_ENABLE 0x8000
+/* bit 6 of 0x259 must be 1 to select SRAM. */
+#define SELECT_SRAM 0x4000
 
-// - Flash / Partition sizing
-
-#define MAX_SIZE_KiB             16384
-#define BOOT_PARTITION_SIZE_KiB  768
-#define DATA_PARTITION_SIZE_KiB  1280
-#define APP_PARTITION_SIZE_KiB   6144
-
-// Globals
+#define SBC_GXX_FLASH 0
+#define SBC_GXX_SRAM  1
 
-static volatile int page_in_window = -1; // Current page in window.
+static volatile int page_in_window = -1;
 static void __iomem *iomapadr;
 static spinlock_t sbc_gxx_spin = SPIN_LOCK_UNLOCKED;
 
+#ifdef CONFIG_MTD_PARTITIONS
+static struct mtd_partition *mtd_parts;
+static int mtd_parts_nb;
+#endif
+
 /* partition_info gives details on the logical partitions that the split the 
  * single flash device into. If the size if zero we use up to the end of the
  * device. */
-static struct mtd_partition partition_info[]={
-    { .name = "SBC-GXx flash boot partition", 
-      .offset = 0, 
-      .size =   BOOT_PARTITION_SIZE_KiB*1024 },
-    { .name = "SBC-GXx flash data partition", 
-      .offset = BOOT_PARTITION_SIZE_KiB*1024, 
-      .size = (DATA_PARTITION_SIZE_KiB)*1024 },
-    { .name = "SBC-GXx flash application partition", 
-      .offset = (BOOT_PARTITION_SIZE_KiB+DATA_PARTITION_SIZE_KiB)*1024 }
+static struct mtd_partition partition_info[] = {
+	{
+		.name = "boot",
+		.offset = 0,
+		.size = 768 * 1024
+	},
+	{
+		.name = "filesystem",
+		.offset = 768 * 1024,
+		.size = 0
+	},
 };
 
-#define NUM_PARTITIONS 3
+const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
+
+#define NUM_PARTITIONS  (sizeof(partition_info)/sizeof(struct mtd_partition))
 
-static inline void sbc_gxx_page(struct map_info *map, unsigned long ofs)
+static inline void sbc_gxx_page(struct map_info *map, unsigned long ofs,
+				int sram)
 {
 	unsigned long page = ofs >> WINDOW_SHIFT;
 
-	if( page!=page_in_window ) {
-		outw( page | DEVICE_ENABLE, PAGE_IO );
+	if (page != page_in_window) {
+		if (sram == SBC_GXX_SRAM)
+			page |= SELECT_SRAM;
+		outw(page | DEVICE_ENABLE, PAGE_IO);
 		page_in_window = page;
 	}
 }
 
-
-static map_word sbc_gxx_read8(struct map_info *map, unsigned long ofs)
+static map_word sbc_gxx_read(struct map_info *map, unsigned long ofs)
 {
 	map_word ret;
 	spin_lock(&sbc_gxx_spin);
-	sbc_gxx_page(map, ofs);
+	sbc_gxx_page(map, ofs, map->map_priv_2);
 	ret.x[0] = readb(iomapadr + (ofs & WINDOW_MASK));
 	spin_unlock(&sbc_gxx_spin);
 	return ret;
 }
 
-static void sbc_gxx_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
+static void sbc_gxx_copy_from(struct map_info *map, void *to,
+			      unsigned long from, ssize_t len)
 {
-	while(len) {
+	while (len) {
 		unsigned long thislen = len;
 		if (len > (WINDOW_LENGTH - (from & WINDOW_MASK)))
-			thislen = WINDOW_LENGTH-(from & WINDOW_MASK);
-		
+			thislen = WINDOW_LENGTH - (from & WINDOW_MASK);
+
 		spin_lock(&sbc_gxx_spin);
-		sbc_gxx_page(map, from);
+		sbc_gxx_page(map, from, map->map_priv_2);
 		memcpy_fromio(to, iomapadr + (from & WINDOW_MASK), thislen);
 		spin_unlock(&sbc_gxx_spin);
 		to += thislen;
@@ -141,23 +143,24 @@
 	}
 }
 
-static void sbc_gxx_write8(struct map_info *map, map_word d, unsigned long adr)
+static void sbc_gxx_write(struct map_info *map, map_word d, unsigned long adr)
 {
 	spin_lock(&sbc_gxx_spin);
-	sbc_gxx_page(map, adr);
+	sbc_gxx_page(map, adr, map->map_priv_2);
 	writeb(d.x[0], iomapadr + (adr & WINDOW_MASK));
 	spin_unlock(&sbc_gxx_spin);
 }
 
-static void sbc_gxx_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
-{	
-	while(len) {
+static void sbc_gxx_copy_to(struct map_info *map, unsigned long to,
+			    const void *from, ssize_t len)
+{
+	while (len) {
 		unsigned long thislen = len;
 		if (len > (WINDOW_LENGTH - (to & WINDOW_MASK)))
-			thislen = WINDOW_LENGTH-(to & WINDOW_MASK);
-		
+			thislen = WINDOW_LENGTH - (to & WINDOW_MASK);
+
 		spin_lock(&sbc_gxx_spin);
-		sbc_gxx_page(map, to);
+		sbc_gxx_page(map, to, map->map_priv_2);
 		memcpy_toio(iomapadr + (to & WINDOW_MASK), from, thislen);
 		spin_unlock(&sbc_gxx_spin);
 		to += thislen;
@@ -166,69 +169,120 @@
 	}
 }
 
-static struct map_info sbc_gxx_map = {
-	.name = "SBC-GXx flash",
-	.phys = NO_XIP,
-	.size = MAX_SIZE_KiB*1024, /* this must be set to a maximum possible amount
-			 of flash so the cfi probe routines find all
-			 the chips */
-	.bankwidth = 1,
-	.read = sbc_gxx_read8,
-	.copy_from = sbc_gxx_copy_from,
-	.write = sbc_gxx_write8,
-	.copy_to = sbc_gxx_copy_to
+static struct map_info flash_map = {
+	.name 		= "flash",
+	.phys		= NO_XIP,
+	.size		= 16 * 1024 * 1024,
+	.map_priv_2	= SBC_GXX_FLASH,
+	
+	.bankwidth	= 1,
+	.read		= sbc_gxx_read,
+	.copy_from	= sbc_gxx_copy_from,
+	.write		= sbc_gxx_write,
+	.copy_to	= sbc_gxx_copy_to,
 };
 
-/* MTD device for all of the flash. */
-static struct mtd_info *all_mtd;
-
-static void cleanup_sbc_gxx(void)
-{
-	if( all_mtd ) {
-		del_mtd_partitions( all_mtd );
-		map_destroy( all_mtd );
-	}
+static struct map_info sram_map = {
+	.name		= "sram",
+	.phys		= NO_XIP,
+	.size		= 128 * 1024,
+	.map_priv_2	= SBC_GXX_SRAM,
+
+	.bankwidth	= 1,
+	.read		= sbc_gxx_read,
+	.copy_from	= sbc_gxx_copy_from,
+	.write		= sbc_gxx_write,
+	.copy_to	= sbc_gxx_copy_to,
+};
 
-	iounmap((void *)iomapadr);
-	release_region(PAGE_IO,PAGE_IO_SIZE);
-}
+static struct mtd_info *flash_mtd;
+static struct mtd_info *sram_mtd;
 
 static int __init init_sbc_gxx(void)
 {
-  	iomapadr = ioremap(WINDOW_START, WINDOW_LENGTH);
+	int ret = -EIO;
+
+	iomapadr = ioremap(WINDOW_START, WINDOW_LENGTH);
 	if (!iomapadr) {
-		printk( KERN_ERR"%s: failed to ioremap memory region\n",
-			sbc_gxx_map.name );
-		return -EIO;
+		printk(KERN_ERR "sbc-gxx: failed to ioremap memory region\n");
+		goto out;
 	}
-	
-	if (!request_region( PAGE_IO, PAGE_IO_SIZE, "SBC-GXx flash")) {
-		printk( KERN_ERR"%s: IO ports 0x%x-0x%x in use\n",
-			sbc_gxx_map.name,
-			PAGE_IO, PAGE_IO+PAGE_IO_SIZE-1 );
-		iounmap((void *)iomapadr);
-		return -EAGAIN;
+
+	if (!request_region(PAGE_IO, PAGE_IO_SIZE, "SBC-GXx flash")) {
+		printk(KERN_ERR "sbc-gxx: I/O ports 0x%x-0x%x in use\n",
+		       PAGE_IO, PAGE_IO + PAGE_IO_SIZE - 1);
+		goto out_unmap;
 	}
-		
-	
-	printk( KERN_INFO"%s: IO:0x%x-0x%x MEM:0x%x-0x%x\n",
-		sbc_gxx_map.name,
-		PAGE_IO, PAGE_IO+PAGE_IO_SIZE-1,
-		WINDOW_START, WINDOW_START+WINDOW_LENGTH-1 );
+
+	printk(KERN_INFO "sbc-gxx: Flash/SRAM driver IO:0x%x-0x%x MEM:0x%x-0x%x\n",
+	       PAGE_IO, PAGE_IO + PAGE_IO_SIZE - 1, WINDOW_START,
+	       WINDOW_START + WINDOW_LENGTH - 1);
 
 	/* Probe for chip. */
-	all_mtd = do_map_probe( "cfi_probe", &sbc_gxx_map );
-	if( !all_mtd ) {
-		cleanup_sbc_gxx();
-		return -ENXIO;
+	flash_mtd = do_map_probe("cfi_probe", &flash_map);
+	if (!flash_mtd) {
+		ret = -ENXIO;
+		goto out_unio;
 	}
-	
-	all_mtd->owner = THIS_MODULE;
+	flash_mtd->owner = THIS_MODULE;
 
-	/* Create MTD devices for each partition. */
-	add_mtd_partitions(all_mtd, partition_info, NUM_PARTITIONS );
+#ifdef CONFIG_MTD_PARTITIONS
+	mtd_parts_nb = parse_mtd_partitions(flash_mtd, part_probes, &mtd_parts, 0);
+	if (mtd_parts_nb > 0) {
+		add_mtd_partitions(flash_mtd, mtd_parts, mtd_parts_nb);
+	} else if (NUM_PARTITIONS != 0) {
+		printk(KERN_NOTICE "sbc-gxx: using static partition definition\n");
+		add_mtd_partitions(flash_mtd, partition_info, NUM_PARTITIONS);
+	} else
+#endif
+	{
+		add_mtd_device(flash_mtd);
+	}
+	
+	sram_mtd = do_map_probe("map_ram", &sram_map);
+	if (sram_mtd) {
+		sram_mtd->owner = THIS_MODULE;
+		add_mtd_device(sram_mtd);
+	} else {
+		/* Most SBC-GX1s have no SRAM fitted, so ignore them */
+		printk(KERN_INFO "sbc-gxx: No SRAM Found.\n");
+	}
 
 	return 0;
+
+ out_unio:
+	release_region(PAGE_IO, PAGE_IO_SIZE);
+ out_unmap:
+	iounmap(iomapadr);
+	iomapadr = NULL;
+ out:
+	return ret;
+}
+
+static void __exit cleanup_sbc_gxx(void)
+{
+#ifdef CONFIG_MTD_PARTITIONS
+	if (mtd_parts_nb) {
+		del_mtd_partitions(flash_mtd);
+		kfree(mtd_parts);
+	} else if (NUM_PARTITIONS != 0) {
+		del_mtd_partitions(flash_mtd);
+	} else
+#endif
+	{
+		del_mtd_device(flash_mtd);
+	}
+
+	if (sram_mtd) {
+		map_destroy(sram_mtd);
+		sram_mtd = NULL;
+	}
+
+	if (iomapadr)
+		iounmap(iomapadr);
+
+	iomapadr = NULL;
+	release_region(PAGE_IO, PAGE_IO_SIZE);
 }
 
 module_init(init_sbc_gxx);
@@ -236,4 +290,4 @@
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Arcom Control Systems Ltd.");
-MODULE_DESCRIPTION("MTD map driver for SBC-GXm and SBC-GX1 series boards");
+MODULE_DESCRIPTION("MTD map driver for SBC-GXx series boards");

-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200
