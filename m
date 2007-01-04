Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H2WYj-0003Xa-IL
	for linux-mtd@lists.infradead.org; Thu, 04 Jan 2007 12:39:26 -0500
Received: from malvek.artecdesign.ee ([62.65.32.4] helo=moby)
	by postikukk.artecdesign.ee with smtp (Exim 4.50) id 1H2Waj-0005fe-FM
	for linux-mtd@lists.infradead.org; Thu, 04 Jan 2007 19:41:30 +0200
Date: Thu, 4 Jan 2007 19:41:14 +0200
From: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] cs553x_nand.c: support partitions, cs553x_cleanup()
	fix (take 2)
Message-Id: <20070104194114.53490a0d.indrek.kruusa@artecdesign.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Take 2. Basic (and maybe too simple ;)) naming added for chip selects.

Patch for drivers/mtd/nand/cs553x_nand.c:
- support partitions
- cs553x_cleanup(): try the cleanup for all chip selects

Signed-off-by: Indrek Kruusa <indrek.kruusa@artecdesign.ee>


dmesg:

Probing CS553x NAND controller CS#1 at MMIO 0x20000000
NAND device: Manufacturer ID: 0x98, Chip ID: 0x76 (Toshiba NAND 64MiB 3,3V 8-bit)
2 cmdlinepart partitions found on MTD device cs553x_nand_cs1
Using command line partition definition
Creating 2 MTD partitions on "cs553x_nand_cs1":
0x00000000-0x00600000 : "kernel"
0x00800000-0x03e00000 : "root"





--- mtd-2.6/drivers/mtd/nand/cs553x_nand.c	2007-01-04 17:43:44.000000000 +0200
+++ ik-2.6/drivers/mtd/nand/cs553x_nand.c	2007-01-04 19:21:29.000000000 +0200
@@ -13,6 +13,9 @@
  *  Overview:
  *   This is a device driver for the NAND flash controller found on
  *   the AMD CS5535/CS5536 companion chipsets for the Geode processor.
+ *   Partition table can be defined on command line as follows:
+ *          mtdparts=cs553x_nand_cs1:6m@0m(kernel),54m@8m(root)
+ *   , where cs553x_nand_cs[0-3] reflects the chip select for NAND
  *
  */
 
@@ -186,6 +189,7 @@
 	int err = 0;
 	struct nand_chip *this;
 	struct mtd_info *new_mtd;
+	char mtd_name[16] = "cs553x_nand_csX\0";
 
 	printk(KERN_NOTICE "Probing CS553x NAND controller CS#%d at %sIO 0x%08lx\n", cs, mmio?"MM":"P", adr);
 
@@ -245,6 +249,9 @@
 		goto out_ior;
 	}
 
+	mtd_name[14] = (char)(48 + cs);
+	new_mtd->name = (char*)mtd_name;
+
 	cs553x_mtd[cs] = new_mtd;
 	goto out;
 
@@ -273,12 +280,21 @@
 	return 0;
 }
 
+
+#ifdef CONFIG_MTD_PARTITIONS
+const char *part_probes[] = { "cmdlinepart", NULL };
+#endif
+
+
 static int __init cs553x_init(void)
 {
 	int err = -ENXIO;
 	int i;
 	uint64_t val;
 
+	int mtd_parts_nb = 0;
+	struct mtd_partition *mtd_parts = NULL;
+
 	/* If the CPU isn't a Geode GX or LX, abort */
 	if (!is_geode())
 		return -ENXIO;
@@ -307,9 +323,19 @@
 	   do mtdconcat etc. if we want to. */
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		if (cs553x_mtd[i]) {
-			add_mtd_device(cs553x_mtd[i]);
 
 			/* If any devices registered, return success. Else the last error. */
+#ifdef CONFIG_MTD_PARTITIONS
+			mtd_parts_nb = parse_mtd_partitions(cs553x_mtd[i], part_probes, &mtd_parts, 0);
+			if (mtd_parts_nb > 0) {
+				printk(KERN_NOTICE "Using command line partition definition\n");
+				add_mtd_partitions(cs553x_mtd[i], mtd_parts, mtd_parts_nb);
+			} else {
+				add_mtd_device(cs553x_mtd[i]);
+			}
+#else
+			add_mtd_device(cs553x_mtd[i]);
+#endif
 			err = 0;
 		}
 	}
@@ -329,7 +355,7 @@
 		void __iomem *mmio_base;
 
 		if (!mtd)
-			break;
+			continue;
 
 		this = cs553x_mtd[i]->priv;
 		mmio_base = this->IO_ADDR_R;
