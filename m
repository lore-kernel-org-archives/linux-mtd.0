Received: from ip10.savigear.adsl.uk.xo.com ([195.147.222.170] helo=xerp.secret.org.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17FaBV-0006PY-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2002 13:46:42 +0100
Received: from spoinky.renegade.org.uk ([192.168.1.2])
	by xerp.secret.org.uk with esmtp (Exim 3.33 #1)
	id 17FaBR-00042t-00
	for linux-mtd@lists.infradead.org; Wed, 05 Jun 2002 13:46:37 +0100
Received: from localhost ([127.0.0.1] helo=secret.org.uk)
	by spoinky.renegade.org.uk with esmtp (Exim 3.35 #1 (Debian))
	id 17FaBQ-0005du-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2002 13:46:36 +0100
From: Simon Evans <spse@secret.org.uk>
To: linux-mtd@lists.infradead.org
Subject: Add sharp_probe into jedec_probe
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Jun 2002 13:46:35 +0100
Message-Id: <E17FaBQ-0005du-00@spoinky.renegade.org.uk>
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

Hi, 

I just wanted to see if anyone had any objections to me committing the below
patch to CVS. Basically I have some sharp chips that almost work with the
normal jedec_probe routine however they do not like the Autoselect Command.

The patch below adds a second probing function `sharp_probe' to jedec_probe.c
that handles this difference. Is it ok to put this into the same file? 
I thought it would be preferable to putting it into a second file since so
much of the jedec code is reused.

Comments?

cheers
si


Index: jedec_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/jedec_probe.c,v
retrieving revision 1.15
diff -u -r1.15 jedec_probe.c
--- jedec_probe.c	17 May 2002 08:48:57 -0000	1.15
+++ jedec_probe.c	5 Jun 2002 12:21:54 -0000
@@ -870,37 +880,13 @@
 	return 1; 	/* ok */
 }
 
-static int jedec_probe_chip(struct map_info *map, __u32 base,
-			      struct flchip *chips, struct cfi_private *cfi)
+
+static int do_jedec_probe_chip(struct map_info *map, __u32 base, struct flchip *chips, struct cfi_private *cfi)
+
 {
 	int i;
 	int retried = 0;
 
-	if (!cfi->numchips) {
-		switch (cfi->device_type) {
-		case CFI_DEVICETYPE_X8:
-			cfi->addr_unlock1 = 0x555; 
-			cfi->addr_unlock2 = 0x2aa; 
-			break;
-		case CFI_DEVICETYPE_X16:
-			cfi->addr_unlock1 = 0xaaa;
-			if (map->buswidth == cfi->interleave) {
-				/* X16 chip(s) in X8 mode */
-				cfi->addr_unlock2 = 0x555;
-			} else {
-				cfi->addr_unlock2 = 0x554;
-			}
-			break;
-		case CFI_DEVICETYPE_X32:
-			cfi->addr_unlock1 = 0x1555; 
-			cfi->addr_unlock2 = 0xaaa; 
-			break;
-		default:
-			printk(KERN_NOTICE "Eep. Unknown jedec_probe device type %d\n", cfi->device_type);
-		return 0;
-		}
-	}
-
  retry:
 	/* Make certain we aren't probing past the end of map */
 	if (base >= map->size) {
@@ -928,9 +914,14 @@
 	/* Reset */
 	jedec_reset(base, map, cfi);
 
-	/* Autoselect Mode */
-	cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	/* Autoselect Mode - Some sharp chips dont like these two commands. 
+	 * sharp_probe sets addr->unlock1 = 0, jedec_probe sets addr->unlock1
+	 * to a !0 address
+	 */
+	if(cfi->addr_unlock1) {
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	}
 	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
 
 	if (!cfi->numchips) {
@@ -1025,11 +1016,84 @@
 	return 1;
 }
 
+
+static int jedec_probe_chip(struct map_info *map, __u32 base,
+			      struct flchip *chips, struct cfi_private *cfi)
+{
+	if (!cfi->numchips) {
+		switch (cfi->device_type) {
+		case CFI_DEVICETYPE_X8:
+			cfi->addr_unlock1 = 0x555; 
+			cfi->addr_unlock2 = 0x2aa; 
+			break;
+		case CFI_DEVICETYPE_X16:
+			cfi->addr_unlock1 = 0xaaa;
+			if (map->buswidth == cfi->interleave) {
+				/* X16 chip(s) in X8 mode */
+				cfi->addr_unlock2 = 0x555;
+			} else {
+				cfi->addr_unlock2 = 0x554;
+			}
+			break;
+		case CFI_DEVICETYPE_X32:
+			cfi->addr_unlock1 = 0x1555; 
+			cfi->addr_unlock2 = 0xaaa; 
+			break;
+		default:
+			printk(KERN_NOTICE "Eep. Unknown jedec_probe device type %d\n", cfi->device_type);
+		return 0;
+		}
+	}
+	return do_jedec_probe_chip(map, base, chips, cfi);
+}
+
+
+static int sharp_probe_chip(struct map_info *map, __u32 base,
+			      struct flchip *chips, struct cfi_private *cfi)
+{
+
+
+	if (!cfi->numchips) {
+		switch (cfi->device_type) {
+		case CFI_DEVICETYPE_X8:
+			cfi->addr_unlock1 = 0x0; 
+			cfi->addr_unlock2 = 0x1; 
+			break;
+		case CFI_DEVICETYPE_X16:
+			cfi->addr_unlock1 = 0x0;
+			if (map->buswidth == cfi->interleave) {
+				/* X16 chip(s) in X8 mode */
+				cfi->addr_unlock2 = 0x1;
+			} else {
+				cfi->addr_unlock2 = 0x2;
+			}
+			break;
+		case CFI_DEVICETYPE_X32:
+			cfi->addr_unlock1 = 0x0; 
+			cfi->addr_unlock2 = 0x4; 
+			break;
+		default:
+			printk(KERN_NOTICE "Eep. Unknown sharp_probe device type %d\n", cfi->device_type);
+		return 0;
+		}
+	}
+	return do_jedec_probe_chip(map, base, chips, cfi);
+}
+
+
+
 static struct chip_probe jedec_chip_probe = {
 	name: "JEDEC",
 	probe_chip: jedec_probe_chip
 };
 
+
+static struct chip_probe sharp_chip_probe = {
+	name: "SHARP",
+	probe_chip: sharp_probe_chip
+};
+
+
 struct mtd_info *jedec_probe(struct map_info *map)
 {
 	/*
@@ -1039,21 +1103,40 @@
 	return mtd_do_chip_probe(map, &jedec_chip_probe);
 }
 
+struct mtd_info *sharp_probe(struct map_info *map)
+{
+	/*
+	 * This is for chips that work with the jedec_probe except
+	 * they dont like the autoselect command.
+	 */
+	return mtd_do_chip_probe(map, &sharp_chip_probe);
+}
+
 static struct mtd_chip_driver jedec_chipdrv = {
 	probe: jedec_probe,
 	name: "jedec_probe",
 	module: THIS_MODULE
 };
 
+
+static struct mtd_chip_driver sharp_chipdrv = {
+	probe: sharp_probe,
+	name: "sharp_probe",
+	module: THIS_MODULE
+};
+
+
 int __init jedec_probe_init(void)
 {
 	register_mtd_chip_driver(&jedec_chipdrv);
+	register_mtd_chip_driver(&sharp_chipdrv);
 	return 0;
 }
 
 static void __exit jedec_probe_exit(void)
 {
 	unregister_mtd_chip_driver(&jedec_chipdrv);
+	unregister_mtd_chip_driver(&sharp_chipdrv);
 }
 
 module_init(jedec_probe_init);
