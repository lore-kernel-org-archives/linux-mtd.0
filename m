Received: from proxy.force.de ([158.116.254.130])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18P0yA-0002Vj-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2002 13:44:10 +0000
Received: from ex-deu-munich02.force.de (ex-deu-munich02.force.de [10.254.2.10])
	by proxy.force.de (8.11.4/8.11.4) with ESMTP id gBJEEpS15581
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2002 15:14:52 +0100 (MET)
Message-ID: <9CFB9DA5261CD611A29B00508B789048380AC4@ex-deu-munich02.force.de>
From: "Gettert, Wolfram" <Wolfram.Gettert@fci.com>
To: "Linux MTD (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Mapping driver + MT28F0083B 
Date: Thu, 19 Dec 2002 15:15:08 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C2A769.08DA15B0"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C2A769.08DA15B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hallo,
this is a patch against CVS snapshot-20021217 for a mapping driver for =
the
CPCI-735/736.

It's the mapping driver and an additional flash in jedec_table[]. Would =
be
great to integrate that into the CVS.
I tested this with a 2.2.18 kernel.

Is there anything else todo? It's my first patch send to mailing list.

Wolfram

--
Wolfram Gettert
Software Engineer=20
Force Computers GmbH
- A Solectron Company -
Lilienthalstr. 15=20
D-85579 Neubiberg/M=FCnchen
Wolfram.Gettert_at_fci.com
www.forcecomputers.com
 <<snapshot-20021217-mtd.diff>>=20

------_=_NextPart_000_01C2A769.08DA15B0
Content-Type: application/octet-stream;
	name="snapshot-20021217-mtd.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="snapshot-20021217-mtd.diff"

diff -urN --exclude=3DCVS =
snapshots20021217/mtd/drivers/mtd/chips/jedec_probe.c =
snapshots20021217/mtd-735/drivers/mtd/chips/jedec_probe.c
--- snapshots20021217/mtd/drivers/mtd/chips/jedec_probe.c	2002-11-13 =
00:00:06.000000000 +0100
+++ snapshots20021217/mtd-735/drivers/mtd/chips/jedec_probe.c	=
2002-12-19 12:29:27.000000000 +0100
@@ -93,6 +93,10 @@
 #define MX29F004T	0x0045
 #define MX29F004B	0x0046
=20
+/* Micron */
+#define MT28F800B3T	0x889c
+#define MT28F800B3B	0x889D
+
 /* ST - www.st.com */
 #define M29W800T	0x00D7
 #define M29W160DT	0x22C4
@@ -612,7 +616,33 @@
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x10000,16),
 		}
-	}, {
+    }, {
+		mfr_id: MANUFACTURER_INTEL,
+		dev_id: MT28F800B3T,
+		name: "Micron MT28F800B3T",
+		DevSize: SIZE_1MiB,
+		CmdSet: P_ID_INTEL_STD,
+		NumEraseRegions: 4,
+		regions: {
+			  ERASEINFO(0x20000,7),
+			  ERASEINFO(0x18000,1),
+			  ERASEINFO(0x02000,2),
+			  ERASEINFO(0x04000,1),
+		}
+    }, {
+		mfr_id: MANUFACTURER_INTEL,
+		dev_id: MT28F800B3B,
+		name: "Micron MT28F800B3B",
+		DevSize: SIZE_1MiB,
+		CmdSet: P_ID_INTEL_STD,
+		NumEraseRegions: 4,
+		regions: {
+			  ERASEINFO(0x04000,1),
+			  ERASEINFO(0x02000,2),
+			  ERASEINFO(0x18000,1),
+			  ERASEINFO(0x20000,2),
+		}
+    }, {
 		mfr_id: MANUFACTURER_ST,
 		dev_id: M29W800T,
 		name: "ST M29W800T",
diff -urN --exclude=3DCVS =
snapshots20021217/mtd/drivers/mtd/maps/Config.in =
snapshots20021217/mtd-735/drivers/mtd/maps/Config.in
--- snapshots20021217/mtd/drivers/mtd/maps/Config.in	2002-10-20 =
01:00:06.000000000 +0200
+++ snapshots20021217/mtd-735/drivers/mtd/maps/Config.in	2002-12-19 =
11:54:53.000000000 +0100
@@ -30,6 +30,7 @@
    dep_tristate '  JEDEC Flash device mapped on Mixcom piggyback card' =
CONFIG_MTD_MIXMEM $CONFIG_MTD_JEDEC
    dep_tristate '  JEDEC Flash device mapped on Octagon 5066 SBC' =
CONFIG_MTD_OCTAGON $CONFIG_MTD_JEDEC
    dep_tristate '  JEDEC Flash device mapped on Tempustech VMAX =
SBC301' CONFIG_MTD_VMAX $CONFIG_MTD_JEDEC
+   dep_tristate '  JEDEC Flash device mapped on FORCE Computers =
CPCI735/36' CONFIG_MTD_CPCI735 $CONFIG_MTD_JEDEC $CONFIG_MTD_CFI
    dep_tristate '  BIOS flash chip on Intel L440GX boards' =
CONFIG_MTD_L440GX $CONFIG_MTD_JEDECPROBE
    dep_tristate ' ROM connected to AMD76X southbridge' =
CONFIG_MTD_AMD76XROM $CONFIG_MTD_GEN_PROBE  =20
    dep_tristate ' ROM connected to Intel Hub Controller 2' =
CONFIG_MTD_ICH2ROM $CONFIG_MTD_JEDECPROBE
diff -urN --exclude=3DCVS =
snapshots20021217/mtd/drivers/mtd/maps/Kconfig =
snapshots20021217/mtd-735/drivers/mtd/maps/Kconfig
--- snapshots20021217/mtd/drivers/mtd/maps/Kconfig	2002-11-26 =
23:30:32.000000000 +0100
+++ snapshots20021217/mtd-735/drivers/mtd/maps/Kconfig	2002-12-19 =
11:56:17.000000000 +0100
@@ -128,6 +128,14 @@
 	  Board Computer. More information on the board is available at
 	  <http://www.tempustech.com/tt301.htm>.
=20
+config MTD_CPCI735
+	tristate "JEDEC Flash device mapped on FORCE Computers CPCI-735/736"
+	depends on X86 && MTD_JEDEC && MTD_CFI
+	help
+	  This provides a 'mapping' driver which supports the BIOS flash of
+	  CPCI-735/CPCI-736.=20
+	  FORCE Computers GmbH <http://www.forcecomputers.com>.
+
 config MTD_SCx200_DOCFLASH
 	tristate "Flash device mapped with DOCCS on NatSemi SCx200"
 	depends on X86 && MTD_CFI
diff -urN --exclude=3DCVS =
snapshots20021217/mtd/drivers/mtd/maps/Makefile =
snapshots20021217/mtd-735/drivers/mtd/maps/Makefile
--- snapshots20021217/mtd/drivers/mtd/maps/Makefile	2002-11-28 =
00:00:10.000000000 +0100
+++ snapshots20021217/mtd-735/drivers/mtd/maps/Makefile	2002-12-19 =
11:47:43.000000000 +0100
@@ -59,5 +59,6 @@
 obj-$(CONFIG_MTD_UCLINUX)	+=3D uclinux.o
 obj-$(CONFIG_MTD_NETtel)	+=3D nettel.o
 obj-$(CONFIG_MTD_SCB2_FLASH)	+=3D scb2_flash.o
+obj-$(CONFIG_MTD_CPCI735)	+=3D cpci735.o
=20
 include $(TOPDIR)/Rules.make
diff -urN --exclude=3DCVS =
snapshots20021217/mtd/drivers/mtd/maps/cpci735.c =
snapshots20021217/mtd-735/drivers/mtd/maps/cpci735.c
--- snapshots20021217/mtd/drivers/mtd/maps/cpci735.c	1970-01-01 =
01:00:00.000000000 +0100
+++ snapshots20021217/mtd-735/drivers/mtd/maps/cpci735.c	2002-12-19 =
12:39:05.000000000 +0100
@@ -0,0 +1,312 @@
+/*
+ * $Id: $
+ *
+ * Mappings for FORCE Computers CPCI-735/736 bios flash in physical =
memory.
+ *=20
+ * Derived from physmap.c done by David Woodhouse =
<dwmw2@infradead.org>
+ * Adopted for CPCI-735/736 by Wolfram Gettert =
<Wolfram.Gettert@fci.com>
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <asm/io.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/config.h>
+#include <linux/pci.h>
+#include <linux/delay.h>
+
+#define WINDOW_ADDR 0xFFF80000
+#define WINDOW_SIZE 0x80000
+#define BUSWIDTH 1=20
+
+#define WRITE_ENABLE	0x40
+#define RANGE_1MB	0x02
+
+#define FPGA1_INDEX		0x100
+#define FPGA1_DATA		0x101
+#define FPGA2_INDEX		0x102
+#define FPGA2_DATA		0x103
+
+#define OSB4_VENDOR_ID 	0x1166
+#define OSB4_DEVICE_ID  0x0200
+
+#define FLASH_CONTROL_REG 0x07
+
+#if LINUX_VERSION_CODE <=3D KERNEL_VERSION(2,2,22)
+#define __raw_readb readb
+#define __raw_readw readw
+#define __raw_readl readl
+#define __raw_writeb writeb
+#define __raw_writew writew
+#define __raw_writel writel
+#endif
+
+static char module_name[] =3D "BIOS flash";
+
+static struct mtd_erase_region_info fl_28F800_top[] =3D
+{
+        {
+	    	offset: 0x00000000,
+        	erasesize: 0x10000, //32 Kword
+		numblocks: 7,	//we only use the upper 512 Kbyte
+        }, {
+	    	offset: 0x78000,
+        	erasesize: 0x1000,      //
+		numblocks: 6,
+	}, {
+		offset: 0x7E000,
+		erasesize: 0x1000,     =20
+		numblocks: 2,
+	}
+};
+
+static inline void map_udelay(int us)
+{
+#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,2,0)
+	unsigned long t =3D us * HZ / 1000000;
+	if (t) {
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		schedule_timeout(t);
+		return;
+	}
+#endif
+	udelay(us);
+	cond_resched();
+}
+
+
+static struct mtd_info *mymtd;
+/*static struct mtd_info  mtd =3D {
+		type: MTD_NORFLASH,
+		flags: MTD_CAP_NORFLASH,
+		size: WINDOW_SIZE,
+		erasesize: 0x1000,
+		name: "CPCI-735 boot flash",
+		numeraseregions: sizeof(fl_28F800_top)/sizeof( struct =
mtd_erase_region_info),
+		eraseregions:  fl_28F800_top,
+		module: THIS_MODULE,
+		erase: flash_erase,
+		read: flash_read,
+		write: flash_write,
+		lock: NULL,
+		unlock: NULL,
+		sync: NULL,
+		priv: (void *)0
+};
+*/
+__u8 cpci735_read8(struct map_info *map, unsigned long ofs)
+{
+
+	return __raw_readb(map->map_priv_1 + ofs);
+}
+
+__u16 cpci735_read16(struct map_info *map, unsigned long ofs)
+{
+	return __raw_readw(map->map_priv_1 + ofs);
+}
+
+__u32 cpci735_read32(struct map_info *map, unsigned long ofs)
+{
+	return __raw_readl(map->map_priv_1 + ofs);
+}
+
+void cpci735_copy_from(struct map_info *map, void *to, unsigned long =
from, ssize_t len)
+{
+	memcpy_fromio(to, map->map_priv_1 + from, len);
+}
+
+void cpci735_write8(struct map_info *map, __u8 d, unsigned long adr)
+{
+	__raw_writeb(d, map->map_priv_1 + adr);
+	mb();
+}
+
+void cpci735_write16(struct map_info *map, __u16 d, unsigned long adr)
+{
+	__raw_writew(d, map->map_priv_1 + adr);
+	mb();
+}
+
+void cpci735_write32(struct map_info *map, __u32 d, unsigned long adr)
+{
+	__raw_writel(d, map->map_priv_1 + adr);
+	mb();
+}
+
+void cpci735_copy_to(struct map_info *map, unsigned long to, const =
void *from, ssize_t len)
+{
+	memcpy_toio(map->map_priv_1 + to, from, len);
+}
+
+struct map_info biosflash_map =3D {
+	name: module_name,
+	size: WINDOW_SIZE,
+	buswidth: BUSWIDTH,
+	read8: cpci735_read8,
+	read16: cpci735_read16,
+	read32: cpci735_read32,
+	copy_from: cpci735_copy_from,
+	write8: cpci735_write8,
+	write16: cpci735_write16,
+	write32: cpci735_write32,
+	copy_to: cpci735_copy_to
+};
+
+
+/* Set up the FPGA to be able to write to the flash */=20
+void enableFlash(void)
+{
+	char reg;
+ =20
+	//Write-enable flash in FPGA2
+	outb(FLASH_CONTROL_REG,FPGA2_INDEX);
+	reg =3D inb(FPGA2_DATA);
+	DEBUG(MTD_DEBUG_LEVEL3,"%s: fpga2: data 0x%x\n",module_name,reg);
+	reg |=3D RANGE_1MB;
+	reg |=3D WRITE_ENABLE;
+	DEBUG(MTD_DEBUG_LEVEL3,"%s: fpga2: changed to data 0x%x\n",
+			module_name, reg);
+	outb(reg,FPGA2_DATA);
+}
+
+/* Set up the FPGA to be disable writing to the flash */=20
+void disableFlash(void)
+{
+	char reg;
+	//Write-disable flash in FPGA2
+	outb(FLASH_CONTROL_REG,FPGA2_INDEX);
+	reg =3D inb(FPGA2_DATA);
+	DEBUG(MTD_DEBUG_LEVEL3,"%s: fpga2: data 0x%x\n",module_name,reg);
+	reg &=3D (~RANGE_1MB);
+	reg &=3D (~WRITE_ENABLE);
+	DEBUG(MTD_DEBUG_LEVEL3,"%s: fpga2:changed to data 0x%x\n",
+			module_name,reg);
+	outb(reg,FPGA2_DATA);
+}
+
+int do_cpci_735_stuff_init(void)
+{
+	struct pci_dev *dev =3D NULL;
+	u8 reg41, reg0c6f=3D0;
+=09
+=09
+	enableFlash();
+
+	//Setup ISA misc control register, enable flash ROM
+	reg0c6f =3D inw(0xC6F);=09
+	reg0c6f |=3D 0x40;
+	outb(reg0c6f,0xC6F);
+	reg0c6f =3D inw(0xC6F);=09
+
+	//Set up OSB4 registers
+	dev =3D pci_find_device(OSB4_VENDOR_ID, OSB4_DEVICE_ID, dev);
+	if(dev)
+	{
+	  pci_read_config_byte(dev, 0x41,&reg41);
+	  reg41 |=3D 0x10;
+	  pci_write_config_byte(dev, 0x41,reg41);
+	}=20
+	else
+	{
+		printk(KERN_NOTICE "%s: Couldn't find PCI device 0x%x:0x%x\n",
+				module_name,OSB4_VENDOR_ID,OSB4_DEVICE_ID);
+	  return -EIO;
+	}
+	return 0;
+}
+
+int do_cpci_735_stuff_release(void)
+{
+	struct pci_dev *dev =3D NULL;
+	u8 reg41, reg0c6f=3D0;
+=09
+	disableFlash();
+	//Setup ISA misc control register, disable flash ROM
+	reg0c6f =3D inw(0xC6F);=09
+	reg0c6f &=3D (~0x40);
+	outb(reg0c6f,0xC6F);
+	reg0c6f =3D inw(0xC6F);=09
+
+	//Set up OSB4 registers
+	dev =3D pci_find_device(OSB4_VENDOR_ID, OSB4_DEVICE_ID, dev);
+	if(dev)
+	{
+	  pci_read_config_byte(dev, 0x41,&reg41);
+	  reg41 &=3D (~0x10);
+	  pci_write_config_byte(dev, 0x41,reg41);
+	}=20
+	else
+	{
+		printk(KERN_NOTICE "%s: Couldn't find PCI device 0x%x:0x%x\n",
+				module_name,OSB4_VENDOR_ID,OSB4_DEVICE_ID);
+	  return -EIO;
+	}
+  return 0;
+}
+
+
+int __init init_cpci735(void)
+{
+	static const char *rom_probe_types[] =3D {"jedec_probe", 0 };
+	const char **type;
+=09
+	printk(KERN_NOTICE "%s device: %x at %x\n",
+			module_name, WINDOW_SIZE, WINDOW_ADDR);
+	biosflash_map.map_priv_1 =3D (unsigned long)ioremap(WINDOW_ADDR, =
WINDOW_SIZE);
+	if (!biosflash_map.map_priv_1) {
+		printk("%s: Failed to ioremap\n",module_name);
+		return -EIO;
+	}
+=09
+	//Setup everything for write enable
+	if(do_cpci_735_stuff_init())
+	{
+		return -EIO;
+	}
+
+	DEBUG(MTD_DEBUG_LEVEL3,"%s: Start probing ...\n", module_name);
+	mymtd =3D 0;
+	type =3D rom_probe_types;
+	for(; !mymtd && *type; type++) {
+		DEBUG(MTD_DEBUG_LEVEL3,"%s: Probing %s\n",module_name, *type);
+		mymtd =3D do_map_probe(*type, &biosflash_map);
+	}
+	//The eraseregions are patched because only the upper 512 Kbyte=20
+	//are accesible
+	mymtd->numeraseregions =3D sizeof(fl_28F800_top)/sizeof( struct =
mtd_erase_region_info);
+	mymtd->eraseregions =3D fl_28F800_top;
+	if (mymtd) {
+		mymtd->module =3D THIS_MODULE;
+		add_mtd_device(mymtd);
+		return 0;
+	}
+
+	iounmap((void *)biosflash_map.map_priv_1);
+	return -ENXIO;
+}
+
+static void __exit cleanup_cpci735(void)
+{
+	if (mymtd)
+	{
+		del_mtd_device(mymtd);
+		map_destroy(mymtd);
+	}
+
+	if (biosflash_map.map_priv_1) {
+		iounmap((void *)biosflash_map.map_priv_1);
+		biosflash_map.map_priv_1 =3D 0;
+	}
+	do_cpci_735_stuff_release();
+}
+
+module_init(init_cpci735);
+module_exit(cleanup_cpci735);
+
+#ifdef MODULE_LICENSE=20
+	MODULE_LICENSE("GPL");
+#endif
+MODULE_AUTHOR("Wolfram Gettert <Wolfram.Gettert@fci.com>");
+MODULE_DESCRIPTION("BIOS flash MTD map driver for CPCI-735/736");

------_=_NextPart_000_01C2A769.08DA15B0--
