Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Biapq-00071o-4U
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2004 11:29:19 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1089300544.28614.1331.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 08 Jul 2004 16:29:05 +0100
Content-Transfer-Encoding: 7bit
Cc: nico@cam.org, "Thomas W. Nelson" <twn@dot4.com>
Subject: Flash bank width larger than physical buswidth
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I just committed a first attempt at handling the case we discussed
yesterday, of bank widths larger than the physical buswidth.

The probe routines appear to still work; I've broken all the NOR flash
drivers. Will fix cfi_cmdset_0002.c tomorrow; volunteers for fixing and
testing the others would be appreciated -- or indeed comments on the
approach. I figured just committing it would get people's attention
though ;)

Index: drivers/mtd/chips/Kconfig
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/Kconfig,v
retrieving revision 1.6
diff -u -p -r1.6 Kconfig
--- drivers/mtd/chips/Kconfig	4 Jun 2004 15:59:33 -0000	1.6
+++ drivers/mtd/chips/Kconfig	8 Jul 2004 15:23:02 -0000
@@ -85,34 +85,48 @@ config MTD_CFI_GEOMETRY
 	  arrangements of CFI chips. If unsure, say 'N' and all options 
 	  which are supported by the current code will be enabled.
 
-config MTD_CFI_B1
-	bool "Support  8-bit buswidth"
-	depends on MTD_CFI_GEOMETRY
+config MTD_MAP_BANK_WIDTH_1
+	bool "Support  8-bit buswidth" if MTD_CFI_GEOMETRY
+	default y
 	help
 	  If you wish to support CFI devices on a physical bus which is
 	  8 bits wide, say 'Y'.
 
-config MTD_CFI_B2
-	bool "Support 16-bit buswidth"
-	depends on MTD_CFI_GEOMETRY
+config MTD_MAP_BANK_WIDTH_2
+	bool "Support 16-bit buswidth" if MTD_CFI_GEOMETRY
+	default y
 	help
 	  If you wish to support CFI devices on a physical bus which is
 	  16 bits wide, say 'Y'.
 
-config MTD_CFI_B4
-	bool "Support 32-bit buswidth"
-	depends on MTD_CFI_GEOMETRY
+config MTD_MAP_BANK_WIDTH_4
+	bool "Support 32-bit buswidth" if MTD_CFI_GEOMETRY
+	default y
 	help
 	  If you wish to support CFI devices on a physical bus which is
 	  32 bits wide, say 'Y'.
 
-config MTD_CFI_B8
-	bool "Support 64-bit buswidth"
-	depends on MTD_CFI_GEOMETRY
+config MTD_MAP_BANK_WIDTH_8
+	bool "Support 64-bit buswidth" if MTD_CFI_GEOMETRY
+	default n
 	help
 	  If you wish to support CFI devices on a physical bus which is
 	  64 bits wide, say 'Y'.
 
+config MTD_MAP_BANK_WIDTH_16
+	bool "Support 128-bit buswidth" if MTD_CFI_GEOMETRY
+	default n
+	help
+	  If you wish to support CFI devices on a physical bus which is
+	  128 bits wide, say 'Y'.
+
+config MTD_MAP_BANK_WIDTH_32
+	bool "Support 256-bit buswidth" if MTD_CFI_GEOMETRY
+	default n
+	help
+	  If you wish to support CFI devices on a physical bus which is
+	  256 bits wide, say 'Y'.
+
 config MTD_CFI_I1
 	bool "Support 1-chip flash interleave" if !MTD_CFI_B1
 	depends on MTD_CFI_GEOMETRY
Index: drivers/mtd/chips/cfi_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_probe.c,v
retrieving revision 1.74
diff -u -p -r1.74 cfi_probe.c
--- drivers/mtd/chips/cfi_probe.c	17 Feb 2004 16:43:41 -0000	1.74
+++ drivers/mtd/chips/cfi_probe.c	8 Jul 2004 15:23:03 -0000
@@ -35,17 +35,32 @@ struct mtd_info *cfi_probe(struct map_in
    in: interleave,type,mode
    ret: table index, <0 for error
  */
-static inline int qry_present(struct map_info *map, __u32 base,
+static int qry_present(struct map_info *map, __u32 base,
 				struct cfi_private *cfi)
 {
 	int osf = cfi->interleave * cfi->device_type;	// scale factor
+	map_word val;
+	map_word qry;
 
-	if (cfi_read(map,base+osf*0x10)==cfi_build_cmd('Q',map,cfi) &&
-	    cfi_read(map,base+osf*0x11)==cfi_build_cmd('R',map,cfi) &&
-	    cfi_read(map,base+osf*0x12)==cfi_build_cmd('Y',map,cfi))
-		return 1;	// ok !
+	qry =  cfi_build_cmd('Q', map, cfi);
+	val = map_read(map, base + osf*0x10);
 
-	return 0; 	// nothing found
+	if (!map_word_equal(qry, val))
+		return 0;
+
+	qry =  cfi_build_cmd('R', map, cfi);
+	val = map_read(map, base + osf*0x11);
+
+	if (!map_word_equal(qry, val))
+		return 0;
+
+	qry =  cfi_build_cmd('Y', map, cfi);
+	val = map_read(map, base + osf*0x12);
+
+	if (!map_word_equal(qry, val))
+		return 0;
+
+	return 1; 	// nothing found
 }
 
 static int cfi_probe_chip(struct map_info *map, __u32 base,
@@ -122,7 +137,7 @@ static int cfi_probe_chip(struct map_inf
 
 	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit mode\n",
 	       map->name, cfi->interleave, cfi->device_type*8, base,
-	       map->buswidth*8);
+	       map->bankwidth*8);
 	
 	return 1;
 }
@@ -197,9 +212,9 @@ static int cfi_chip_setup(struct map_inf
 	/* Put it back into Read Mode */
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 
-	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit mode\n",
+	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
 	       map->name, cfi->interleave, cfi->device_type*8, base,
-	       map->buswidth*8);
+	       map->bankwidth*8);
 
 	return 1;
 }
Index: drivers/mtd/chips/gen_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/gen_probe.c,v
retrieving revision 1.15
diff -u -p -r1.15 gen_probe.c
--- drivers/mtd/chips/gen_probe.c	24 Jun 2004 18:10:39 -0000	1.15
+++ drivers/mtd/chips/gen_probe.c	8 Jul 2004 15:23:03 -0000
@@ -51,7 +51,7 @@ struct mtd_info *mtd_do_chip_probe(struc
 EXPORT_SYMBOL(mtd_do_chip_probe);
 
 
-struct cfi_private *genprobe_ident_chips(struct map_info *map, struct chip_probe *cp)
+static struct cfi_private *genprobe_ident_chips(struct map_info *map, struct chip_probe *cp)
 {
 	struct cfi_private cfi;
 	struct cfi_private *retcfi;
@@ -82,22 +82,15 @@ struct cfi_private *genprobe_ident_chips
 #endif
 	cfi.chipshift = cfi.cfiq->DevSize;
 
-	switch(cfi.interleave) {
-#ifdef CFIDEV_INTERLEAVE_1
-	case 1:
-		break;
-#endif
-#ifdef CFIDEV_INTERLEAVE_2
-	case 2:
+	if (cfi_interleave_is_1(cfi)) {
+		;
+	} else if (cfi_interleave_is_2(cfi)) {
 		cfi.chipshift++;
-		break;
-#endif
-#ifdef CFIDEV_INTERLEAVE_4
-	case 4:
-		cfi.chipshift+=2;
-		break;
-#endif
-	default:
+	} else if (cfi_interleave_is_4(cfi)) {
+		cfi.chipshift += 2;
+	} else if (cfi_interleave_is_8(cfi)) {
+		cfi.chipshift += 3;
+	} else {
 		BUG();
 	}
 		
@@ -166,131 +159,24 @@ struct cfi_private *genprobe_ident_chips
 static int genprobe_new_chip(struct map_info *map, struct chip_probe *cp,
 			     struct cfi_private *cfi)
 {
-	switch (map->buswidth) {
-#ifdef CFIDEV_BUSWIDTH_1		
-	case CFIDEV_BUSWIDTH_1:
-		cfi->interleave = CFIDEV_INTERLEAVE_1;
-
-		cfi->device_type = CFI_DEVICETYPE_X8;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-
-		cfi->device_type = CFI_DEVICETYPE_X16;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-		break;			
-#endif /* CFIDEV_BUSWITDH_1 */
-
-#ifdef CFIDEV_BUSWIDTH_2		
-	case CFIDEV_BUSWIDTH_2:
-#ifdef CFIDEV_INTERLEAVE_1
-		cfi->interleave = CFIDEV_INTERLEAVE_1;
-
-		cfi->device_type = CFI_DEVICETYPE_X16;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-#endif /* CFIDEV_INTERLEAVE_1 */
-#ifdef CFIDEV_INTERLEAVE_2
-		cfi->interleave = CFIDEV_INTERLEAVE_2;
-
-		cfi->device_type = CFI_DEVICETYPE_X8;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-
-		cfi->device_type = CFI_DEVICETYPE_X16;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-#endif /* CFIDEV_INTERLEAVE_2 */
-		break;			
-#endif /* CFIDEV_BUSWIDTH_2 */
-
-#ifdef CFIDEV_BUSWIDTH_4
-	case CFIDEV_BUSWIDTH_4:
-#if defined(CFIDEV_INTERLEAVE_1) && defined(SOMEONE_ACTUALLY_MAKES_THESE)
-                cfi->interleave = CFIDEV_INTERLEAVE_1;
-
-                cfi->device_type = CFI_DEVICETYPE_X32;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-#endif /* CFIDEV_INTERLEAVE_1 */
-#ifdef CFIDEV_INTERLEAVE_2
-		cfi->interleave = CFIDEV_INTERLEAVE_2;
-
-#ifdef SOMEONE_ACTUALLY_MAKES_THESE
-		cfi->device_type = CFI_DEVICETYPE_X32;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-#endif
-		cfi->device_type = CFI_DEVICETYPE_X16;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-
-		cfi->device_type = CFI_DEVICETYPE_X8;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-#endif /* CFIDEV_INTERLEAVE_2 */
-#ifdef CFIDEV_INTERLEAVE_4
-		cfi->interleave = CFIDEV_INTERLEAVE_4;
-
-#ifdef SOMEONE_ACTUALLY_MAKES_THESE
-		cfi->device_type = CFI_DEVICETYPE_X32;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-#endif
-		cfi->device_type = CFI_DEVICETYPE_X16;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-
-		cfi->device_type = CFI_DEVICETYPE_X8;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-#endif /* CFIDEV_INTERLEAVE_4 */
-		break;
-#endif /* CFIDEV_BUSWIDTH_4 */
-
-#ifdef CFIDEV_BUSWIDTH_8
-	case CFIDEV_BUSWIDTH_8:
-#if defined(CFIDEV_INTERLEAVE_2) && defined(SOMEONE_ACTUALLY_MAKES_THESE)
-                cfi->interleave = CFIDEV_INTERLEAVE_2;
-
-                cfi->device_type = CFI_DEVICETYPE_X32;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-#endif /* CFIDEV_INTERLEAVE_2 */
-#ifdef CFIDEV_INTERLEAVE_4
-		cfi->interleave = CFIDEV_INTERLEAVE_4;
-
-#ifdef SOMEONE_ACTUALLY_MAKES_THESE
-		cfi->device_type = CFI_DEVICETYPE_X32;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-#endif
-		cfi->device_type = CFI_DEVICETYPE_X16;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-#endif /* CFIDEV_INTERLEAVE_4 */
-#ifdef CFIDEV_INTERLEAVE_8
-		cfi->interleave = CFIDEV_INTERLEAVE_8;
-
-		cfi->device_type = CFI_DEVICETYPE_X16;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-
-		cfi->device_type = CFI_DEVICETYPE_X8;
-		if (cp->probe_chip(map, 0, NULL, cfi))
-			return 1;
-#endif /* CFIDEV_INTERLEAVE_8 */
-		break;
-#endif /* CFIDEV_BUSWIDTH_8 */
-
-	default:
-		printk(KERN_WARNING "genprobe_new_chip called with unsupported buswidth %d\n", map->buswidth);
-		return 0;
+	int min_chips = (map_bankwidth(map)/4?:1); /* At most 4-bytes wide. */
+	int max_chips = map_bankwidth(map); /* And minimum 1 */
+	int nr_chips, type;
+
+	for (nr_chips = min_chips; nr_chips <= max_chips; nr_chips <<= 1) {
+
+		cfi->interleave = nr_chips;
+
+		for (type = 0; type < 3; type++) {
+			cfi->device_type = 1<<type;
+
+			if (cp->probe_chip(map, 0, NULL, cfi))
+				return 1;
+		}
 	}
 	return 0;
 }
 
-
 typedef struct mtd_info *cfi_cmdset_fn_t(struct map_info *, int);
 
 extern cfi_cmdset_fn_t cfi_cmdset_0001;
Index: drivers/mtd/chips/jedec_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/jedec_probe.c,v
retrieving revision 1.47
diff -u -p -r1.47 jedec_probe.c
--- drivers/mtd/chips/jedec_probe.c	15 Apr 2004 12:32:49 -0000	1.47
+++ drivers/mtd/chips/jedec_probe.c	8 Jul 2004 15:23:04 -0000
@@ -1527,23 +1527,23 @@ struct mtd_info *jedec_probe(struct map_
 static inline u32 jedec_read_mfr(struct map_info *map, __u32 base, 
 	struct cfi_private *cfi)
 {
-	u32 result, mask;
+	map_word result;
+	unsigned long mask;
 	mask = (1 << (cfi->device_type * 8)) -1;
-	result = cfi_read(map, base);
-	result &= mask;
-	return result;
+	result = map_read(map, base);
+	return result.x[0] & mask;
 }
 
 static inline u32 jedec_read_id(struct map_info *map, __u32 base, 
 	struct cfi_private *cfi)
 {
 	int osf;
-	u32 result, mask;
+	map_word result;
+	unsigned long mask;
 	osf = cfi->interleave *cfi->device_type;
 	mask = (1 << (cfi->device_type * 8)) -1;
-	result = cfi_read(map, base + osf);
-	result &= mask;
-	return result;
+	result = map_read(map, base + osf);
+	return result.x[0] & mask;
 }
 
 static inline void jedec_reset(u32 base, struct map_info *map, 
@@ -1908,9 +1908,9 @@ ok_out:
 	/* Put it back into Read Mode */
 	jedec_reset(base, map, cfi);
 
-	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit mode\n",
+	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
 	       map->name, cfi->interleave, cfi->device_type*8, base, 
-	       map->buswidth*8);
+	       map->bankwidth*8);
 	
 	return 1;
 }
Index: drivers/mtd/maps/Kconfig
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/Kconfig,v
retrieving revision 1.23
diff -u -p -r1.23 Kconfig
--- drivers/mtd/maps/Kconfig	7 Jun 2004 10:21:32 -0000	1.23
+++ drivers/mtd/maps/Kconfig	8 Jul 2004 15:23:05 -0000
@@ -558,10 +558,25 @@ config MTD_UCLINUX
 
 config MTD_WRSBC8260
 	tristate "Map driver for WindRiver PowerQUICC II MPC82xx board"
-	depends on MTD_PARTITIONS && SBC82xx
+	depends on SBC82xx
+	select MTD_PARTITIONS
+	select MTD_MAP_BANK_WIDTH_4
+	select MTD_MAP_BANK_WIDTH_1
+	select MTD_CFI_I1
+	select MTD_CFI_I2
 	help
 	  Map driver for WindRiver PowerQUICC II MPC82xx board. Drives
 	  all three flash regions on CS0, CS1 and CS6 if they are configured
 	  correctly by the boot loader.
+
+config MTD_DMV182
+        tristate "Map driver for Dy-4 SVME/DMV-182 board."
+        depends on DMV182
+        select MTD_PARTITIONS
+	select MTD_MAP_BANK_WIDTH_32
+	select MTD_CFI_I8
+        help
+          Map driver for Dy-4 SVME/DMV-182 board.
+
 endmenu
 
Index: drivers/mtd/maps/Makefile.common
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/Makefile.common,v
retrieving revision 1.12
diff -u -p -r1.12 Makefile.common
--- drivers/mtd/maps/Makefile.common	7 Jun 2004 10:21:32 -0000	1.12
+++ drivers/mtd/maps/Makefile.common	8 Jul 2004 15:23:05 -0000
@@ -69,5 +69,6 @@ obj-$(CONFIG_MTD_NOR_TOTO)	+= omap-toto-
 obj-$(CONFIG_MTD_MPC1211)	+= mpc1211.o
 obj-$(CONFIG_MTD_IXP4XX)	+= ixp4xx.o
 obj-$(CONFIG_MTD_WRSBC8260)	+= wr_sbc82xx_flash.o
+obj-$(CONFIG_MTD_DMV182)	+= dmv182.o
 
 -include $(TOPDIR)/Rules.make
Index: drivers/mtd/maps/map_funcs.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/map_funcs.c,v
retrieving revision 1.5
diff -u -p -r1.5 map_funcs.c
--- drivers/mtd/maps/map_funcs.c	3 Jun 2004 04:10:22 -0000	1.5
+++ drivers/mtd/maps/map_funcs.c	8 Jul 2004 15:23:05 -0000
@@ -7,89 +7,33 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/config.h>
-#include <linux/types.h>
-#include <linux/string.h>
-#include <asm/io.h>
 
 #include <linux/mtd/map.h>
 
-static u8 simple_map_read8(struct map_info *map, unsigned long ofs)
+static map_word simple_map_read(struct map_info *map, unsigned long ofs)
 {
-	return __raw_readb(map->virt + ofs);
+	return inline_map_read(map, ofs);
 }
 
-static u16 simple_map_read16(struct map_info *map, unsigned long ofs)
+static void simple_map_write(struct map_info *map, const map_word datum, unsigned long ofs)
 {
-	return __raw_readw(map->virt + ofs);
-}
-
-static u32 simple_map_read32(struct map_info *map, unsigned long ofs)
-{
-	return __raw_readl(map->virt + ofs);
-}
-
-static u64 simple_map_read64(struct map_info *map, unsigned long ofs)
-{
-#ifndef CONFIG_MTD_CFI_B8 /* 64-bit mappings */
-	BUG();
-	return 0;
-#else
-	return __raw_readq(map->virt + ofs);
-#endif
-}
-
-static void simple_map_write8(struct map_info *map, u8 datum, unsigned long ofs)
-{
-	__raw_writeb(datum, map->virt + ofs);
-	mb();
-}
-
-static void simple_map_write16(struct map_info *map, u16 datum, unsigned long ofs)
-{
-	__raw_writew(datum, map->virt + ofs);
-	mb();
-}
-
-static void simple_map_write32(struct map_info *map, u32 datum, unsigned long ofs)
-{
-	__raw_writel(datum, map->virt + ofs);
-	mb();
-}
-
-static void simple_map_write64(struct map_info *map, u64 datum, unsigned long ofs)
-{
-#ifndef CONFIG_MTD_CFI_B8 /* 64-bit mappings */
-	BUG();
-#else
-	__raw_writeq(datum, map->virt + ofs);
-	mb();
-#endif /* CFI_B8 */
+	inline_map_write(datum, map->virt + ofs);
 }
 
 static void simple_map_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
 {
-	if (map->cached)
-		memcpy(to, (char *)map->cached + from, len);
-	else
-		memcpy_fromio(to, map->virt + from, len);
+	inline_map_copy_from(map, to, from, len);
 }
 
 static void simple_map_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
 {
-	memcpy_toio(map->virt + to, from, len);
+	inline_map_copy_to(map, to, from, len);
 }
 
 void simple_map_init(struct map_info *map)
 {
-	map->read8 = simple_map_read8;
-	map->read16 = simple_map_read16;
-	map->read32 = simple_map_read32;
-	map->read64 = simple_map_read64;
-	map->write8 = simple_map_write8;
-	map->write16 = simple_map_write16;
-	map->write32 = simple_map_write32;
-	map->write64 = simple_map_write64;
+	map->read = simple_map_read;
+	map->write = simple_map_write;
 	map->copy_from = simple_map_copy_from;
 	map->copy_to = simple_map_copy_to;
 }
Index: include/linux/mtd/cfi.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/cfi.h,v
retrieving revision 1.41
diff -u -p -r1.41 cfi.h
--- include/linux/mtd/cfi.h	15 Apr 2004 12:16:12 -0000	1.41
+++ include/linux/mtd/cfi.h	8 Jul 2004 15:23:06 -0000
@@ -13,199 +13,50 @@
 #include <linux/types.h>
 #include <linux/interrupt.h>
 #include <linux/mtd/flashchip.h>
+#include <linux/mtd/map.h>
 #include <linux/mtd/cfi_endian.h>
 
-/*
- * You can optimize the code size and performance by defining only 
- * the geometry(ies) available on your hardware.
- * CFIDEV_INTERLEAVE_n, where  represents the interleave (number of chips to fill the bus width)
- * CFIDEV_BUSWIDTH_n, where n is the bus width in bytes (1, 2, 4 or 8 bytes)
- *
- * By default, all (known) geometries are supported.
- */
-
-#ifndef CONFIG_MTD_CFI_GEOMETRY
-
-/* The default case - support all but 64-bit, which has
-   a performance penalty */
-
-#define CFIDEV_INTERLEAVE_1 (1)
-#define CFIDEV_INTERLEAVE_2 (2)
-#define CFIDEV_INTERLEAVE_4 (4)
-
-#define CFIDEV_BUSWIDTH_1 (1)
-#define CFIDEV_BUSWIDTH_2 (2)
-#define CFIDEV_BUSWIDTH_4 (4)
-
-typedef __u32 cfi_word;
-
-#else
-
-/* Explicitly configured buswidth/interleave support */
-
 #ifdef CONFIG_MTD_CFI_I1
-#define CFIDEV_INTERLEAVE_1 (1)
-#endif
-#ifdef CONFIG_MTD_CFI_I2
-#define CFIDEV_INTERLEAVE_2 (2)
-#endif
-#ifdef CONFIG_MTD_CFI_I4
-#define CFIDEV_INTERLEAVE_4 (4)
-#endif
-#ifdef CONFIG_MTD_CFI_I8
-#define CFIDEV_INTERLEAVE_8 (8)
-#endif
-
-#ifdef CONFIG_MTD_CFI_B1
-#define CFIDEV_BUSWIDTH_1 (1)
-#endif
-#ifdef CONFIG_MTD_CFI_B2
-#define CFIDEV_BUSWIDTH_2 (2)
-#endif
-#ifdef CONFIG_MTD_CFI_B4
-#define CFIDEV_BUSWIDTH_4 (4)
-#endif
-#ifdef CONFIG_MTD_CFI_B8
-#define CFIDEV_BUSWIDTH_8 (8)
-#endif
-
-/* pick the largest necessary */
-#ifdef CONFIG_MTD_CFI_B8
-typedef __u64 cfi_word;
-
-/* This only works if asm/io.h is included first */
-#ifndef __raw_readq
-#define __raw_readq(addr)	(*(volatile __u64 *)(addr))
-#endif
-#ifndef __raw_writeq
-#define __raw_writeq(v, addr)	(*(volatile __u64 *)(addr) = (v))
-#endif
-#define CFI_WORD_64
-#else  /* CONFIG_MTD_CFI_B8 */
-/* All others can use 32-bits. It's probably more efficient than
-   the smaller types anyway */
-typedef __u32 cfi_word;
-#endif /* CONFIG_MTD_CFI_B8 */
-
-#endif
-
-/*
- * The following macros are used to select the code to execute:
- *   cfi_buswidth_is_*()
- *   cfi_interleave_is_*()
- *   [where * is either 1, 2, 4, or 8]
- * Those macros should be used with 'if' statements.  If only one of few
- * geometry arrangements are selected, they expand to constants thus allowing
- * the compiler (most of them being 0) to optimize away all the unneeded code,
- * while still validating the syntax (which is not possible with embedded 
- * #if ... #endif constructs).
- * The exception to this is the 64-bit versions, which need an extension
- * to the cfi_word type, and cause compiler warnings about shifts being
- * out of range.
- */
-
-#ifdef CFIDEV_INTERLEAVE_1
-# ifdef CFIDEV_INTERLEAVE
-#  undef CFIDEV_INTERLEAVE
-#  define CFIDEV_INTERLEAVE (cfi->interleave)
-# else
-#  define CFIDEV_INTERLEAVE CFIDEV_INTERLEAVE_1
-# endif
-# define cfi_interleave_is_1() (CFIDEV_INTERLEAVE == CFIDEV_INTERLEAVE_1)
-#else
-# define cfi_interleave_is_1() (0)
-#endif
-
-#ifdef CFIDEV_INTERLEAVE_2
-# ifdef CFIDEV_INTERLEAVE
-#  undef CFIDEV_INTERLEAVE
-#  define CFIDEV_INTERLEAVE (cfi->interleave)
-# else
-#  define CFIDEV_INTERLEAVE CFIDEV_INTERLEAVE_2
-# endif
-# define cfi_interleave_is_2() (CFIDEV_INTERLEAVE == CFIDEV_INTERLEAVE_2)
-#else
-# define cfi_interleave_is_2() (0)
-#endif
-
-#ifdef CFIDEV_INTERLEAVE_4
-# ifdef CFIDEV_INTERLEAVE
-#  undef CFIDEV_INTERLEAVE
-#  define CFIDEV_INTERLEAVE (cfi->interleave)
-# else
-#  define CFIDEV_INTERLEAVE CFIDEV_INTERLEAVE_4
-# endif
-# define cfi_interleave_is_4() (CFIDEV_INTERLEAVE == CFIDEV_INTERLEAVE_4)
+#define cfi_interleave(cfi) 1
+#define cfi_interleave_is_1(map) (cfi_interleave(cfi) == 1)
 #else
-# define cfi_interleave_is_4() (0)
-#endif
-
-#ifdef CFIDEV_INTERLEAVE_8
-# ifdef CFIDEV_INTERLEAVE
-#  undef CFIDEV_INTERLEAVE
-#  define CFIDEV_INTERLEAVE (cfi->interleave)
-# else
-#  define CFIDEV_INTERLEAVE CFIDEV_INTERLEAVE_8
-# endif
-# define cfi_interleave_is_8() (CFIDEV_INTERLEAVE == CFIDEV_INTERLEAVE_8)
-#else
-# define cfi_interleave_is_8() (0)
-#endif
-
-#ifndef CFIDEV_INTERLEAVE
-#error You must define at least one interleave to support!
+#define cfi_interleave_is_1(map) (0)
 #endif
 
-#ifdef CFIDEV_BUSWIDTH_1
-# ifdef CFIDEV_BUSWIDTH
-#  undef CFIDEV_BUSWIDTH
-#  define CFIDEV_BUSWIDTH (map->buswidth)
-# else
-#  define CFIDEV_BUSWIDTH CFIDEV_BUSWIDTH_1
-# endif
-# define cfi_buswidth_is_1() (CFIDEV_BUSWIDTH == CFIDEV_BUSWIDTH_1)
-#else
-# define cfi_buswidth_is_1() (0)
-#endif
-
-#ifdef CFIDEV_BUSWIDTH_2
-# ifdef CFIDEV_BUSWIDTH
-#  undef CFIDEV_BUSWIDTH
-#  define CFIDEV_BUSWIDTH (map->buswidth)
+#ifdef CONFIG_MTD_CFI_I2
+# ifdef cfi_interleave
+#  undef cfi_interleave
+#  define cfi_interleave(cfi) ((cfi)->interleave)
 # else
-#  define CFIDEV_BUSWIDTH CFIDEV_BUSWIDTH_2
+#  define cfi_interleave(cfi) 2
 # endif
-# define cfi_buswidth_is_2() (CFIDEV_BUSWIDTH == CFIDEV_BUSWIDTH_2)
+#define cfi_interleave_is_2(map) (cfi_interleave(cfi) == 2)
 #else
-# define cfi_buswidth_is_2() (0)
+#define cfi_interleave_is_2(map) (0)
 #endif
 
-#ifdef CFIDEV_BUSWIDTH_4
-# ifdef CFIDEV_BUSWIDTH
-#  undef CFIDEV_BUSWIDTH
-#  define CFIDEV_BUSWIDTH (map->buswidth)
+#ifdef CONFIG_MTD_CFI_I4
+# ifdef cfi_interleave
+#  undef cfi_interleave
+#  define cfi_interleave(cfi) ((cfi)->interleave)
 # else
-#  define CFIDEV_BUSWIDTH CFIDEV_BUSWIDTH_4
+#  define cfi_interleave(cfi) 4
 # endif
-# define cfi_buswidth_is_4() (CFIDEV_BUSWIDTH == CFIDEV_BUSWIDTH_4)
+#define cfi_interleave_is_4(map) (cfi_interleave(cfi) == 4)
 #else
-# define cfi_buswidth_is_4() (0)
+#define cfi_interleave_is_4(map) (0)
 #endif
 
-#ifdef CFIDEV_BUSWIDTH_8
-# ifdef CFIDEV_BUSWIDTH
-#  undef CFIDEV_BUSWIDTH
-#  define CFIDEV_BUSWIDTH (map->buswidth)
+#ifdef CONFIG_MTD_CFI_I8
+# ifdef cfi_interleave
+#  undef cfi_interleave
+#  define cfi_interleave(cfi) ((cfi)->interleave)
 # else
-#  define CFIDEV_BUSWIDTH CFIDEV_BUSWIDTH_8
+#  define cfi_interleave(cfi) 8
 # endif
-# define cfi_buswidth_is_8() (CFIDEV_BUSWIDTH == CFIDEV_BUSWIDTH_8)
+#define cfi_interleave_is_8(map) (cfi_interleave(cfi) == 8)
 #else
-# define cfi_buswidth_is_8() (0)
-#endif
-
-#ifndef CFIDEV_BUSWIDTH
-#error You must define at least one bus width to support!
+#define cfi_interleave_is_8(map) (0)
 #endif
 
 /* NB: these values must represents the number of bytes needed to meet the 
@@ -223,84 +74,84 @@ typedef __u32 cfi_word;
 
 /* Basic Query Structure */
 struct cfi_ident {
-  __u8  qry[3];
-  __u16 P_ID;
-  __u16 P_ADR;
-  __u16 A_ID;
-  __u16 A_ADR;
-  __u8  VccMin;
-  __u8  VccMax;
-  __u8  VppMin;
-  __u8  VppMax;
-  __u8  WordWriteTimeoutTyp;
-  __u8  BufWriteTimeoutTyp;
-  __u8  BlockEraseTimeoutTyp;
-  __u8  ChipEraseTimeoutTyp;
-  __u8  WordWriteTimeoutMax;
-  __u8  BufWriteTimeoutMax;
-  __u8  BlockEraseTimeoutMax;
-  __u8  ChipEraseTimeoutMax;
-  __u8  DevSize;
-  __u16 InterfaceDesc;
-  __u16 MaxBufWriteSize;
-  __u8  NumEraseRegions;
-  __u32 EraseRegionInfo[0]; /* Not host ordered */
+	uint8_t  qry[3];
+	uint16_t P_ID;
+	uint16_t P_ADR;
+	uint16_t A_ID;
+	uint16_t A_ADR;
+	uint8_t  VccMin;
+	uint8_t  VccMax;
+	uint8_t  VppMin;
+	uint8_t  VppMax;
+	uint8_t  WordWriteTimeoutTyp;
+	uint8_t  BufWriteTimeoutTyp;
+	uint8_t  BlockEraseTimeoutTyp;
+	uint8_t  ChipEraseTimeoutTyp;
+	uint8_t  WordWriteTimeoutMax;
+	uint8_t  BufWriteTimeoutMax;
+	uint8_t  BlockEraseTimeoutMax;
+	uint8_t  ChipEraseTimeoutMax;
+	uint8_t  DevSize;
+	uint16_t InterfaceDesc;
+	uint16_t MaxBufWriteSize;
+	uint8_t  NumEraseRegions;
+	uint32_t EraseRegionInfo[0]; /* Not host ordered */
 } __attribute__((packed));
 
 /* Extended Query Structure for both PRI and ALT */
 
 struct cfi_extquery {
-  __u8  pri[3];
-  __u8  MajorVersion;
-  __u8  MinorVersion;
+	uint8_t  pri[3];
+	uint8_t  MajorVersion;
+	uint8_t  MinorVersion;
 } __attribute__((packed));
 
 /* Vendor-Specific PRI for Intel/Sharp Extended Command Set (0x0001) */
 
 struct cfi_pri_intelext {
-  __u8  pri[3];
-  __u8  MajorVersion;
-  __u8  MinorVersion;
-  __u32 FeatureSupport; /* if bit 31 is set then an additional __u32 feature
-			   block follows - FIXME - not currently supported */
-  __u8  SuspendCmdSupport;
-  __u16 BlkStatusRegMask;
-  __u8  VccOptimal;
-  __u8  VppOptimal;
-  __u8  NumProtectionFields;
-  __u16 ProtRegAddr;
-  __u8  FactProtRegSize;
-  __u8  UserProtRegSize;
+	uint8_t  pri[3];
+	uint8_t  MajorVersion;
+	uint8_t  MinorVersion;
+	uint32_t FeatureSupport; /* if bit 31 is set then an additional uint32_t feature
+				    block follows - FIXME - not currently supported */
+	uint8_t  SuspendCmdSupport;
+	uint16_t BlkStatusRegMask;
+	uint8_t  VccOptimal;
+	uint8_t  VppOptimal;
+	uint8_t  NumProtectionFields;
+	uint16_t ProtRegAddr;
+	uint8_t  FactProtRegSize;
+	uint8_t  UserProtRegSize;
 } __attribute__((packed));
 
 /* Vendor-Specific PRI for AMD/Fujitsu Extended Command Set (0x0002) */
 
 struct cfi_pri_amdstd {
-  __u8  pri[3];
-  __u8  MajorVersion;
-  __u8  MinorVersion;
-  __u8  SiliconRevision; /* bits 1-0: Address Sensitive Unlock */
-  __u8  EraseSuspend;
-  __u8  BlkProt;
-  __u8  TmpBlkUnprotect;
-  __u8  BlkProtUnprot;
-  __u8  SimultaneousOps;
-  __u8  BurstMode;
-  __u8  PageMode;
-  __u8  VppMin;
-  __u8  VppMax;
-  __u8  TopBottom;
+	uint8_t  pri[3];
+	uint8_t  MajorVersion;
+	uint8_t  MinorVersion;
+	uint8_t  SiliconRevision; /* bits 1-0: Address Sensitive Unlock */
+	uint8_t  EraseSuspend;
+	uint8_t  BlkProt;
+	uint8_t  TmpBlkUnprotect;
+	uint8_t  BlkProtUnprot;
+	uint8_t  SimultaneousOps;
+	uint8_t  BurstMode;
+	uint8_t  PageMode;
+	uint8_t  VppMin;
+	uint8_t  VppMax;
+	uint8_t  TopBottom;
 } __attribute__((packed));
 
 struct cfi_pri_query {
-  __u8  NumFields;
-  __u32 ProtField[1]; /* Not host ordered */
+	uint8_t  NumFields;
+	uint32_t ProtField[1]; /* Not host ordered */
 } __attribute__((packed));
 
 struct cfi_bri_query {
-  __u8  PageModeReadCap;
-  __u8  NumFields;
-  __u32 ConfField[1]; /* Not host ordered */
+	uint8_t  PageModeReadCap;
+	uint8_t  NumFields;
+	uint32_t ConfField[1]; /* Not host ordered */
 } __attribute__((packed));
 
 #define P_ID_NONE 0
@@ -319,7 +170,7 @@ struct cfi_bri_query {
 #define CFI_MODE_JEDEC	0
 
 struct cfi_private {
-	__u16 cmdset;
+	uint16_t cmdset;
 	void *cmdset_priv;
 	int interleave;
 	int device_type;
@@ -339,102 +190,78 @@ struct cfi_private {
 /*
  * Returns the command address according to the given geometry.
  */
-static inline __u32 cfi_build_cmd_addr(__u32 cmd_ofs, int interleave, int type)
+static inline uint32_t cfi_build_cmd_addr(uint32_t cmd_ofs, int interleave, int type)
 {
 	return (cmd_ofs * type) * interleave;
 }
 
 /*
- * Transforms the CFI command for the given geometry (bus width & interleave.
+ * Transforms the CFI command for the given geometry (bus width & interleave).
+ * It looks too long to be inline, but in the common case it should almost all
+ * get optimised away. 
  */
-static inline cfi_word cfi_build_cmd(u_char cmd, struct map_info *map, struct cfi_private *cfi)
+static inline map_word cfi_build_cmd(u_char cmd, struct map_info *map, struct cfi_private *cfi)
 {
-	cfi_word val = 0;
-
-	if (cfi_buswidth_is_1()) {
-		/* 1 x8 device */
-		val = cmd;
-	} else if (cfi_buswidth_is_2()) {
-		if (cfi_interleave_is_1()) {
-			/* 1 x16 device in x16 mode */
-			val = cpu_to_cfi16(cmd);
-		} else if (cfi_interleave_is_2()) {
-			/* 2 (x8, x16 or x32) devices in x8 mode */
-			val = cpu_to_cfi16((cmd << 8) | cmd);
-		}
-	} else if (cfi_buswidth_is_4()) {
-		if (cfi_interleave_is_1()) {
-			/* 1 x32 device in x32 mode */
-			val = cpu_to_cfi32(cmd);
-		} else if (cfi_interleave_is_2()) {
-			/* 2 x16 device in x16 mode */
-			val = cpu_to_cfi32((cmd << 16) | cmd);
-		} else if (cfi_interleave_is_4()) {
-			/* 4 (x8, x16 or x32) devices in x8 mode */
-			val = (cmd << 16) | cmd;
-			val = cpu_to_cfi32((val << 8) | val);
-		}
-#ifdef CFI_WORD_64
-	} else if (cfi_buswidth_is_8()) {
-		if (cfi_interleave_is_1()) {
-			/* 1 x64 device in x64 mode */
-			val = cpu_to_cfi64(cmd);
-		} else if (cfi_interleave_is_2()) {
-			/* 2 x32 device in x32 mode */
-			val = cmd;
-			val = cpu_to_cfi64((val << 32) | val);
-		} else if (cfi_interleave_is_4()) {
-			/* 4 (x16, x32 or x64) devices in x16 mode */
-			val = (cmd << 16) | cmd;
-			val = cpu_to_cfi64((val << 32) | val);
-		} else if (cfi_interleave_is_8()) {
-			/* 8 (x8, x16 or x32) devices in x8 mode */
-			val = (cmd << 8) | cmd;
-			val = (val << 16) | val;
-			val = (val << 32) | val;
-			val = cpu_to_cfi64(val);
-		}
-#endif /* CFI_WORD_64 */
-	}
-	return val;
-}
-#define CMD(x)  cfi_build_cmd((x), map, cfi)
-
-/*
- * Read a value according to the bus width.
- */
-
-static inline cfi_word cfi_read(struct map_info *map, __u32 addr)
-{
-	if (cfi_buswidth_is_1()) {
-		return map_read8(map, addr);
-	} else if (cfi_buswidth_is_2()) {
-		return map_read16(map, addr);
-	} else if (cfi_buswidth_is_4()) {
-		return map_read32(map, addr);
-	} else if (cfi_buswidth_is_8()) {
-		return map_read64(map, addr);
+	map_word val = { {0} };
+	int wordwidth, words_per_bus, chip_mode, chips_per_word;
+	unsigned long onecmd;
+	int i;
+
+	/* We do it this way to give the compiler a fighting chance 
+	   of optimising away all the crap for 'bankwidth' larger than
+	   an unsigned long, in the common case where that support is
+	   disabled */
+	if (map_bankwidth_is_large(map)) {
+		wordwidth = sizeof(unsigned long);
+		words_per_bus = (map_bankwidth(map)) / wordwidth; // i.e. normally 1
 	} else {
-		return 0;
+		wordwidth = map_bankwidth(map);
+		words_per_bus = 1;
+	}
+	
+	chip_mode = map_bankwidth(map) / cfi_interleave(cfi);
+	chips_per_word = wordwidth * cfi_interleave(cfi) / map_bankwidth(map);
+
+	/* First, determine what the bit-pattern should be for a single
+	   device, according to chip mode and endianness... */
+	switch (chip_mode) {
+	default: BUG();
+	case 1:
+		onecmd = cmd;
+		break;
+	case 2:
+		onecmd = cpu_to_cfi16(cmd);
+		break;
+	case 4:
+		onecmd = cpu_to_cfi32(cmd);
+		break;
 	}
-}
 
-/*
- * Write a value according to the bus width.
- */
+	/* Now replicate it across the size of an unsigned long, or 
+	   just to the bus width as appropriate */
+	switch (chips_per_word) {
+	default: BUG();
+#if BITS_PER_LONG >= 64
+	case 8:
+		onecmd |= (onecmd << (chip_mode * 32));
+#endif
+	case 4:
+		onecmd |= (onecmd << (chip_mode * 16));
+	case 2:
+		onecmd |= (onecmd << (chip_mode * 8));
+	case 1:
+		;
+	}
 
-static inline void cfi_write(struct map_info *map, cfi_word val, __u32 addr)
-{
-	if (cfi_buswidth_is_1()) {
-		map_write8(map, val, addr);
-	} else if (cfi_buswidth_is_2()) {
-		map_write16(map, val, addr);
-	} else if (cfi_buswidth_is_4()) {
-		map_write32(map, val, addr);
-	} else if (cfi_buswidth_is_8()) {
-		map_write64(map, val, addr);
+	/* And finally, for the multi-word case, replicate it 
+	   in all words in the structure */
+	for (i=0; i < words_per_bus; i++) {
+		val.x[i] = onecmd;
 	}
+
+	return val;
 }
+#define CMD(x)  cfi_build_cmd((x), map, cfi)
 
 /*
  * Sends a CFI command to a bank of flash for the given geometry.
@@ -443,35 +270,36 @@ static inline void cfi_write(struct map_
  * If prev_val is non-null, it will be set to the value at the command address,
  * before the command was written.
  */
-static inline __u32 cfi_send_gen_cmd(u_char cmd, __u32 cmd_addr, __u32 base,
+static inline uint32_t cfi_send_gen_cmd(u_char cmd, uint32_t cmd_addr, uint32_t base,
 				struct map_info *map, struct cfi_private *cfi,
-				int type, cfi_word *prev_val)
+				int type, map_word *prev_val)
 {
-	cfi_word val;
-	__u32 addr = base + cfi_build_cmd_addr(cmd_addr, CFIDEV_INTERLEAVE, type);
+	map_word val;
+	uint32_t addr = base + cfi_build_cmd_addr(cmd_addr, cfi_interleave(cfi), type);
 
 	val = cfi_build_cmd(cmd, map, cfi);
 
 	if (prev_val)
-		*prev_val = cfi_read(map, addr);
+		*prev_val = map_read(map, addr);
 
-	cfi_write(map, val, addr);
+	map_write(map, val, addr);
 
 	return addr - base;
 }
 
-static inline __u8 cfi_read_query(struct map_info *map, __u32 addr)
+static inline uint8_t cfi_read_query(struct map_info *map, uint32_t addr)
 {
-	if (cfi_buswidth_is_1()) {
-		return map_read8(map, addr);
-	} else if (cfi_buswidth_is_2()) {
-		return cfi16_to_cpu(map_read16(map, addr));
-	} else if (cfi_buswidth_is_4()) {
-		return cfi32_to_cpu(map_read32(map, addr));
-	} else if (cfi_buswidth_is_8()) {
-		return cfi64_to_cpu(map_read64(map, addr));
+	map_word val = map_read(map, addr);
+
+	if (map_bankwidth_is_1(map)) {
+		return val.x[0];
+	} else if (map_bankwidth_is_2(map)) {
+		return cfi16_to_cpu(val.x[0]);
 	} else {
-		return 0;
+		/* No point in a 64-bit byteswap since that would just be
+		   swapping the responses from different chips, and we are
+		   only interested in one chip (a representative sample) */
+		return cfi32_to_cpu(val.x[0]);
 	}
 }
 
@@ -499,12 +327,12 @@ static inline void cfi_spin_unlock(spinl
 	spin_unlock_bh(mutex);
 }
 
-struct cfi_extquery *cfi_read_pri(struct map_info *map, __u16 adr, __u16 size,
+struct cfi_extquery *cfi_read_pri(struct map_info *map, uint16_t adr, uint16_t size,
 			     const char* name);
 
 struct cfi_fixup {
-	__u16 mfr;
-	__u16 id;
+	uint16_t mfr;
+	uint16_t id;
 	void (*fixup)(struct map_info *map, void* param);
 	void* param;
 };
Index: include/linux/mtd/map.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/map.h,v
retrieving revision 1.37
diff -u -p -r1.37 map.h
--- include/linux/mtd/map.h	3 Jun 2004 04:10:22 -0000	1.37
+++ include/linux/mtd/map.h	8 Jul 2004 15:23:06 -0000
@@ -11,14 +11,104 @@
 #include <asm/system.h>
 #include <asm/io.h>
 
+#ifdef CONFIG_MTD_MAP_BANK_WIDTH_1
+#define map_bankwidth(map) 1
+#define map_bankwidth_is_1(map) (map_bankwidth(map) == 1)
+#define MAX_MAP_BANKWIDTH 1
+#else
+#define map_bankwidth_is_1(map) (0)
+#endif
+
+#ifdef CONFIG_MTD_MAP_BANK_WIDTH_2
+# ifdef map_bankwidth
+#  undef map_bankwidth
+#  define map_bankwidth(map) ((map)->bankwidth)
+# else
+#  define map_bankwidth(map) 2
+# endif
+#define map_bankwidth_is_2(map) (map_bankwidth(map) == 2)
+#undef MAX_MAP_BANKWIDTH
+#define MAX_MAP_BANKWIDTH 2
+#else
+#define map_bankwidth_is_2(map) (0)
+#endif
+
+#ifdef CONFIG_MTD_MAP_BANK_WIDTH_4
+# ifdef map_bankwidth
+#  undef map_bankwidth
+#  define map_bankwidth(map) ((map)->bankwidth)
+# else
+#  define map_bankwidth(map) 4
+# endif
+#define map_bankwidth_is_4(map) (map_bankwidth(map) == 4)
+#undef MAX_MAP_BANKWIDTH
+#define MAX_MAP_BANKWIDTH 4
+#else
+#define map_bankwidth_is_4(map) (0)
+#endif
+
+#ifdef CONFIG_MTD_MAP_BANK_WIDTH_8
+# ifdef map_bankwidth
+#  undef map_bankwidth
+#  define map_bankwidth(map) ((map)->bankwidth)
+# else
+#  define map_bankwidth(map) 8
+# endif
+#define map_bankwidth_is_8(map) (map_bankwidth(map) == 8)
+#undef MAX_MAP_BANKWIDTH
+#define MAX_MAP_BANKWIDTH 8
+#else
+#define map_bankwidth_is_8(map) (0)
+#endif
+
+#ifdef CONFIG_MTD_MAP_BANK_WIDTH_16
+# ifdef map_bankwidth
+#  undef map_bankwidth
+#  define map_bankwidth(map) ((map)->bankwidth)
+# else
+#  define map_bankwidth(map) 16
+# endif
+#define map_bankwidth_is_16(map) (map_bankwidth(map) == 16)
+#undef MAX_MAP_BANKWIDTH
+#define MAX_MAP_BANKWIDTH 16
+#else
+#define map_bankwidth_is_16(map) (0)
+#endif
+
+#ifdef CONFIG_MTD_MAP_BANK_WIDTH_32
+# ifdef map_bankwidth
+#  undef map_bankwidth
+#  define map_bankwidth(map) ((map)->bankwidth)
+# else
+#  define map_bankwidth(map) 32
+# endif
+#define map_bankwidth_is_32(map) (map_bankwidth(map) == 32)
+#undef MAX_MAP_BANKWIDTH
+#define MAX_MAP_BANKWIDTH 32
+#else
+#define map_bankwidth_is_32(map) (0)
+#endif
+
+#ifndef map_bankwidth
+#error "No bus width supported. What's the point?"
+#endif
+
+#if MAX_MAP_BANKWIDTH > (BITS_PER_LONG / 8)
+#define map_bankwidth_is_large(map) (map_bankwidth(map) > BITS_PER_LONG/8)
+#else
+#define map_bankwidth_is_large(map) (0)
+#endif
+
 /* The map stuff is very simple. You fill in your struct map_info with
    a handful of routines for accessing the device, making sure they handle
    paging etc. correctly if your device needs it. Then you pass it off
-   to a chip driver which deals with a mapped device - generally either
-   do_cfi_probe() or do_ram_probe(), either of which will return a 
-   struct mtd_info if they liked what they saw. At which point, you
-   fill in the mtd->module with your own module address, and register 
-   it.
+   to a chip probe routine -- either JEDEC or CFI probe or both -- via
+   do_map_probe(). If a chip is recognised, the probe code will invoke the
+   appropriate chip driver (if present) and return a struct mtd_info.
+   At which point, you fill in the mtd->module with your own module 
+   address, and register it with the MTD core code. Or you could partition
+   it and register the partitions instead, or keep it for your own private
+   use; whatever.
    
    The mtd->priv field will point to the struct map_info, and any further
    private data required by the chip driver is linked from the 
@@ -36,23 +126,16 @@ struct map_info {
 	unsigned long virt;
 	void *cached;
 
-	int buswidth; /* in octets */
+	int bankwidth; /* in octets. This isn't necessarily the width
+		       of actual bus cycles -- it's the repeat interval
+		      in bytes, before you are talking to the first chip again.
+		      */
 
 #ifdef CONFIG_MTD_COMPLEX_MAPPINGS
-	u8 (*read8)(struct map_info *, unsigned long);
-	u16 (*read16)(struct map_info *, unsigned long);
-	u32 (*read32)(struct map_info *, unsigned long);  
-	u64 (*read64)(struct map_info *, unsigned long);  
-	/* If it returned a 'long' I'd call it readl.
-	 * It doesn't.
-	 * I won't.
-	 * dwmw2 */
-	
+	struct map_word (*read)(struct map_info *, unsigned long);
 	void (*copy_from)(struct map_info *, void *, unsigned long, ssize_t);
-	void (*write8)(struct map_info *, u8, unsigned long);
-	void (*write16)(struct map_info *, u16, unsigned long);
-	void (*write32)(struct map_info *, u32, unsigned long);
-	void (*write64)(struct map_info *, u64, unsigned long);
+
+	void (*write)(struct map_info *, struct map_word, unsigned long);
 	void (*copy_to)(struct map_info *, unsigned long, const void *, ssize_t);
 
 	/* We can perhaps put in 'point' and 'unpoint' methods, if we really
@@ -96,76 +179,60 @@ void map_destroy(struct mtd_info *mtd);
 #define INVALIDATE_CACHED_RANGE(map, from, size) \
 	do { if(map->inval_cache) map->inval_cache(map, from, size); } while(0)
 
-#ifdef CONFIG_MTD_COMPLEX_MAPPINGS
-#define map_read8(map, ofs) (map)->read8(map, ofs)
-#define map_read16(map, ofs) (map)->read16(map, ofs)
-#define map_read32(map, ofs) (map)->read32(map, ofs)
-#define map_read64(map, ofs) (map)->read64(map, ofs)
-#define map_copy_from(map, to, from, len) (map)->copy_from(map, to, from, len)
-#define map_write8(map, datum, ofs) (map)->write8(map, datum, ofs)
-#define map_write16(map, datum, ofs) (map)->write16(map, datum, ofs)
-#define map_write32(map, datum, ofs) (map)->write32(map, datum, ofs)
-#define map_write64(map, datum, ofs) (map)->write64(map, datum, ofs)
-#define map_copy_to(map, to, from, len) (map)->copy_to(map, to, from, len)
+#define MAX_MAP_LONGS ( ((MAX_MAP_BANKWIDTH*8) + BITS_PER_LONG - 1) / BITS_PER_LONG )
 
-extern void simple_map_init(struct map_info *);
-#define map_is_linear(map) (map->phys != NO_XIP)
+typedef struct {
+	unsigned long x[MAX_MAP_LONGS];
+} map_word;
 
-#else
-static inline u8 map_read8(struct map_info *map, unsigned long ofs)
+static inline int map_word_equal(map_word val1, map_word val2)
 {
-	return __raw_readb(map->virt + ofs);
+	int i;
+	for (i=0; i<MAX_MAP_LONGS; i++) {
+		if (val1.x[i] != val2.x[i])
+			return 0;
+	}
+	return 1;
 }
 
-static inline u16 map_read16(struct map_info *map, unsigned long ofs)
+static inline map_word inline_map_read(struct map_info *map, unsigned long ofs)
 {
-	return __raw_readw(map->virt + ofs);
-}
-
-static inline u32 map_read32(struct map_info *map, unsigned long ofs)
-{
-	return __raw_readl(map->virt + ofs);
-}
+	map_word r;
 
-static inline u64 map_read64(struct map_info *map, unsigned long ofs)
-{
-#ifndef CONFIG_MTD_CFI_B8 /* 64-bit mappings */
-	BUG();
-	return 0;
-#else
-	return __raw_readq(map->virt + ofs);
+	if (map_bankwidth_is_1(map))
+		r.x[0] = __raw_readb(map->virt + ofs);
+	else if (map_bankwidth_is_2(map))
+		r.x[0] = __raw_readw(map->virt + ofs);
+	else if (map_bankwidth_is_4(map))
+		r.x[0] = __raw_readl(map->virt + ofs);
+#if BITS_PER_LONG >= 64
+	else if (map_bankwidth_is_8(map))
+		r.x[0] = __raw_readq(map->virt + ofs);
 #endif
-}
+	else if (map_bankwidth_is_large(map))
+		memcpy_fromio(r.x, map->virt+ofs, map->bankwidth/8);
 
-static inline void map_write8(struct map_info *map, u8 datum, unsigned long ofs)
-{
-	__raw_writeb(datum, map->virt + ofs);
-	mb();
+	return r;
 }
 
-static inline void map_write16(struct map_info *map, u16 datum, unsigned long ofs)
+static inline void inline_map_write(struct map_info *map, const map_word datum, unsigned long ofs)
 {
-	__raw_writew(datum, map->virt + ofs);
-	mb();
-}
-
-static inline void map_write32(struct map_info *map, u32 datum, unsigned long ofs)
-{
-	__raw_writel(datum, map->virt + ofs);
-	mb();
-}
-
-static inline void map_write64(struct map_info *map, u64 datum, unsigned long ofs)
-{
-#ifndef CONFIG_MTD_CFI_B8 /* 64-bit mappings */
-	BUG();
-#else
-	__raw_writeq(datum, map->virt + ofs);
+	if (map_bankwidth_is_1(map))
+		__raw_writeb(datum.x[0], map->virt + ofs);
+	else if (map_bankwidth_is_2(map))
+		__raw_writew(datum.x[0], map->virt + ofs);
+	else if (map_bankwidth_is_4(map))
+		__raw_writel(datum.x[0], map->virt + ofs);
+#if BITS_PER_LONG >= 64
+	else if (map_bankwidth_is_8(map))
+		__raw_writeq(datum.x[0], map->virt + ofs);
+#endif
+	else if (map_bankwidth_is_large(map))
+		memcpy_toio(map->virt+ofs, datum.x, map->bankwidth/8);
 	mb();
-#endif /* CFI_B8 */
 }
 
-static inline void map_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
+static inline void inline_map_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
 {
 	if (map->cached)
 		memcpy(to, (char *)map->cached + from, len);
@@ -173,11 +240,27 @@ static inline void map_copy_from(struct 
 		memcpy_fromio(to, map->virt + from, len);
 }
 
-static inline void map_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
+static inline void inline_map_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
 {
 	memcpy_toio(map->virt + to, from, len);
 }
 
+#ifdef CONFIG_MTD_COMPLEX_MAPPINGS
+#define map_read(map, ofs) (map)->read(map, ofs)
+#define map_copy_from(map, to, from, len) (map)->copy_from(map, to, from, len)
+#define map_write(map, datum, ofs) (map)->write(map, datum, ofs)
+#define map_copy_to(map, to, from, len) (map)->copy_to(map, to, from, len)
+
+extern void simple_map_init(struct map_info *);
+#define map_is_linear(map) (map->phys != NO_XIP)
+
+#else
+#define map_read(map, ofs) inline_map_read(map, ofs)
+#define map_copy_from(map, to, from, len) inline_map_copy_from(map, to, from, len)
+#define map_write(map, datum, ofs) inline_map_write(map, datum, ofs)
+#define map_copy_to(map, to, from, len) inline_map_copy_to(map, to, from, len)
+
+
 #define simple_map_init(map) do { } while (0)
 #define map_is_linear(map) (1)
 


-- 
dwmw2
