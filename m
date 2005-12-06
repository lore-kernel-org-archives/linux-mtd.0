Received: from smtp.mailbox.co.uk ([195.82.125.32])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ejh2K-0004WO-4g
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2005 12:55:40 -0500
Received: from apogee.jonmasters.org ([212.18.227.82]
	helo=pat.int.jonmasters.org)
	by smtp.mailbox.co.uk with esmtp (Exim 4.54) id 1Ejh2G-0005Dv-LI
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2005 17:55:29 +0000
Received: from jcm by pat.int.jonmasters.org with local (Exim 3.35 #1 (Debian))
	id 1Ejh0E-0007BX-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2005 17:53:22 +0000
Date: Tue, 6 Dec 2005 17:53:22 +0000
From: Jon Masters <jonathan@jonmasters.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20051206175321.GA14197@apogee.jonmasters.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Jon Masters <jcm@jonmasters.org>
Subject: 64-bit MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,
                                                                                
I'm doing some work on making a 64-bit version of MTD for Liberte
Software (http://www.libertesoft.co.uk/). I've attached a patch
against Montavista Linux Pro 3.1 (based on kernel 2.4.20). Please
don't consider this a final release but a work in progress.
                                                                                
This is successfully working in house with a suitably modified version
of YAFFS2. I will endeavour to finish cleaning this up and release a
patch for current 2.6 as soon as possible. We will followup with some
more mails about DMA in MTD and performance improvements for YAFFS2.
                                                                                
Jon.

diff -urN kernel-2.4.20_orig/drivers/mtd/chips/cfi_cmdset_0001.c kernel-2.4.20/drivers/mtd/chips/cfi_cmdset_0001.c
--- kernel-2.4.20_orig/drivers/mtd/chips/cfi_cmdset_0001.c	2005-10-13 16:49:46.000000000 +0100
+++ kernel-2.4.20/drivers/mtd/chips/cfi_cmdset_0001.c	2005-11-30 13:17:28.000000000 +0000
@@ -24,6 +24,7 @@
 #include <linux/init.h>
 #include <asm/io.h>
 #include <asm/byteorder.h>
+#include <asm/div64.h>
 
 #include <linux/errno.h>
 #include <linux/slab.h>
@@ -1195,7 +1196,7 @@
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long adr;
+	u_int64_t adr, mvl_tmp_1, mvl_tmp_2;
 	int chipnum, ret = 0;
 	int i, first;
 	struct mtd_erase_region_info *regions = mtd->eraseregions;
@@ -1263,7 +1264,10 @@
 		adr += regions[i].erasesize;
 		len -= regions[i].erasesize;
 
-		if (adr % (1<< cfi->chipshift) == ((regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
+		//if (adr % (1<< cfi->chipshift) == ((regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
+		mvl_tmp_1 = adr;
+		mvl_tmp_2 = (regions[i].offset + (regions[i].erasesize * regions[i].numblocks));
+		if (do_div(mvl_tmp_1,(1<< cfi->chipshift)) == do_div(mvl_tmp_2,( 1<< cfi->chipshift)))
 			i++;
 
 		if (adr >> cfi->chipshift) {
diff -urN kernel-2.4.20_orig/drivers/mtd/chips/cfi_cmdset_0002.c kernel-2.4.20/drivers/mtd/chips/cfi_cmdset_0002.c
--- kernel-2.4.20_orig/drivers/mtd/chips/cfi_cmdset_0002.c	2005-10-13 16:49:46.000000000 +0100
+++ kernel-2.4.20/drivers/mtd/chips/cfi_cmdset_0002.c	2005-11-30 13:14:14.000000000 +0000
@@ -25,6 +25,7 @@
 #include <linux/init.h>
 #include <asm/io.h>
 #include <asm/byteorder.h>
+#include <asm/div64.h>
 
 #include <linux/errno.h>
 #include <linux/slab.h>
@@ -1326,7 +1327,7 @@
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long adr;
+	u_int64_t adr, mvl_tmp_1, mvl_tmp_2;
 	int chipnum, ret = 0;
 	int i, first;
 	struct mtd_erase_region_info *regions = mtd->eraseregions;
@@ -1394,7 +1395,10 @@
 		adr += regions[i].erasesize;
 		len -= regions[i].erasesize;
 
-		if (adr % (1<< cfi->chipshift) == ((regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
+		//if (adr % (1<< cfi->chipshift) == ((regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
+		mvl_tmp_1 = adr;
+		mvl_tmp_2 = (regions[i].offset + (regions[i].erasesize * regions[i].numblocks));
+		if (do_div(mvl_tmp_1,(1<< cfi->chipshift)) == do_div(mvl_tmp_2,( 1<< cfi->chipshift)))
 			i++;
 
 		if (adr >> cfi->chipshift) {
diff -urN kernel-2.4.20_orig/drivers/mtd/chips/cfi_cmdset_0020.c kernel-2.4.20/drivers/mtd/chips/cfi_cmdset_0020.c
--- kernel-2.4.20_orig/drivers/mtd/chips/cfi_cmdset_0020.c	2004-07-07 13:56:41.000000000 +0100
+++ kernel-2.4.20/drivers/mtd/chips/cfi_cmdset_0020.c	2005-11-30 13:14:00.000000000 +0000
@@ -24,6 +24,7 @@
 #include <linux/init.h>
 #include <asm/io.h>
 #include <asm/byteorder.h>
+#include <asm/div64.h>
 
 #include <linux/errno.h>
 #include <linux/init.h>
@@ -887,7 +888,7 @@
 int cfi_staa_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
 {	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long adr, len;
+	u_int64_t adr, len, mvl_tmp_1, mvl_tmp_2;
 	int chipnum, ret = 0;
 	int i, first;
 	struct mtd_erase_region_info *regions = mtd->eraseregions;
@@ -955,8 +956,11 @@
 
 		adr += regions[i].erasesize;
 		len -= regions[i].erasesize;
-
-		if (adr % (1<< cfi->chipshift) == ((regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
+	
+		//if (adr % (1<< cfi->chipshift) == ((regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
+		mvl_tmp_1 = adr;
+		mvl_tmp_2 = (regions[i].offset + (regions[i].erasesize * regions[i].numblocks));
+		if (do_div(mvl_tmp_1,(1<< cfi->chipshift)) == do_div(mvl_tmp_2,( 1<< cfi->chipshift)))
 			i++;
 
 		if (adr >> cfi->chipshift) {
diff -urN kernel-2.4.20_orig/drivers/mtd/mtdchar.c kernel-2.4.20/drivers/mtd/mtdchar.c
--- kernel-2.4.20_orig/drivers/mtd/mtdchar.c	2005-10-13 16:49:46.000000000 +0100
+++ kernel-2.4.20/drivers/mtd/mtdchar.c	2005-11-30 15:03:39.000000000 +0000
@@ -296,8 +296,10 @@
 
 	case MEMGETINFO:
 		if (copy_to_user((struct mtd_info *)arg, mtd,
-				 sizeof(struct mtd_info_user)))
+				 sizeof(struct mtd_info_user))) {
+			printk("MVL_DEBUG: can't copy mtd_info in ioctl.\n");
 			return -EFAULT;
+		}
 		break;
 
 	case MEMERASE:
@@ -317,11 +319,14 @@
 			init_waitqueue_head(&waitq);
 
 			memset (erase,0,sizeof(struct erase_info));
-			if (copy_from_user(&erase->addr, (u_long *)arg,
-					   2 * sizeof(u_long))) {
+			if (copy_from_user(&erase->addr, (u_int64_t *)arg,
+					   2 * sizeof(u_int64_t))) {
 				kfree(erase);
 				return -EFAULT;
 			}
+			//printk("MVL_DEBUG: MEMERASE: erase->addr: 0x%08llx, length: 0x%llx.\n",
+			//erase->addr,erase->len);
+
 			erase->mtd = mtd;
 			erase->callback = mtd_erase_callback;
 			erase->priv = (unsigned long)&waitq;
@@ -367,6 +372,8 @@
 		if (buf.length > 0x4096)
 			return -EINVAL;
 
+		//printk("MVL_DEBUG: MEMWRITEOOB: buf.start = 0x%016llx, buf.length = 0x%16llx.\n",buf.start,buf.length);
+
 		if (!mtd->write_oob)
 			ret = -EOPNOTSUPP;
 		else
diff -urN kernel-2.4.20_orig/drivers/mtd/mtdcore.c kernel-2.4.20/drivers/mtd/mtdcore.c
--- kernel-2.4.20_orig/drivers/mtd/mtdcore.c	2005-10-13 16:49:46.000000000 +0100
+++ kernel-2.4.20/drivers/mtd/mtdcore.c	2005-11-30 12:13:27.000000000 +0000
@@ -345,7 +345,7 @@
 	if (!this)
 		return 0;
 
-	return sprintf(buf, "mtd%d: %8.8x %8.8x \"%s\"\n", i, this->size,
+	return sprintf(buf, "mtd%d: %016.8llx %8.8x \"%s\"\n", i, this->size,
 		       this->erasesize, this->name);
 }
 
@@ -362,7 +362,7 @@
 
 	down(&mtd_table_mutex);
 
-	len = sprintf(page, "dev:    size   erasesize  name\n");
+	len = sprintf(page, "dev:    size           erasesize  name\n");
         for (i=0; i< MAX_MTD_DEVICES; i++) {
 
                 l = mtd_proc_info(page + len, i);
diff -urN kernel-2.4.20_orig/drivers/mtd/nand/nand.c kernel-2.4.20/drivers/mtd/nand/nand.c
--- kernel-2.4.20_orig/drivers/mtd/nand/nand.c	2005-11-29 22:34:51.000000000 +0000
+++ kernel-2.4.20/drivers/mtd/nand/nand.c	2005-11-30 13:59:47.000000000 +0000
@@ -1815,7 +1813,8 @@
  */
 static int nand_erase (struct mtd_info *mtd, struct erase_info *instr)
 {
-	int page, len, status, pages_per_block, ret, chipnr;
+	int page, status, pages_per_block, ret, chipnr;
+	u_int64_t len;
 	struct nand_chip *this = mtd->priv;
 	u_int64_t mvl_tmp = 0;
 
diff -urN kernel-2.4.20_orig/include/linux/mtd/mtd.h kernel-2.4.20/include/linux/mtd/mtd.h
--- kernel-2.4.20_orig/include/linux/mtd/mtd.h	2005-11-29 22:27:55.000000000 +0000
+++ kernel-2.4.20/include/linux/mtd/mtd.h	2005-11-30 13:45:41.000000000 +0000
@@ -20,13 +20,13 @@
 #endif /* __KERNEL__ */
 
 struct erase_info_user {
-	u_int32_t start;
-	u_int32_t length;
+	u_int64_t start;
+	u_int64_t length;
 };
 
 struct mtd_oob_buf {
-	u_int32_t start;
-	u_int32_t length;
+	u_int64_t start;
+	u_int64_t length;
 	unsigned char *ptr;
 };
 
@@ -77,7 +77,7 @@
 struct mtd_info_user {
 	u_char type;
 	u_int32_t flags;
-	u_int32_t size;	 // Total size of the MTD
+	u_int64_t size;	 // Total size of the MTD
 	u_int32_t erasesize;
 	u_int32_t oobblock;  // Size of OOB blocks (e.g. 512)
 	u_int32_t oobsize;   // Amount of OOB data per block (e.g. 16)
@@ -86,10 +86,10 @@
 };
 
 struct region_info_user {
-	u_int32_t offset;		/* At which this region starts, 
+	u_int64_t offset;		/* At which this region starts, 
 					 * from the beginning of the MTD */
 	u_int32_t erasesize;		/* For this region */
-	u_int32_t numblocks;		/* Number of blocks in this region */
+	u_int64_t numblocks;		/* Number of blocks in this region */
 	u_int32_t regionindex;
 };
 
@@ -144,9 +144,9 @@
 };
 
 struct mtd_erase_region_info {
-	u_int32_t offset;			/* At which this region starts, from the beginning of the MTD */
+	u_int64_t offset;			/* At which this region starts, from the beginning of the MTD */
 	u_int32_t erasesize;		/* For this region */
-	u_int32_t numblocks;		/* Number of blocks of erasesize in this region */
+	u_int64_t numblocks;		/* Number of blocks of erasesize in this region */
 };
 
 struct mtd_info {
