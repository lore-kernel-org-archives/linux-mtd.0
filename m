Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15op4n-0004CF-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2001 17:40:53 +0100
Message-ID: <20011003094946.A22521@recycle.lbl.gov>
Date: Wed, 3 Oct 2001 09:49:46 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Subject: BLKGETSIZE64 patch for your consideration
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

This patch makes BLKGETSIZE64 handling more natural and robust,
IMHO.   No (explicit) architecture or kernel version dependent
preprocessing is needed.

diff -urN cvs/mtd/drivers/mtd/ftl.c drivers/mtd/ftl.c
--- cvs/mtd/drivers/mtd/ftl.c	Tue Oct  2 08:13:32 2001
+++ drivers/mtd/ftl.c	Wed Oct  3 09:31:54 2001
@@ -1176,9 +1176,11 @@
     case BLKGETSIZE:
 	ret = put_user(ftl_hd[minor].nr_sects, (long *)arg);
 	break;
+#ifdef BLKGETSIZE64
     case BLKGETSIZE64:
 	ret = put_user((u64)ftl_hd[minor].nr_sects << 9, (u64 *)arg);
 	break;
+#endif
     case BLKRRPART:
 	ret = ftl_reread_partitions(minor);
 	break;
diff -urN cvs/mtd/drivers/mtd/mtdblock.c drivers/mtd/mtdblock.c
--- cvs/mtd/drivers/mtd/mtdblock.c	Tue Oct  2 08:13:32 2001
+++ drivers/mtd/mtdblock.c	Wed Oct  3 09:31:54 2001
@@ -540,8 +540,11 @@
 	switch (cmd) {
 	case BLKGETSIZE:   /* Return device size */
 		return put_user((mtdblk->mtd->size >> 9), (long *) arg);
+
+#ifdef BLKGETSIZE64
 	case BLKGETSIZE64:
 		return put_user((u64)mtdblk->mtd->size, (u64 *)arg);
+#endif
 		
 	case BLKFLSBUF:
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
diff -urN cvs/mtd/drivers/mtd/mtdblock_ro.c drivers/mtd/mtdblock_ro.c
--- cvs/mtd/drivers/mtd/mtdblock_ro.c	Tue Oct  2 08:13:32 2001
+++ drivers/mtd/mtdblock_ro.c	Wed Oct  3 09:31:54 2001
@@ -214,9 +214,12 @@
 	switch (cmd) {
 	case BLKGETSIZE:   /* Return device size */
 		return put_user((mtd->size >> 9), (long *) arg);
+
+#ifdef BLKGETSIZE64
 	case BLKGETSIZE64:
 		return put_user((u64)mtd->size, (u64 *)arg);
-		
+#endif
+
 	case BLKFLSBUF:
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
 		if(!capable(CAP_SYS_ADMIN))  return -EACCES;
diff -urN cvs/mtd/drivers/mtd/nftlcore.c drivers/mtd/nftlcore.c
--- cvs/mtd/drivers/mtd/nftlcore.c	Tue Oct  2 08:13:32 2001
+++ drivers/mtd/nftlcore.c	Wed Oct  3 09:31:54 2001
@@ -805,9 +805,12 @@
 	case BLKGETSIZE:   /* Return device size */
 		return put_user(part_table[MINOR(inode->i_rdev)].nr_sects,
                                 (long *) arg);
+
+#ifdef BLKGETSIZE64
 	case BLKGETSIZE64:
 		return put_user((u64)part_table[MINOR(inode->i_rdev)].nr_sects << 9,
                                 (u64 *)arg);
+#endif
 
 	case BLKFLSBUF:
 		if (!capable(CAP_SYS_ADMIN)) return -EACCES;
diff -urN cvs/mtd/include/linux/mtd/compatmac.h include/linux/mtd/compatmac.h
--- cvs/mtd/include/linux/mtd/compatmac.h	Tue Oct  2 08:13:35 2001
+++ include/linux/mtd/compatmac.h	Wed Oct  3 09:34:44 2001
@@ -463,9 +463,10 @@
 		}
 }
 #endif
-#ifndef BLKGETSIZE64 /* LINUX_VERSION_CODE < KERNEL_VERSION(2,4,10-pre13) */
-#define BLKGETSIZE64 _IOR(0x12,114,sizeof(u64)) /* return device size in bytes (u64 *arg) */
-#endif
+
+/* Took out BLKGETSIZE64 stuff: the MTD layer will only build with
+ * BLKGETSIZE64 if the kernel has it.
+ */
 
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,2,18) && defined(MODULE)
 
