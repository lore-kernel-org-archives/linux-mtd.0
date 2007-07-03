Received: from elcamino.pasemi.com ([67.155.108.98])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I5sCB-0003v9-9v
	for linux-mtd@lists.infradead.org; Tue, 03 Jul 2007 19:54:14 -0400
Date: Tue, 3 Jul 2007 16:54:07 -0700
From: Egor Martovetsky <egor@pasemi.com>
Message-Id: <200707032354.l63Ns7gh010492@escobita.pasemi.com>
To: dwmw2@infradead.org, egor@pasemi.com,
	linux-mtd@lists.infradead.org, olof@lixom.net, tglx@linutronix.de
Subject: [PATCH] [2.6.23] nand_flash_dev - add manufacturer ID
Cc: c@pasemi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Patch for adding the manufacturer's ID to the nand_flash_dev
struct.  This is needed to avoid selecting wrong flash device,
when device ID happens to be the same for different devices.
This change was prompted by addition of Micron MT29F4G08BABWP,
whose device ID(0xDC), matches a device ID of a Samsung flash.

Signed-off-by: Egor Martovetsky <egor@pasemi.com>

Index: linux/drivers/mtd/nand/nand_base.c
===================================================================
--- linux.orig/drivers/mtd/nand/nand_base.c
+++ linux/drivers/mtd/nand/nand_base.c
@@ -2237,9 +2237,13 @@ static struct nand_flash_dev *nand_get_f
 
 	/* Lookup the flash id */
 	for (i = 0; nand_flash_ids[i].name != NULL; i++) {
-		if (dev_id == nand_flash_ids[i].id) {
-			type =  &nand_flash_ids[i];
-			break;
+		if (dev_id == nand_flash_ids[i].dev_id) {
+			if (type == NULL)
+				type = &nand_flash_ids[i];
+			else if (*maf_id == nand_flash_ids[i].mfr_id) {
+				type = &nand_flash_ids[i];
+				break;
+			}
 		}
 	}
 
@@ -2382,7 +2386,7 @@ int nand_scan_ident(struct mtd_info *mtd
 		chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 		/* Read manufacturer and device IDs */
 		if (nand_maf_id != chip->read_byte(mtd) ||
-		    type->id != chip->read_byte(mtd))
+		    type->dev_id != chip->read_byte(mtd))
 			break;
 	}
 	if (i > 1)
Index: linux/drivers/mtd/nand/nand_ids.c
===================================================================
--- linux.orig/drivers/mtd/nand/nand_ids.c
+++ linux/drivers/mtd/nand/nand_ids.c
@@ -15,8 +15,15 @@
 /*
 *	Chip ID list
 *
-*	Name. ID code, pagesize, chipsize in MegaByte, eraseblock size,
-*	options
+*	Name. manufacturer ID code, device ID code, pagesize,
+*	chipsize in MegaByte, eraseblock size, options
+*
+*	manufacturer ID code. Attempt to match a device by both
+*	manufacturer and device IDs. If that doesn't succeed then
+*	match the first entry with matching device ID.  Eventually, there
+*	shouldn't be unspecified manufacturers since only manufacturer ID,
+*	device ID pair uniquely identify the device.
+*	-1	means unspecified
 *
 *	Pagesize; 0, 256, 512
 *	0	get this information from the extended chip ID
@@ -26,47 +33,51 @@
 struct nand_flash_dev nand_flash_ids[] = {
 
 #ifdef CONFIG_MTD_NAND_MUSEUM_IDS
-	{"NAND 1MiB 5V 8-bit",		0x6e, 256, 1, 0x1000, 0},
-	{"NAND 2MiB 5V 8-bit",		0x64, 256, 2, 0x1000, 0},
-	{"NAND 4MiB 5V 8-bit",		0x6b, 512, 4, 0x2000, 0},
-	{"NAND 1MiB 3,3V 8-bit",	0xe8, 256, 1, 0x1000, 0},
-	{"NAND 1MiB 3,3V 8-bit",	0xec, 256, 1, 0x1000, 0},
-	{"NAND 2MiB 3,3V 8-bit",	0xea, 256, 2, 0x1000, 0},
-	{"NAND 4MiB 3,3V 8-bit",	0xd5, 512, 4, 0x2000, 0},
-	{"NAND 4MiB 3,3V 8-bit",	0xe3, 512, 4, 0x2000, 0},
-	{"NAND 4MiB 3,3V 8-bit",	0xe5, 512, 4, 0x2000, 0},
-	{"NAND 8MiB 3,3V 8-bit",	0xd6, 512, 8, 0x2000, 0},
-
-	{"NAND 8MiB 1,8V 8-bit",	0x39, 512, 8, 0x2000, 0},
-	{"NAND 8MiB 3,3V 8-bit",	0xe6, 512, 8, 0x2000, 0},
-	{"NAND 8MiB 1,8V 16-bit",	0x49, 512, 8, 0x2000, NAND_BUSWIDTH_16},
-	{"NAND 8MiB 3,3V 16-bit",	0x59, 512, 8, 0x2000, NAND_BUSWIDTH_16},
+	{"NAND 1MiB 5V 8-bit", -1, 0x6e, 256, 1, 0x1000, 0},
+	{"NAND 2MiB 5V 8-bit", -1, 0x64, 256, 2, 0x1000, 0},
+	{"NAND 4MiB 5V 8-bit", -1, 0x6b, 512, 4, 0x2000, 0},
+	{"NAND 1MiB 3,3V 8-bit", -1, 0xe8, 256, 1, 0x1000, 0},
+	{"NAND 1MiB 3,3V 8-bit", -1, 0xec, 256, 1, 0x1000, 0},
+	{"NAND 2MiB 3,3V 8-bit", -1, 0xea, 256, 2, 0x1000, 0},
+	{"NAND 4MiB 3,3V 8-bit", -1, 0xd5, 512, 4, 0x2000, 0},
+	{"NAND 4MiB 3,3V 8-bit", -1, 0xe3, 512, 4, 0x2000, 0},
+	{"NAND 4MiB 3,3V 8-bit", -1, 0xe5, 512, 4, 0x2000, 0},
+	{"NAND 8MiB 3,3V 8-bit", -1, 0xd6, 512, 8, 0x2000, 0},
+
+	{"NAND 8MiB 1,8V 8-bit", -1, 0x39, 512, 8, 0x2000, 0},
+	{"NAND 8MiB 3,3V 8-bit", -1, 0xe6, 512, 8, 0x2000, 0},
+	{"NAND 8MiB 1,8V 16-bit", -1, 0x49, 512, 8, 0x2000, NAND_BUSWIDTH_16},
+	{"NAND 8MiB 3,3V 16-bit", -1, 0x59, 512, 8, 0x2000, NAND_BUSWIDTH_16},
 #endif
 
-	{"NAND 16MiB 1,8V 8-bit",	0x33, 512, 16, 0x4000, 0},
-	{"NAND 16MiB 3,3V 8-bit",	0x73, 512, 16, 0x4000, 0},
-	{"NAND 16MiB 1,8V 16-bit",	0x43, 512, 16, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 16MiB 3,3V 16-bit",	0x53, 512, 16, 0x4000, NAND_BUSWIDTH_16},
-
-	{"NAND 32MiB 1,8V 8-bit",	0x35, 512, 32, 0x4000, 0},
-	{"NAND 32MiB 3,3V 8-bit",	0x75, 512, 32, 0x4000, 0},
-	{"NAND 32MiB 1,8V 16-bit",	0x45, 512, 32, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 32MiB 3,3V 16-bit",	0x55, 512, 32, 0x4000, NAND_BUSWIDTH_16},
-
-	{"NAND 64MiB 1,8V 8-bit",	0x36, 512, 64, 0x4000, 0},
-	{"NAND 64MiB 3,3V 8-bit",	0x76, 512, 64, 0x4000, 0},
-	{"NAND 64MiB 1,8V 16-bit",	0x46, 512, 64, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 64MiB 3,3V 16-bit",	0x56, 512, 64, 0x4000, NAND_BUSWIDTH_16},
-
-	{"NAND 128MiB 1,8V 8-bit",	0x78, 512, 128, 0x4000, 0},
-	{"NAND 128MiB 1,8V 8-bit",	0x39, 512, 128, 0x4000, 0},
-	{"NAND 128MiB 3,3V 8-bit",	0x79, 512, 128, 0x4000, 0},
-	{"NAND 128MiB 1,8V 16-bit",	0x72, 512, 128, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 128MiB 1,8V 16-bit",	0x49, 512, 128, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 128MiB 3,3V 16-bit",	0x74, 512, 128, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 128MiB 3,3V 16-bit",	0x59, 512, 128, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 16MiB 1,8V 8-bit", -1, 0x33, 512, 16, 0x4000, 0},
+	{"NAND 16MiB 3,3V 8-bit", -1, 0x73, 512, 16, 0x4000, 0},
+	{"NAND 16MiB 1,8V 16-bit", -1, 0x43, 512, 16, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 16MiB 3,3V 16-bit", -1, 0x53, 512, 16, 0x4000, NAND_BUSWIDTH_16},
+
+	{"NAND 32MiB 1,8V 8-bit", -1, 0x35, 512, 32, 0x4000, 0},
+	{"NAND 32MiB 3,3V 8-bit", -1, 0x75, 512, 32, 0x4000, 0},
+	{"NAND 32MiB 1,8V 16-bit", -1, 0x45, 512, 32, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 32MiB 3,3V 16-bit", -1, 0x55, 512, 32, 0x4000, NAND_BUSWIDTH_16},
+
+	{"NAND 64MiB 1,8V 8-bit", -1, 0x36, 512, 64, 0x4000, 0},
+	{"NAND 64MiB 3,3V 8-bit", -1, 0x76, 512, 64, 0x4000, 0},
+	{"NAND 64MiB 1,8V 16-bit", -1, 0x46, 512, 64, 0x4000, NAND_BUSWIDTH_16},
+	{"NAND 64MiB 3,3V 16-bit", -1, 0x56, 512, 64, 0x4000, NAND_BUSWIDTH_16},
+
+	{"NAND 128MiB 1,8V 8-bit", -1, 0x78, 512, 128, 0x4000, 0},
+	{"NAND 128MiB 1,8V 8-bit", -1, 0x39, 512, 128, 0x4000, 0},
+	{"NAND 128MiB 3,3V 8-bit", -1, 0x79, 512, 128, 0x4000, 0},
+	{"NAND 128MiB 1,8V 16-bit", -1, 0x72, 512, 128, 0x4000,
+	 NAND_BUSWIDTH_16},
+	{"NAND 128MiB 1,8V 16-bit", -1, 0x49, 512, 128, 0x4000,
+	 NAND_BUSWIDTH_16},
+	{"NAND 128MiB 3,3V 16-bit", -1, 0x74, 512, 128, 0x4000,
+	 NAND_BUSWIDTH_16},
+	{"NAND 128MiB 3,3V 16-bit", -1, 0x59, 512, 128, 0x4000,
+	 NAND_BUSWIDTH_16},
 
-	{"NAND 256MiB 3,3V 8-bit",	0x71, 512, 256, 0x4000, 0},
+	{"NAND 256MiB 3,3V 8-bit", -1, 0x71, 512, 256, 0x4000, 0},
 
 	/*
 	 * These are the new chips with large page size. The pagesize and the
@@ -76,40 +87,40 @@ struct nand_flash_dev nand_flash_ids[] =
 #define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
 
 	/*512 Megabit */
-	{"NAND 64MiB 1,8V 8-bit",	0xA2, 0,  64, 0, LP_OPTIONS},
-	{"NAND 64MiB 3,3V 8-bit",	0xF2, 0,  64, 0, LP_OPTIONS},
-	{"NAND 64MiB 1,8V 16-bit",	0xB2, 0,  64, 0, LP_OPTIONS16},
-	{"NAND 64MiB 3,3V 16-bit",	0xC2, 0,  64, 0, LP_OPTIONS16},
+	{"NAND 64MiB 1,8V 8-bit", -1, 0xA2, 0,  64, 0, LP_OPTIONS},
+	{"NAND 64MiB 3,3V 8-bit", -1, 0xF2, 0,  64, 0, LP_OPTIONS},
+	{"NAND 64MiB 1,8V 16-bit", -1, 0xB2, 0,  64, 0, LP_OPTIONS16},
+	{"NAND 64MiB 3,3V 16-bit", -1, 0xC2, 0,  64, 0, LP_OPTIONS16},
 
 	/* 1 Gigabit */
-	{"NAND 128MiB 1,8V 8-bit",	0xA1, 0, 128, 0, LP_OPTIONS},
-	{"NAND 128MiB 3,3V 8-bit",	0xF1, 0, 128, 0, LP_OPTIONS},
-	{"NAND 128MiB 1,8V 16-bit",	0xB1, 0, 128, 0, LP_OPTIONS16},
-	{"NAND 128MiB 3,3V 16-bit",	0xC1, 0, 128, 0, LP_OPTIONS16},
+	{"NAND 128MiB 1,8V 8-bit", -1, 0xA1, 0, 128, 0, LP_OPTIONS},
+	{"NAND 128MiB 3,3V 8-bit", -1, 0xF1, 0, 128, 0, LP_OPTIONS},
+	{"NAND 128MiB 1,8V 16-bit", -1, 0xB1, 0, 128, 0, LP_OPTIONS16},
+	{"NAND 128MiB 3,3V 16-bit", -1, 0xC1, 0, 128, 0, LP_OPTIONS16},
 
 	/* 2 Gigabit */
-	{"NAND 256MiB 1,8V 8-bit",	0xAA, 0, 256, 0, LP_OPTIONS},
-	{"NAND 256MiB 3,3V 8-bit",	0xDA, 0, 256, 0, LP_OPTIONS},
-	{"NAND 256MiB 1,8V 16-bit",	0xBA, 0, 256, 0, LP_OPTIONS16},
-	{"NAND 256MiB 3,3V 16-bit",	0xCA, 0, 256, 0, LP_OPTIONS16},
+	{"NAND 256MiB 1,8V 8-bit", -1, 0xAA, 0, 256, 0, LP_OPTIONS},
+	{"NAND 256MiB 3,3V 8-bit", -1, 0xDA, 0, 256, 0, LP_OPTIONS},
+	{"NAND 256MiB 1,8V 16-bit", -1, 0xBA, 0, 256, 0, LP_OPTIONS16},
+	{"NAND 256MiB 3,3V 16-bit", -1, 0xCA, 0, 256, 0, LP_OPTIONS16},
 
 	/* 4 Gigabit */
-	{"NAND 512MiB 1,8V 8-bit",	0xAC, 0, 512, 0, LP_OPTIONS},
-	{"NAND 512MiB 3,3V 8-bit",	0xDC, 0, 512, 0, LP_OPTIONS},
-	{"NAND 512MiB 1,8V 16-bit",	0xBC, 0, 512, 0, LP_OPTIONS16},
-	{"NAND 512MiB 3,3V 16-bit",	0xCC, 0, 512, 0, LP_OPTIONS16},
+	{"NAND 512MiB 1,8V 8-bit", -1, 0xAC, 0, 512, 0, LP_OPTIONS},
+	{"NAND 512MiB 3,3V 8-bit", -1, 0xDC, 0, 512, 0, LP_OPTIONS},
+	{"NAND 512MiB 1,8V 16-bit", -1, 0xBC, 0, 512, 0, LP_OPTIONS16},
+	{"NAND 512MiB 3,3V 16-bit", -1, 0xCC, 0, 512, 0, LP_OPTIONS16},
 
 	/* 8 Gigabit */
-	{"NAND 1GiB 1,8V 8-bit",	0xA3, 0, 1024, 0, LP_OPTIONS},
-	{"NAND 1GiB 3,3V 8-bit",	0xD3, 0, 1024, 0, LP_OPTIONS},
-	{"NAND 1GiB 1,8V 16-bit",	0xB3, 0, 1024, 0, LP_OPTIONS16},
-	{"NAND 1GiB 3,3V 16-bit",	0xC3, 0, 1024, 0, LP_OPTIONS16},
+	{"NAND 1GiB 1,8V 8-bit", -1, 0xA3, 0, 1024, 0, LP_OPTIONS},
+	{"NAND 1GiB 3,3V 8-bit", -1, 0xD3, 0, 1024, 0, LP_OPTIONS},
+	{"NAND 1GiB 1,8V 16-bit", -1, 0xB3, 0, 1024, 0, LP_OPTIONS16},
+	{"NAND 1GiB 3,3V 16-bit", -1, 0xC3, 0, 1024, 0, LP_OPTIONS16},
 
 	/* 16 Gigabit */
-	{"NAND 2GiB 1,8V 8-bit",	0xA5, 0, 2048, 0, LP_OPTIONS},
-	{"NAND 2GiB 3,3V 8-bit",	0xD5, 0, 2048, 0, LP_OPTIONS},
-	{"NAND 2GiB 1,8V 16-bit",	0xB5, 0, 2048, 0, LP_OPTIONS16},
-	{"NAND 2GiB 3,3V 16-bit",	0xC5, 0, 2048, 0, LP_OPTIONS16},
+	{"NAND 2GiB 1,8V 8-bit", -1, 0xA5, 0, 2048, 0, LP_OPTIONS},
+	{"NAND 2GiB 3,3V 8-bit", -1, 0xD5, 0, 2048, 0, LP_OPTIONS},
+	{"NAND 2GiB 1,8V 16-bit", -1, 0xB5, 0, 2048, 0, LP_OPTIONS16},
+	{"NAND 2GiB 3,3V 16-bit", -1, 0xC5, 0, 2048, 0, LP_OPTIONS16},
 
 	/*
 	 * Renesas AND 1 Gigabit. Those chips do not support extended id and
@@ -121,11 +132,16 @@ struct nand_flash_dev nand_flash_ids[] =
 	 * erased in one go There are more speed improvements for reads and
 	 * writes possible, but not implemented now
 	 */
-	{"AND 128MiB 3,3V 8-bit",	0x01, 2048, 128, 0x4000,
-	 NAND_IS_AND | NAND_NO_AUTOINCR |NAND_NO_READRDY | NAND_4PAGE_ARRAY |
+	{"AND 128MiB 3,3V 8-bit", NAND_MFR_RENESAS, 0x01, 2048, 128, 0x4000,
+	 NAND_IS_AND | NAND_NO_AUTOINCR | NAND_NO_READRDY | NAND_4PAGE_ARRAY |
 	 BBT_AUTO_REFRESH
 	},
 
+	/* Micron MT29F4G08BABWP 4 Gigabit device */
+	{"NAND 512MiB 3,3V 8-bit", NAND_MFR_MICRON, 0xDC, 0, 512, 0,
+	 NAND_NO_AUTOINCR | NAND_CACHEPRG | NAND_NO_READRDY
+	},
+
 	{NULL,}
 };
 
Index: linux/include/linux/mtd/nand.h
===================================================================
--- linux.orig/include/linux/mtd/nand.h
+++ linux/include/linux/mtd/nand.h
@@ -436,7 +436,8 @@ struct nand_chip {
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure
  * @name:	Identify the device type
- * @id:		device ID code
+ * @mfr_id:	manufacturer ID code
+ * @dev_id:	device ID code
  * @pagesize:	Pagesize in bytes. Either 256 or 512 or 0
  *		If the pagesize is 0, then the real pagesize
  *		and the eraseize are determined from the
@@ -447,7 +448,8 @@ struct nand_chip {
  */
 struct nand_flash_dev {
 	char *name;
-	int id;
+	int mfr_id;
+	int dev_id;
 	unsigned long pagesize;
 	unsigned long chipsize;
 	unsigned long erasesize;
