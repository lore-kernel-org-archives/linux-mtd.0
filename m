Received: from moutng.kundenserver.de ([212.227.126.186])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ak5jC-0007rD-AK
	for linux-mtd@lists.infradead.org; Fri, 23 Jan 2004 18:08:22 +0000
Received: from [212.227.126.179] (helo=mrelayng.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1Ak5jA-0003iE-00
	for linux-mtd@lists.infradead.org; Fri, 23 Jan 2004 19:08:20 +0100
Received: from [80.129.139.212] (helo=create.4g)
	by mrelayng.kundenserver.de with asmtp (Exim 3.35 #1)
	id 1Ak5jA-0006c1-00
	for linux-mtd@lists.infradead.org; Fri, 23 Jan 2004 19:08:20 +0100
From: Bruno Randolf <bruno.randolf@4g-systems.biz>
To: linux-mtd@lists.infradead.org
Date: Fri, 23 Jan 2004 19:08:19 +0100
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_TMWEAlW9zK9J2zK"
Message-Id: <200401231908.20029.bruno.randolf@4g-systems.biz>
Subject: patch for a new map (mtx-1) and problems with current cvs version
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-00=_TMWEAlW9zK9J2zK
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

hello!

today i upgraded mtd on my 2.4.24 mips kernel with the cvs version of today=
=20
(23.01.2004). i had to do this because the mtd version in 2.4.24 has some=20
problems with my flash chips (AMD AM29LV128M).

* to support my board (mtx-1), i created the attached patch with the partit=
ion=20
map for my system. could it be added to the cvs, please?

* i recognized that this chip has problems with erase suspend, so i added t=
he=20
patch of david vrabel=20
(http://lists.infradead.org/pipermail/linux-mtd/2003-December/009001.html),=
=20
which made things better, but the problems he mentioned remained. how could=
=20
they be fixed? i know there was a version of mtd before (about june 2003)=20
which worked without errors, with this chip, but much slower as it seems.

* i wonder how often and at which times the mtd cvs is synced into the linu=
x=20
kernel?=20

thanks for your help,
bruno
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAEWMTfg2jtUL97G4RAqTWAJwJRDr+0W9BkhBFZgep4PrxKYRKPwCeI54O
UGz89chi8Tbn1ot2jS24G68=3D
=3Dskml
=2D----END PGP SIGNATURE-----

--Boundary-00=_TMWEAlW9zK9J2zK
Content-Type: text/x-diff;
  charset="us-ascii";
  name="mtd_mtx_2004_01_23.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mtd_mtx_2004_01_23.diff"

diff -Nurb mtd/drivers/mtd/maps/Config.in mtd-with-mtx/drivers/mtd/maps/Config.in
--- mtd/drivers/mtd/maps/Config.in	2003-11-26 22:26:09.000000000 +0100
+++ mtd-with-mtx/drivers/mtd/maps/Config.in	2004-01-23 18:41:43.000000000 +0100
@@ -80,6 +80,7 @@
       bool '  Db1x00 boot flash device' CONFIG_MTD_DB1X00_BOOT 
       bool '  Db1x00 user flash device (2nd bank)' CONFIG_MTD_DB1X00_USER
    fi
+   dep_tristate '  MTX-1 flash device' CONFIG_MTD_MTX1 $CONFIG_MIPS_MTX1
    dep_tristate '  Flash chip mapping on ITE QED-4N-S01B, Globespan IVR or custom board' CONFIG_MTD_CSTM_MIPS_IXX $CONFIG_MTD_CFI $CONFIG_MTD_JEDEC $CONFIG_MTD_PARTITIONS 
    if [ "$CONFIG_MTD_CSTM_MIPS_IXX" = "y" -o "$CONFIG_MTD_CSTM_MIPS_IXX" = "m" ]; then
       hex '    Physical start address of flash mapping' CONFIG_MTD_CSTM_MIPS_IXX_START 0x8000000
diff -Nurb mtd/drivers/mtd/maps/Kconfig mtd-with-mtx/drivers/mtd/maps/Kconfig
--- mtd/drivers/mtd/maps/Kconfig	2003-10-27 20:49:23.000000000 +0100
+++ mtd-with-mtx/drivers/mtd/maps/Kconfig	2004-01-23 18:49:17.000000000 +0100
@@ -210,6 +210,12 @@
 	  You can say 'Y' to both this and 'MTD_PB1XXX_BOOT' above, to use
 	  both banks.
 
+config MTD_MTX1
+        tristate "Flash devices on 4G Systems MTX-1 boards"
+        depends on MIPS && MIPS_MTX1
+        help
+          Flash memory access on 4G Systems MTX-1 boards
+
 config MTD_DILNETPC
 	tristate "CFI Flash device mapped on DIL/Net PC"
 	depends on X86 && MTD_CONCAT && MTD_PARTITIONS && MTD_CFI_INTELEXT
diff -Nurb mtd/drivers/mtd/maps/Makefile.common mtd-with-mtx/drivers/mtd/maps/Makefile.common
--- mtd/drivers/mtd/maps/Makefile.common	2003-11-26 22:26:09.000000000 +0100
+++ mtd-with-mtx/drivers/mtd/maps/Makefile.common	2004-01-23 18:43:16.000000000 +0100
@@ -49,6 +49,7 @@
 obj-$(CONFIG_MTD_PCI)		+= pci.o
 obj-$(CONFIG_MTD_PB1XXX)	+= pb1xxx-flash.o
 obj-$(CONFIG_MTD_DB1X00)        += db1x00-flash.o
+obj-$(CONFIG_MTD_MTX1)          += mtx-1.o
 obj-$(CONFIG_MTD_LASAT)		+= lasat.o
 obj-$(CONFIG_MTD_AUTCPU12)	+= autcpu12-nvram.o
 obj-$(CONFIG_MTD_EDB7312)	+= edb7312.o
diff -Nurb mtd/drivers/mtd/maps/mtx-1.c mtd-with-mtx/drivers/mtd/maps/mtx-1.c
--- mtd/drivers/mtd/maps/mtx-1.c	1970-01-01 01:00:00.000000000 +0100
+++ mtd-with-mtx/drivers/mtd/maps/mtx-1.c	2004-01-23 18:40:35.000000000 +0100
@@ -0,0 +1,93 @@
+/*
+ * Flash memory access on 4G Systems MTX-1 board
+ *
+ * (C) Bruno Randolf (4G Systeme GmbH) <bruno.randolf@4g-systems.biz>
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
+
+#define WINDOW_ADDR 0x1E000000
+#define WINDOW_SIZE 0x2000000
+#define BUSWIDTH    4
+
+static struct map_info mtx1_map = {
+	.name = "MTX-1 flash",
+	.size = WINDOW_SIZE,
+	.buswidth = BUSWIDTH,
+	.phys = WINDOW_ADDR
+};
+
+static struct mtd_partition mtx1_partitions[] = {
+        {
+                .name = "user fs",
+                .size = 0x1c00000,
+                .offset = 0,
+        },{
+                .name = "yamon",
+                .size = 0x0100000,
+                .offset = MTDPART_OFS_APPEND,
+                .mask_flags = MTD_WRITEABLE  /* force read-only */
+        },{
+                .name = "raw kernel",
+                .size = 0x02c0000,
+                .offset = MTDPART_OFS_APPEND,
+        },{
+                .name = "yamon environment",
+                .size = 0x0040000,
+                .offset = MTDPART_OFS_APPEND,
+                .mask_flags = MTD_WRITEABLE  /* force read-only */
+        }
+};
+
+static struct mtd_info *mymtd;
+
+int __init mtx1_mtd_init(void)
+{
+	printk(KERN_NOTICE "MTX-1 flash: probing %d-bit flash bus at %x\n",
+			mtx1_map.buswidth*8, WINDOW_ADDR);
+
+	mtx1_map.virt = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE);
+	if (!mtx1_map.virt) {
+		printk("mtx_mtd_init: failed to ioremap\n");
+		return -EIO;
+	}
+
+	simple_map_init(&mtx1_map);
+
+	mymtd = do_map_probe("cfi_probe", &mtx1_map);
+	if (!mymtd) {
+		iounmap(mtx1_map.virt);
+		return -ENXIO;
+	}
+
+	mymtd->owner = THIS_MODULE;
+
+	return add_mtd_partitions(mymtd, mtx1_partitions, ARRAY_SIZE(mtx1_partitions));
+}
+
+static void __exit mtx1_mtd_cleanup(void)
+{
+	if (mymtd) {
+		del_mtd_partitions(mymtd);
+		map_destroy(mymtd);
+	}
+	if (mtx1_map.virt)
+		iounmap(mtx1_map.virt);
+}
+
+module_init(mtx1_mtd_init);
+module_exit(mtx1_mtd_cleanup);
+
+MODULE_AUTHOR("Bruno Randolf <bruno.randolf@4g-systems.biz>");
+MODULE_DESCRIPTION("MTX-1 CFI map driver");
+MODULE_LICENSE("GPL");

--Boundary-00=_TMWEAlW9zK9J2zK--
