Received: from ip66-35-227-11.altera.com ([66.35.227.11] helo=www.altera.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 167DKm-0004gZ-00
	for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2001 10:13:24 +0000
Received: from Altera.COM (sunrise.altera.com [137.57.1.1])
	by www.altera.com (8.9.3+Sun/8.9.3) with ESMTP id CAA01653
	for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2001 02:20:16 -0800 (PST)
Received: from localhost (localhost [[UNIX: localhost]])
	by localhost.localdomain (8.11.6/8.11.2) id fANANpt11197
	for linux-mtd@lists.infradead.org; Fri, 23 Nov 2001 10:23:51 GMT
Message-Id: <200111231023.fANANpt11197@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-15"
From: Clive Davies <cdavies@altera.com>
To: linux-mtd@lists.infradead.org
Subject: Add map driver for epxa10db platform
Date: Fri, 23 Nov 2001 10:23:51 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Attached is a patch to add an mtd map driver for the Altera  epxa10 
development board. Any objections/comments?

TIA
Clive

diff -purN linux_2.4.13/drivers/mtd/maps/Config.in 
linux/drivers/mtd/maps/Config.in
--- linux_2.4.13/drivers/mtd/maps/Config.in	Mon Oct 29 15:47:07 2001
+++ linux/drivers/mtd/maps/Config.in	Wed Oct 24 10:17:47 2001
@@ -57,6 +57,7 @@ if [ "$CONFIG_ARM" = "y" ]; then
    dep_tristate '  CFI Flash device mapped on StrongARM SA11x0' 
CONFIG_MTD_SA1100 $CONFIG_MTD_CFI $CONFIG_ARCH_SA1100 $CONFIG_MTD_PARTITIONS
    dep_tristate '  CFI Flash device mapped on DC21285 Footbridge' 
CONFIG_MTD_DC21285 $CONFIG_MTD_CFI $CONFIG_ARCH_FOOTBRIDGE 
$CONFIG_MTD_PARTITIONS
    dep_tristate '  CFI Flash device mapped on the XScale IQ80310 board' 
CONFIG_MTD_IQ80310 $CONFIG_MTD_CFI $CONFIG_ARCH_IQ80310
+   dep_tristate '  CFI Flash device mapped on Epxa10db' CONFIG_MTD_EPXA10DB 
$CONFIG_MTD_CFI  $CONFIG_MTD_PARTITIONS 
 fi
 
 # This needs CFI or JEDEC, depending on the cards found.
diff -purN linux_2.4.13/drivers/mtd/maps/epxa10db-flash.c 
linux/drivers/mtd/maps/epxa10db-flash.c
--- linux_2.4.13/drivers/mtd/maps/epxa10db-flash.c	Thu Jan  1 01:00:00 1970
+++ linux/drivers/mtd/maps/epxa10db-flash.c	Thu Nov  1 15:13:11 2001
@@ -0,0 +1,218 @@
+/*
+ * Flash memory access on EPXA based devices
+ *
+ * (C) 2000 Nicolas Pitre <nico@cam.org>
+ *  Copyright (C) 2001 Altera Corporation
+ *
+ * $Id$ */
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
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#include <linux/config.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/hardware.h>
+
+
+MODULE_AUTHOR("Clive Davies");
+MODULE_DESCRIPTION("Altera epxa10db mtd flash map");
+MODULE_LICENSE("GPL");
+
+static __u8 epxa10db_read8(struct map_info *map, unsigned long ofs)
+{
+	return *(__u8 *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + ofs));
+}
+
+static __u16 epxa10db_read16(struct map_info *map, unsigned long ofs)
+{
+	return *(__u16 *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + ofs));
+}
+
+static __u32 epxa10db_read32(struct map_info *map, unsigned long ofs)
+{
+	return *(__u32 *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + ofs));
+}
+
+static void epxa10db_copy_from(struct map_info *map, void *to, unsigned long 
from, ssize_t len)
+{
+	memcpy(to, (void *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + from)), len);
+}
+
+static void epxa10db_write8(struct map_info *map, __u8 d, unsigned long adr)
+{
+	*(__u8 *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + adr)) = d;
+}
+
+static void epxa10db_write16(struct map_info *map, __u16 d, unsigned long 
adr)
+{
+	*(__u16 *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + adr)) = d;
+}
+
+static void epxa10db_write32(struct map_info *map, __u32 d, unsigned long 
adr)
+{
+	*(__u32 *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + adr)) = d;
+}
+
+static void epxa10db_copy_to(struct map_info *map, unsigned long to, const 
void *from, ssize_t len)
+{
+	memcpy((void *)FLASH_VADDR(EXC_EBI_BLOCK0_BASE + to), from, len);
+}
+
+
+
+static struct map_info epxa10db_map = {
+	name:		"EPXA10DB flash",
+	read8:		epxa10db_read8,
+	read16:		epxa10db_read16,
+	read32:		epxa10db_read32,
+	copy_from:	epxa10db_copy_from,
+	write8:		epxa10db_write8,
+	write16:	epxa10db_write16,
+	write32:	epxa10db_write32,
+	copy_to:	epxa10db_copy_to
+};
+
+
+
+
+
+int fixup_epxa10db_partitions(struct mtd_info *master, struct mtd_partition 
**pparts);
+
+static struct mtd_partition *parsed_parts;
+static struct mtd_info *mymtd;
+
+int __init epxa10db_mtd_init(void)
+{
+	struct mtd_partition *parts;
+	int nb_parts = 0;
+	int parsed_nr_parts = 0;
+	char *part_type;
+	int i;
+	const char* master_name="master";
+	
+	epxa10db_map.buswidth =  2;
+	epxa10db_map.size = 0x01000000;
+	printk(KERN_NOTICE "EPXA10DB flash: probing %d-bit flash bus\n", 
epxa10db_map.buswidth*8);
+	mymtd = do_map_probe("cfi_probe", &epxa10db_map);
+	if (!mymtd)
+		return -ENXIO;
+	mymtd->module = THIS_MODULE;
+
+
+
+	/*
+	 * Dynamic partition selection stuff (might override the static ones)
+	 */
+	if (parsed_nr_parts == 0) {
+		int ret = fixup_epxa10db_partitions(mymtd, &parsed_parts);
+		if (ret > 0) {
+			part_type = "Compaq bootldr";
+			parsed_nr_parts = ret;
+		}
+	}
+
+	if (parsed_nr_parts > 0) {
+		parts = parsed_parts;
+		nb_parts = parsed_nr_parts;
+	}
+
+	if (nb_parts == 0) {
+		printk(KERN_NOTICE "EPXA10DB flash: no partition info available, 
registering whole flash at once\n");
+		add_mtd_device(mymtd);
+	} else {
+		printk(KERN_NOTICE "Using %s partition definition\n", part_type);
+		add_mtd_partitions(mymtd, parts, nb_parts);
+	}
+	
+        /* unlock the flash device */
+
+	for (i=0; i<mymtd->numeraseregions;i++){
+		int j;
+		for(j=0;j<mymtd->eraseregions[i].numblocks;j++){
+			mymtd->unlock(mymtd,mymtd->eraseregions[i].offset + j * 
mymtd->eraseregions[i].erasesize,4);
+		}
+	}
+
+	/* 
+	 * Register mymtd as an mtd device so that we can read the 
+	 * protection data 
+	 */
+	mymtd->name=master_name;
+	add_mtd_device(mymtd);
+
+
+	return 0;
+}
+
+static void __exit epxa10db_mtd_cleanup(void)
+{
+	if (mymtd) {
+		del_mtd_partitions(mymtd);
+		map_destroy(mymtd);
+		if (parsed_parts)
+			kfree(parsed_parts);
+	}
+}
+
+
+/* 
+ * This will do for now, once we decide which bootldr we're finally 
+ * going to use then we'll remove this function and do it properly
+ *
+ * Partions are currently (as offsets from base of flash):
+ * 0x00000000 - 0x003FFFFF - bootloader (!)
+ * 0x00400000 - 0x00FFFFFF - Flashdisk
+ */
+
+int fixup_epxa10db_partitions(struct mtd_info *master, struct mtd_partition 
**pparts)
+{
+	struct mtd_partition *parts;
+	int ret, i;
+	int npartitions = 0;
+	char *names; 
+	const char *name = "jffs";
+
+	printk("Fixing up epxa10db partitions\n");
+	npartitions=1;
+	parts = kmalloc(npartitions*sizeof(*parts)+strlen(name), GFP_KERNEL);
+	if (!parts) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	i=0;
+	names = (char *)&parts[npartitions];	
+	parts[i].name = names;
+	names += strlen(name) + 1;
+	strcpy(parts[i].name, name);
+
+	parts[i].size = 0x00C00000;
+	parts[i].offset = 0x00400000;
+	parts[i].mask_flags = 0;
+		
+
+ out:
+	*pparts = parts;
+	return npartitions;
+}
+
+module_init(epxa10db_mtd_init);
+module_exit(epxa10db_mtd_cleanup);
--- linux_2.4.13/Documentation/Configure.help	Mon Oct 29 15:47:06 2001
+++ linux/Documentation/Configure.help	Wed Oct 31 10:10:53 2001
@@ -12261,6 +12273,12 @@ CONFIG_MTD_OCELOT
   NVRAM on the Momenco Ocelot board.  If you have one of these boards
   and would like access to either of these, say 'Y'.
 
+Flash chip mapping on epxa10db
+CONFIG_MTD_EPXA10DB
+  This enables support for the flash devices on the Altera 
+  Excalibur XA10 Development Board. If you are building a kernel
+  for on of these boards then you should say 'Y' otherwise say 'N'.
+
 USB (Universal Serial Bus) support
 CONFIG_USB
   Universal Serial Bus (USB) is a specification for a serial bus
