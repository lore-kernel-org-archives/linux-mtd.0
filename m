Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18BYON-0002lo-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 10:35:35 +0000
Subject: [PATCH] Add a map_sram driver to drivers/chips/
From: Ian Campbell <icampbell@arcomcontrols.com>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Content-Type: multipart/mixed; boundary="=-VRJhKCRo6gKDvdRn8zYx"
Date: 12 Nov 2002 11:05:25 +0000
Message-Id: <1037099125.26491.81.camel@LinuxDev>
Mime-Version: 1.0
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

--=-VRJhKCRo6gKDvdRn8zYx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Howdy,

The attached patch adds "map_sram" as a second chip driver in
drivers/mtd/chips/map_ram.c.  The two are basically identical apart from
the use of the MTD_VOLATILE flag.

I have another patch which makes an entirely separate map_sram.c, but
there was so much code duplication with map_ram.c I didn't see the
point. I guess if you are using modules then you will need 'alias
map_sram map_ram' in /etc/modules.conf or something to get autoloading
to work.

The patch also includes a previous patch to set the state to
MTD_ERASE_DONE in mapram_erase. This is needed to mount a JFFS2 f/s on
an SRAM or RAM device.

Cheers,
Ian.

-- 
Ian Campbell
Design Engineer

Arcom Control Systems Ltd,
Clifton Road,
Cambridge CB1 7EA
United Kingdom

Tel: +44 (0)1223 403465
E-Mail: icampbell@arcomcontrols.com
Web: http://www.arcomcontrols.com


________________________________________________________________________
This email has been scanned for all viruses by the MessageLabs SkyScan
service. For more information on a proactive anti-virus service working
around the clock, around the globe, visit http://www.messagelabs.com
________________________________________________________________________
--=-VRJhKCRo6gKDvdRn8zYx
Content-Disposition: attachment; filename=mtd.map_sram-2.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; name=mtd.map_sram-2.patch; charset=ISO-8859-1

diff -urN kernel-2.4.18.orig/include/linux/mtd/mtd.h kernel-2.4.18/include/=
linux/mtd/mtd.h
--- kernel-2.4.18.orig/include/linux/mtd/mtd.h	Tue Jun 12 18:30:27 2001
+++ kernel-2.4.18/include/linux/mtd/mtd.h	Wed Nov  6 14:05:30 2002
@@ -39,5 +39,6 @@
 #define MTD_NORFLASH		3
 #define MTD_NANDFLASH		4
 #define MTD_PEROM		5
+#define MTD_SRAM		6
 #define MTD_OTHER		14
 #define MTD_UNKNOWN		15
diff -urN kernel-2.4.18.orig/drivers/mtd/chips/Config.in kernel-2.4.18/driv=
ers/mtd/chips/Config.in
--- kernel-2.4.18.orig/drivers/mtd/chips/Config.in	Thu Oct  4 23:13:18 2001
+++ kernel-2.4.18/drivers/mtd/chips/Config.in	Tue Nov 12 10:29:27 2002
@@ -44,7 +44,7 @@
 dep_tristate '  Support for Intel/Sharp flash chips' CONFIG_MTD_CFI_INTELE=
XT $CONFIG_MTD_GEN_PROBE
 dep_tristate '  Support for AMD/Fujitsu flash chips' CONFIG_MTD_CFI_AMDSTD=
 $CONFIG_MTD_GEN_PROBE
=20
-dep_tristate '  Support for RAM chips in bus mapping' CONFIG_MTD_RAM $CONF=
IG_MTD
+dep_tristate '  Support for RAM/SRAM chips in bus mapping' CONFIG_MTD_RAM =
$CONFIG_MTD
 dep_tristate '  Support for ROM chips in bus mapping' CONFIG_MTD_ROM $CONF=
IG_MTD
 dep_tristate '  Support for absent chips in bus mapping' CONFIG_MTD_ABSENT=
 $CONFIG_MTD
=20
diff -urN kernel-2.4.18.orig/drivers/mtd/chips/map_ram.c kernel-2.4.18/driv=
ers/mtd/chips/map_ram.c
--- kernel-2.4.18.orig/drivers/mtd/chips/map_ram.c	Thu Oct  4 23:14:59 2001
+++ kernel-2.4.18/drivers/mtd/chips/map_ram.c	Tue Nov 12 10:52:11 2002
@@ -20,6 +20,7 @@
 static int mapram_erase (struct mtd_info *, struct erase_info *);
 static void mapram_nop (struct mtd_info *);
 static struct mtd_info *map_ram_probe(struct map_info *map);
+static struct mtd_info *map_sram_probe(struct map_info *map);
=20
=20
 static struct mtd_chip_driver mapram_chipdrv =3D {
@@ -27,6 +28,11 @@
 	name: "map_ram",
 	module: THIS_MODULE
 };
+static struct mtd_chip_driver mapsram_chipdrv =3D {
+	probe: map_sram_probe,
+	name: "map_sram",
+	module: THIS_MODULE
+};
=20
 static struct mtd_info *map_ram_probe(struct map_info *map)
 {
@@ -78,6 +84,34 @@
 	return mtd;
 }
=20
+static struct mtd_info *map_sram_probe(struct map_info *map)
+{
+	struct mtd_info *mtd;
+
+	mtd =3D kmalloc(sizeof(*mtd), GFP_KERNEL);
+	if (!mtd)
+		return NULL;
+
+	memset(mtd, 0, sizeof(*mtd));
+
+	map->fldrv =3D &mapram_chipdrv;
+	mtd->priv =3D map;
+	mtd->name =3D map->name;
+	mtd->type =3D MTD_SRAM;
+	mtd->size =3D map->size;
+	mtd->erase =3D mapram_erase;
+	mtd->read =3D mapram_read;
+	mtd->write =3D mapram_write;
+	mtd->sync =3D mapram_nop;
+	mtd->flags =3D MTD_CAP_RAM;
+
+	mtd->erasesize =3D PAGE_SIZE;
+ 	while(mtd->size & (mtd->erasesize - 1))
+		mtd->erasesize >>=3D 1;
+
+	MOD_INC_USE_COUNT;
+	return mtd;
+}
=20
 static int mapram_read (struct mtd_info *mtd, loff_t from, size_t len, siz=
e_t *retlen, u_char *buf)
 {
@@ -107,6 +141,8 @@
 	for (i=3D0; i<instr->len; i++)
 		map->write8(map, 0xFF, instr->addr + i);
=20
+	instr->state =3D MTD_ERASE_DONE;
+
 	if (instr->callback)
 		instr->callback(instr);
=20
@@ -121,12 +157,14 @@
 int __init map_ram_init(void)
 {
 	register_mtd_chip_driver(&mapram_chipdrv);
+	register_mtd_chip_driver(&mapsram_chipdrv);
 	return 0;
 }
=20
 static void __exit map_ram_exit(void)
 {
 	unregister_mtd_chip_driver(&mapram_chipdrv);
+	unregister_mtd_chip_driver(&mapsram_chipdrv);
 }
=20
 module_init(map_ram_init);

--=-VRJhKCRo6gKDvdRn8zYx--
