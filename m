Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BYa9R-00006x-8t
	for linux-mtd@lists.infradead.org; Thu, 10 Jun 2004 20:44:12 -0400
Date: Thu, 10 Jun 2004 17:44:04 -0700
From: Jun Sun <jsun@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20040610174404.O10411@mvista.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline
Cc: 
Subject: [PATCH] add config options for phys mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Due to popular demand, this patch adds back config time
options for configuring phys mapping.

The run-time configuration, if present, overrides the config-time
options.

Jun


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="040610.a-mtd-physmap-config-options.patch"

diff -Nru mtd/drivers/mtd/maps/physmap.c.orig mtd/drivers/mtd/maps/physmap.c
--- mtd/drivers/mtd/maps/physmap.c.orig	2004-06-05 02:44:48.000000000 -0700
+++ mtd/drivers/mtd/maps/physmap.c	2004-06-10 17:35:12.000000000 -0700
@@ -22,7 +22,12 @@
 
 static struct mtd_info *mymtd;
 
-struct map_info physmap_map = {.name = "phys_mapped_flash"};
+struct map_info physmap_map = {
+	.name = "phys_mapped_flash",
+	.phys = CONFIG_MTD_PHYSMAP_START,
+	.size = CONFIG_MTD_PHYSMAP_LEN,
+	.buswidth = CONFIG_MTD_PHYSMAP_BUSWIDTH,
+};
 
 #ifdef CONFIG_MTD_PARTITIONS
 static struct mtd_partition *mtd_parts;
diff -Nru mtd/drivers/mtd/maps/Kconfig.orig mtd/drivers/mtd/maps/Kconfig
--- mtd/drivers/mtd/maps/Kconfig.orig	2004-06-07 03:21:32.000000000 -0700
+++ mtd/drivers/mtd/maps/Kconfig	2004-06-10 17:37:04.000000000 -0700
@@ -19,7 +19,8 @@
 	  command set driver code to communicate with flash chips which
 	  are mapped physically into the CPU's memory. You will need to
 	  configure the physical address and size of the flash chips on
-	  your particular board as well as the bus width.
+	  your particular board as well as the bus width, either statically
+	  with config options or at run-time.
 
 config MTD_PHYSMAP_START
 	hex "Physical start address of flash mapping"
@@ -31,6 +32,9 @@
 	  memory map which should hopefully be in the documentation for
 	  your board.
 
+	  Ignore this option if you use run-time physmap configuration
+	  (i.e., run-time calling physmap_configure()).
+
 config MTD_PHYSMAP_LEN
 	hex "Physical length of flash mapping"
 	depends on MTD_PHYSMAP
@@ -43,6 +47,9 @@
 	  map which should hopefully be in the documentation for your
 	  board.
 
+	  Ignore this option if you use run-time physmap configuration
+	  (i.e., run-time calling physmap_configure()).
+
 config MTD_PHYSMAP_BUSWIDTH
 	int "Bus width in octets"
 	depends on MTD_PHYSMAP
@@ -53,6 +60,9 @@
 	  bits, you would set the bus width octect value to 4. This is
 	  used internally by the CFI drivers.
 
+	  Ignore this option if you use run-time physmap configuration
+	  (i.e., run-time calling physmap_configure()).
+
 config MTD_SUN_UFLASH
 	tristate "Sun Microsystems userflash support"
 	depends on (SPARC32 || SPARC64) && MTD_CFI
diff -Nru mtd/drivers/mtd/maps/Config.in.orig mtd/drivers/mtd/maps/Config.in
--- mtd/drivers/mtd/maps/Config.in.orig	2004-04-11 23:38:39.000000000 -0700
+++ mtd/drivers/mtd/maps/Config.in	2004-06-10 17:36:24.000000000 -0700
@@ -9,6 +9,11 @@
 bool '  Support for non-linear mappings of flash chips' CONFIG_MTD_COMPLEX_MAPPINGS
 
 bool '  CFI Flash device in physical memory map' CONFIG_MTD_PHYSMAP $CONFIG_MTD_GEN_PROBE
+if [ "$CONFIG_MTD_PHYSMAP" = "y" ]; then
+   hex '    Physical start address of flash mapping' CONFIG_MTD_PHYSMAP_START 0x8000000
+   hex '    Physical length of flash mapping' CONFIG_MTD_PHYSMAP_LEN 0x4000000
+   int '    Bus width in octets' CONFIG_MTD_PHYSMAP_BUSWIDTH 2
+fi
 
 if [ "$CONFIG_SPARC" = "y" -o "$CONFIG_SPARC64" = "y" ]; then
    dep_tristate '  Sun Microsystems userflash support' CONFIG_MTD_SUN_UFLASH $CONFIG_MTD_CFI

--A6N2fC+uXW/VQSAv--
