Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sYAK-0005Qi-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 23:53:44 +0100
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14sYAH-0005Qc-00
	for mtd@infradead.org; Wed, 25 Apr 2001 23:53:41 +0100
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: <mtd@infradead.org>
Subject: New board patch
Date: Thu, 26 Apr 2001 00:54:04 +0200
Message-ID: <BKEKLBIBFPNGJKJDEODFAENLEIAA.schirmer@taytron.net>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0005_01C0CDEB.63EE1590"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C0CDEB.63EE1590
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi folks,

can someone please commit the following patch to the cvs tree?

Changes:

- New board (Dbox2)
- (faked) support for Intel Std command set (kernel option)

Thanks a lot!
   Florian Schirmer
------=_NextPart_000_0005_01C0CDEB.63EE1590
Content-Type: application/octet-stream;
	name="mtd-dbox2.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mtd-dbox2.diff"

diff -Naur mtd-cvs/drivers/mtd/chips/Config.in =
mtd/drivers/mtd/chips/Config.in=0A=
--- mtd-cvs/drivers/mtd/chips/Config.in	Fri Apr 20 17:27:37 2001=0A=
+++ mtd/drivers/mtd/chips/Config.in	Wed Apr 25 23:23:22 2001=0A=
@@ -28,6 +28,9 @@=0A=
   fi=0A=
 fi=0A=
 dep_tristate '    CFI support for Intel/Sharp Extended Commands' =
CONFIG_MTD_CFI_INTELEXT $CONFIG_MTD_CFI=0A=
+if [ "$CONFIG_MTD_CFI_INTELEXT" =3D "y" -o  "$CONFIG_MTD_CFI_INTELEXT" =
=3D "m" ]; then=0A=
+   bool '       CFI support for Intel/Sharp Standard Commands' =
CONFIG_MTD_CFI_INTELSTD=0A=
+fi=0A=
 dep_tristate '    CFI support for AMD/Fujitsu Standard Commands' =
CONFIG_MTD_CFI_AMDSTD $CONFIG_MTD_CFI=0A=
 dep_tristate '  AMD compatible flash chip support (non-CFI)' =
CONFIG_MTD_AMDSTD $CONFIG_MTD=0A=
 dep_tristate '  pre-CFI Sharp chip support' CONFIG_MTD_SHARP $CONFIG_MTD=0A=
diff -Naur mtd-cvs/drivers/mtd/chips/cfi_probe.c =
mtd/drivers/mtd/chips/cfi_probe.c=0A=
--- mtd-cvs/drivers/mtd/chips/cfi_probe.c	Wed Apr 25 18:22:52 2001=0A=
+++ mtd/drivers/mtd/chips/cfi_probe.c	Wed Apr 25 23:18:41 2001=0A=
@@ -364,6 +364,12 @@=0A=
 =0A=
 		/* Do any necessary byteswapping */=0A=
 		cfi.cfiq->P_ID =3D le16_to_cpu(cfi.cfiq->P_ID);=0A=
+=0A=
+#ifdef CONFIG_MTD_CFI_INTELSTD=0A=
+    		if (cfi.cfiq->P_ID =3D=3D P_ID_INTEL_STD)=0A=
+			cfi.cfiq->P_ID =3D P_ID_INTEL_EXT;=0A=
+#endif=0A=
+=0A=
 		cfi.cfiq->P_ADR =3D le16_to_cpu(cfi.cfiq->P_ADR);=0A=
 		cfi.cfiq->A_ID =3D le16_to_cpu(cfi.cfiq->A_ID);=0A=
 		cfi.cfiq->A_ADR =3D le16_to_cpu(cfi.cfiq->A_ADR);=0A=
diff -Naur mtd-cvs/drivers/mtd/maps/Config.in =
mtd/drivers/mtd/maps/Config.in=0A=
--- mtd-cvs/drivers/mtd/maps/Config.in	Tue Apr 24 20:57:25 2001=0A=
+++ mtd/drivers/mtd/maps/Config.in	Wed Apr 25 23:24:26 2001=0A=
@@ -24,6 +24,7 @@=0A=
    dep_bool '    Support for RedBoot Partition tables on SA11x0' =
CONFIG_MTD_SA1100_REDBOOT_PARTITIONS $CONFIG_MTD_SA1100 =
$CONFIG_MTD_REDBOOT_PARTS=0A=
 dep_tristate '  CFI Flash device mapped on DC21285 Footbridge' =
CONFIG_MTD_DC21285 $CONFIG_MTD_CFI $CONFIG_ARCH_FOOTBRIDGE =
$CONFIG_MTD_PARTITIONS=0A=
 dep_tristate '  CFI Flash device mapped on the XScale IQ80310 board' =
CONFIG_MTD_IQ80310 $CONFIG_MTD_CFI $CONFIG_XSCALE_IQ80310=0A=
+dep_tristate '  CFI Flash device mapped on D-Box2' CONFIG_MTD_DBOX2 =
$CONFIG_MTD_CFI_INTELSTD $CONFIG_MTD_CFI_INTELEXT $CONFIG_MTD_CFI_AMDSTD=0A=
 dep_tristate '  CFI and JEDEC Flash device mapping on custom board' =
CONFIG_MTD_CSTM_MIPS_IXX $CONFIG_MTD_CFI $CONFIG_MTD_JEDEC =
$CONFIG_MTD_PARTITIONS =0A=
 if [ "$CONFIG_MTD_CSTM_MIPS_IXX" =3D "y" -o "$CONFIG_MTD_CSTM_MIPS_IXX" =
=3D "m" ]; then=0A=
    hex '    Physical start address of flash mapping' =
CONFIG_MTD_CSTM_MIPS_IXX_START 0x8000000=0A=
diff -Naur mtd-cvs/drivers/mtd/maps/GNUmakefile =
mtd/drivers/mtd/maps/GNUmakefile=0A=
--- mtd-cvs/drivers/mtd/maps/GNUmakefile	Tue Apr 24 20:58:26 2001=0A=
+++ mtd/drivers/mtd/maps/GNUmakefile	Wed Apr 25 23:20:18 2001=0A=
@@ -20,6 +20,7 @@=0A=
 CONFIG_MTD_SC520CDP :=3D m=0A=
 # CONFIG_MTD_SUN_UFLASH :=3D m=0A=
 CONFIG_MTD_VMAX :=3D m=0A=
+CONFIG_MTD_DBOX2 :=3D m=0A=
 =0A=
 CFLAGS_physmap.o :=3D -DCONFIG_MTD_PHYSMAP_START=3D0x8000000 =
-DCONFIG_MTD_PHYSMAP_LEN=3D0x4000000 -DCONFIG_MTD_PHYSMAP_BUSWIDTH=3D2=0A=
 =0A=
diff -Naur mtd-cvs/drivers/mtd/maps/Makefile =
mtd/drivers/mtd/maps/Makefile=0A=
--- mtd-cvs/drivers/mtd/maps/Makefile	Tue Apr 24 20:55:31 2001=0A=
+++ mtd/drivers/mtd/maps/Makefile	Wed Apr 25 23:19:44 2001=0A=
@@ -22,5 +22,6 @@=0A=
 obj-$(CONFIG_MTD_SC520CDP)	+=3D sc520cdp.o=0A=
 obj-$(CONFIG_MTD_SUN_UFLASH)    +=3D sun_uflash.o=0A=
 obj-$(CONFIG_MTD_VMAX)		+=3D vmax301.o=0A=
+obj-$(CONFIG_MTD_DBOX2)		+=3D dbox2-flash.o=0A=
 =0A=
 include $(TOPDIR)/Rules.make=0A=
diff -Naur mtd-cvs/drivers/mtd/maps/dbox2-flash.c =
mtd/drivers/mtd/maps/dbox2-flash.c=0A=
--- mtd-cvs/drivers/mtd/maps/dbox2-flash.c	Thu Jan  1 01:00:00 1970=0A=
+++ mtd/drivers/mtd/maps/dbox2-flash.c	Wed Apr 25 23:39:45 2001=0A=
@@ -0,0 +1,151 @@=0A=
+/*=0A=
+ * $Id: dbox2-flash.c,v 1.11 2001/03/17 19:08:45 dwmw2 Exp $=0A=
+ *=0A=
+ * Nokia / Sagem D-Box 2 flash driver=0A=
+ */=0A=
+=0A=
+#include <linux/module.h>=0A=
+#include <linux/types.h>=0A=
+#include <linux/kernel.h>=0A=
+#include <asm/io.h>=0A=
+#include <linux/mtd/mtd.h>=0A=
+#include <linux/mtd/map.h>=0A=
+#include <linux/mtd/partitions.h>=0A=
+#include <linux/config.h>=0A=
+=0A=
+/* partition_info gives details on the logical partitions that the =
split the=0A=
+ * single flash device into. If the size if zero we use up to the end =
of the=0A=
+ * device. */=0A=
+const static struct mtd_partition partition_info[]=3D {{name: "BR =
bootloader",		// raw=0A=
+						      size: 128 * 1024, =0A=
+						      offset: 0,                  =0A=
+						      mask_flags: MTD_WRITEABLE},=0A=
+                                                     {name: "PPC =
bootloader",		// flfs=0A=
+						      size: 128 * 1024, =0A=
+						      offset: MTDPART_OFS_APPEND, =0A=
+						      mask_flags: 0},=0A=
+                                                     {name: "Kernel",			=
// idxfs=0A=
+						      size: 768 * 1024, =0A=
+						      offset: MTDPART_OFS_APPEND, =0A=
+						      mask_flags: 0},=0A=
+                                                     {name: "System",			=
// jffs=0A=
+						      size: MTDPART_SIZ_FULL, =0A=
+						      offset: MTDPART_OFS_APPEND, =0A=
+						      mask_flags: 0}};=0A=
+=0A=
+#define NUM_PARTITIONS (sizeof(partition_info) / =
sizeof(partition_info[0]))=0A=
+=0A=
+#define WINDOW_ADDR 0x10000000=0A=
+#define WINDOW_SIZE 0x800000=0A=
+=0A=
+static struct mtd_info *mymtd;=0A=
+=0A=
+__u8 dbox2_flash_read8(struct map_info *map, unsigned long ofs)=0A=
+{=0A=
+	return __raw_readb(map->map_priv_1 + ofs);=0A=
+}=0A=
+=0A=
+__u16 dbox2_flash_read16(struct map_info *map, unsigned long ofs)=0A=
+{=0A=
+	return __raw_readw(map->map_priv_1 + ofs);=0A=
+}=0A=
+=0A=
+__u32 dbox2_flash_read32(struct map_info *map, unsigned long ofs)=0A=
+{=0A=
+	return __raw_readl(map->map_priv_1 + ofs);=0A=
+}=0A=
+=0A=
+void dbox2_flash_copy_from(struct map_info *map, void *to, unsigned =
long from, ssize_t len)=0A=
+{=0A=
+	memcpy_fromio(to, map->map_priv_1 + from, len);=0A=
+}=0A=
+=0A=
+void dbox2_flash_write8(struct map_info *map, __u8 d, unsigned long adr)=0A=
+{=0A=
+	__raw_writeb(d, map->map_priv_1 + adr);=0A=
+	mb();=0A=
+}=0A=
+=0A=
+void dbox2_flash_write16(struct map_info *map, __u16 d, unsigned long =
adr)=0A=
+{=0A=
+	__raw_writew(d, map->map_priv_1 + adr);=0A=
+	mb();=0A=
+}=0A=
+=0A=
+void dbox2_flash_write32(struct map_info *map, __u32 d, unsigned long =
adr)=0A=
+{=0A=
+	__raw_writel(d, map->map_priv_1 + adr);=0A=
+	mb();=0A=
+}=0A=
+=0A=
+void dbox2_flash_copy_to(struct map_info *map, unsigned long to, const =
void *from, ssize_t len)=0A=
+{=0A=
+	memcpy_toio(map->map_priv_1 + to, from, len);=0A=
+}=0A=
+=0A=
+struct map_info dbox2_flash_map =3D {=0A=
+	name: "D-Box 2 flash memory",=0A=
+	size: WINDOW_SIZE,=0A=
+	buswidth: 4,=0A=
+	read8: dbox2_flash_read8,=0A=
+	read16: dbox2_flash_read16,=0A=
+	read32: dbox2_flash_read32,=0A=
+	copy_from: dbox2_flash_copy_from,=0A=
+	write8: dbox2_flash_write8,=0A=
+	write16: dbox2_flash_write16,=0A=
+	write32: dbox2_flash_write32,=0A=
+	copy_to: dbox2_flash_copy_to=0A=
+};=0A=
+=0A=
+#if LINUX_VERSION_CODE < 0x20212 && defined(MODULE)=0A=
+#define init_dbox2_flash init_module=0A=
+#define cleanup_dbox2_flash cleanup_module=0A=
+#endif=0A=
+=0A=
+mod_init_t init_dbox2_flash(void)=0A=
+{=0A=
+       	printk(KERN_NOTICE "D-Box 2 flash driver (size->0x%X =
mem->0x%X)\n", WINDOW_SIZE, WINDOW_ADDR);=0A=
+	dbox2_flash_map.map_priv_1 =3D (unsigned long)ioremap(WINDOW_ADDR, =
WINDOW_SIZE);=0A=
+=0A=
+	if (!dbox2_flash_map.map_priv_1) {=0A=
+		printk("Failed to ioremap\n");=0A=
+		return -EIO;=0A=
+	}=0A=
+=0A=
+	// Probe for dual Intel 28F320 or dual AMD=0A=
+	mymtd =3D do_cfi_probe(&dbox2_flash_map);=0A=
+	if (!mymtd) {=0A=
+	    // Probe for single Intel 28F640=0A=
+	    dbox2_flash_map.buswidth =3D 2;=0A=
+	=0A=
+	    mymtd =3D do_cfi_probe(&dbox2_flash_map);=0A=
+	}=0A=
+	    =0A=
+	if (mymtd) {=0A=
+		mymtd->module =3D THIS_MODULE;=0A=
+=0A=
+                /* Create MTD devices for each partition. */=0A=
+	        add_mtd_partitions(mymtd, partition_info, NUM_PARTITIONS);=0A=
+		=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	iounmap((void *)dbox2_flash_map.map_priv_1);=0A=
+	return -ENXIO;=0A=
+}=0A=
+=0A=
+mod_exit_t cleanup_dbox2_flash(void)=0A=
+{=0A=
+	if (mymtd) {=0A=
+		del_mtd_partitions(mymtd);=0A=
+		map_destroy(mymtd);=0A=
+	}=0A=
+	if (dbox2_flash_map.map_priv_1) {=0A=
+		iounmap((void *)dbox2_flash_map.map_priv_1);=0A=
+		dbox2_flash_map.map_priv_1 =3D 0;=0A=
+	}=0A=
+}=0A=
+=0A=
+module_init(init_dbox2_flash);=0A=
+module_exit(cleanup_dbox2_flash);=0A=
+=0A=

------=_NextPart_000_0005_01C0CDEB.63EE1590--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
