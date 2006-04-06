Received: from webmail-outgoing.us4.outblaze.com ([205.158.62.67])
	by pentafluge.infradead.org with esmtp (Exim 4.60 #1 (Red Hat Linux))
	id 1FRUl5-00021U-7T
	for linux-mtd@lists.infradead.org; Thu, 06 Apr 2006 14:42:51 +0100
Received: from unknown (unknown [192.168.9.180])
	by webmail-outgoing.us4.outblaze.com (Postfix) with QMQP id
	2F0FE1800D99 for <linux-mtd@lists.infradead.org>;
	Thu,  6 Apr 2006 13:50:56 +0000 (GMT)
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="big5"
MIME-Version: 1.0
From: "phAntOm yAng" <dalalilala@hellokitty.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 06 Apr 2006 21:50:55 +0800
Message-Id: <20060406135055.BE6FA43AA1@ws5-1.us4.outblaze.com>
Subject: Problem of "JFFS2 summary"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All:

My board is OMAP5912 running kernel 2.6.14-omap2.

These days, I tried to use "Erase Block Summary" in JFFS2 by following step=
s:
1)Get the newest MTD by CVS and the original 2.6.14 kernel
2)Doing MTD patch by
SHELL>./patchkernel.sh -c -2 -3 -y -v /opt/linux-2.6.14
3)Doing OMAP2 patch(Get some conflicts)
4)Fix conflicts
5)Build kernel with "JFFS2 summary support"
6)Build jffs2 image by
SHELL>./mkfs.jffs2 -l -e 128KiB -r rootfs2.6 -o pure.jffs2
7)Convert jffs2 image by
SHELL>./sumtool -p -l -e 128KiB -i pure.jffs2 -o pure-sum.jffs2

If I use original omap2 kernel with pure-sum.jffs2,
booting is OK and no error mssage.

If I use mtd patched kernel with pure-sum.jffs2,
while mount jffs2 it will show error message and halt:

Starting kernel ...
[Skip..........]
Creating 4 MTD partitions on "omapflash.0":
0x00000000-0x00020000 : "bootloader"
0x00020000-0x00040000 : "params"
0x00040000-0x00240000 : "kernel"
0x00240000-0x02000000 : "filesystem"
[Skip..........]
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080000: 0x00=
b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004: 0x00=
b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080008: 0x00=
b0 instead
[Skip..........]
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01da0010: 0x00=
80 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01da0014: 0x00=
80 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01da0018: 0x00=
80 instead
[Skip..........]
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x000400. But it =
must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x000390. But it =
must have been OK earlier.
[Skip..........]
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x000000. But it =
must have been OK earlier.
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 112K
Warning: unable to open an initial console.
Kernel panic - not syncing: No init found.  Try passing init=3D option to k=
ernel.

My jffs2 image size is 0x80000, and the "Magic bitmask 0x1985 not found"
message begin after 0x80000.

How to resolve this problem?
Thanks in advance.

Following is my patch for conflicts of MTD and omap2 patches:
diff -Nur linux-2.6.14/drivers/mtd/maps/omap_nor.c linux-2.6.14-mtd/drivers=
/mtd/maps/omap_nor.c
--- linux-2.6.14/drivers/mtd/maps/omap_nor.c 2006-04-05 20:13:07.000000000 =
+0800
+++ linux-2.6.14-mtd/drivers/mtd/maps/omap_nor.c 2006-04-01 00:10:50.000000=
000 +0800
@@ -30,7 +30,7 @@
  * 675 Mass Ave, Cambridge, MA 02139, USA.
  */
=20
-#include <linux/platform_device.h>
+#include <linux/device.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
@@ -72,10 +72,11 @@
  }
 }
=20
-static int __devinit omapflash_probe(struct platform_device *pdev)
+static int __devinit omapflash_probe(struct device *dev)
 {
  int err;
  struct omapflash_info *info;
+ struct platform_device *pdev =3D to_platform_device(dev);
  struct flash_platform_data *pdata =3D pdev->dev.platform_data;
  struct resource *res =3D pdev->resource;
  unsigned long size =3D res->end - res->start + 1;
@@ -120,7 +121,7 @@
 #endif
  add_mtd_device(info->mtd);
=20
- platform_set_drvdata(pdev, info);
+ dev_set_drvdata(&pdev->dev, info);
=20
  return 0;
=20
@@ -134,11 +135,12 @@
  return err;
 }
=20
-static int __devexit omapflash_remove(struct platform_device *pdev)
+static int __devexit omapflash_remove(struct device *dev)
 {
- struct omapflash_info *info =3D platform_get_drvdata(pdev);
+struct platform_device *pdev =3D to_platform_device(dev);
+struct omapflash_info *info =3D dev_get_drvdata(&pdev->dev);
=20
- platform_set_drvdata(pdev, NULL);
+ dev_set_drvdata(&pdev->dev, NULL);
=20
  if (info) {
  if (info->parts) {
@@ -155,22 +157,21 @@
  return 0;
 }
=20
-static struct platform_driver omapflash_driver =3D {
+static struct device_driver omapflash_driver =3D {
+ .name =3D "omapflash",
+ .bus =3D &platform_bus_type,
  .probe =3D omapflash_probe,
  .remove =3D __devexit_p(omapflash_remove),
- .driver =3D {
- .name =3D "omapflash",
- },
 };
=20
 static int __init omapflash_init(void)
 {
- return platform_driver_register(&omapflash_driver);
+ return driver_register(&omapflash_driver);
 }
=20
 static void __exit omapflash_exit(void)
 {
- platform_driver_unregister(&omapflash_driver);
+ driver_unregister(&omapflash_driver);
 }
=20
 module_init(omapflash_init);
diff -Nur linux-2.6.14/drivers/mtd/nand/Kconfig linux-2.6.14-mtd/drivers/mt=
d/nand/Kconfig
--- linux-2.6.14/drivers/mtd/nand/Kconfig 2006-04-05 20:13:07.000000000 +08=
00
+++ linux-2.6.14-mtd/drivers/mtd/nand/Kconfig 2006-03-31 23:20:25.000000000=
 +0800
@@ -195,6 +195,15 @@
    load time (assuming you build diskonchip as a module) with the module
    parameter "inftl_bbt_write=3D1".
=20
+
+config MTD_NAND_OMAP_HW
+ bool "OMAP HW NAND Flash controller support"
+ depends on ARM && ARCH_OMAP16XX && MTD_NAND
+
+ help
+   Driver for TI OMAP16xx hardware NAND flash controller.
+
+
 config MTD_NAND_SHARPSL
  bool "Support for NAND Flash on Sharp SL Series (C7xx + others)"
  depends on MTD_NAND && ARCH_PXA
diff -Nur linux-2.6.14/drivers/mtd/nand/Makefile linux-2.6.14-mtd/drivers/m=
td/nand/Makefile
--- linux-2.6.14/drivers/mtd/nand/Makefile 2006-04-05 20:13:07.000000000 +0=
800
+++ linux-2.6.14-mtd/drivers/mtd/nand/Makefile 2006-03-31 23:23:35.00000000=
0 +0800
@@ -18,6 +18,8 @@
 obj-$(CONFIG_MTD_NAND_RTC_FROM4) +=3D rtc_from4.o
 obj-$(CONFIG_MTD_NAND_SHARPSL) +=3D sharpsl.o
 obj-$(CONFIG_MTD_NAND_NANDSIM) +=3D nandsim.o
+obj-$(CONFIG_MTD_NAND_OMAP)            +=3D omap-nand-flash.o
+obj-$(CONFIG_MTD_NAND_OMAP_HW)         +=3D omap-hw.o
 obj-$(CONFIG_MTD_NAND_AT91) +=3D at91_nand.o
=20
 nand-objs =3D nand_base.o nand_bbt.o
diff -Nur linux-2.6.14/fs/Makefile linux-2.6.14-mtd/fs/Makefile
--- linux-2.6.14/fs/Makefile 2006-04-05 20:12:20.000000000 +0800
+++ linux-2.6.14-mtd/fs/Makefile 2006-04-01 00:15:08.000000000 +0800
@@ -82,7 +82,7 @@
 obj-$(CONFIG_UFS_FS) +=3D ufs/
 obj-$(CONFIG_EFS_FS) +=3D efs/
 obj-$(CONFIG_JFFS_FS) +=3D jffs/
-obj-$(CONFIG_JFFS3_FS)          +=3D jffs3/
+#obj-$(CONFIG_JFFS3_FS)          +=3D jffs3/
 obj-$(CONFIG_JFFS2_FS) +=3D jffs2/
 obj-$(CONFIG_AFFS_FS) +=3D affs/
 obj-$(CONFIG_ROMFS_FS) +=3D romfs/


--=20
____________________________________________________
Get your own Hello Kitty email @ www.sanriotown.com
