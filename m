Received: from 208.101.48.4-static.reverse.softlayer.com ([208.101.48.4]
	helo=chtn01.999servers.com)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GWb95-0002PY-TD
	for linux-mtd@lists.infradead.org; Sun, 08 Oct 2006 17:04:56 +0100
Received: from [125.22.72.211] (helo=vaishnavi.localdomain.localdomain)
	by chtn01.999servers.com with esmtpa (Exim 4.52) id 1GWb8w-0008Fm-8q
	for linux-mtd@lists.infradead.org; Sun, 08 Oct 2006 11:04:47 -0500
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17705.10157.93490.656593@vaishnavi.localdomain>
Date: Sun, 8 Oct 2006 22:00:37 +0530
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] NAND: updated nandsim page-wise allocation
From: Vijay Kumar <vijaykumar@bravegnu.org>
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch removes code that does chip mapping. The chip mapping code
is no longer used.

Signed-off-by: Vijay Kumar <vijaykumar@bravegnu.org>

Index: linux-2.6-mtd-quilt/drivers/mtd/nand/nandsim.c
===================================================================
--- linux-2.6-mtd-quilt.orig/drivers/mtd/nand/nandsim.c	2006-10-01 18:53:35.000000000 +0530
+++ linux-2.6-mtd-quilt/drivers/mtd/nand/nandsim.c	2006-10-07 21:15:43.000000000 +0530
@@ -37,10 +37,6 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/delay.h>
-#ifdef CONFIG_NS_ABS_POS
-#include <asm/io.h>
-#endif
-
 
 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
@@ -440,14 +436,6 @@
 	printk("options: %#x\n",                ns->options);
 
 	/* Map / allocate and initialize the flash image */
-#ifdef CONFIG_NS_ABS_POS
-	ns->mem.byte = ioremap(CONFIG_NS_ABS_POS, ns->geom.totszoob);
-	if (!ns->mem.byte) {
-		NS_ERR("init_nandsim: failed to map the NAND flash image at address %p\n",
-			(void *)CONFIG_NS_ABS_POS);
-		return -ENOMEM;
-	}
-#else
 	ns->mem.byte = vmalloc(ns->geom.totszoob);
 	if (!ns->mem.byte) {
 		NS_ERR("init_nandsim: unable to allocate %u bytes for flash image\n",
@@ -455,7 +443,6 @@
 		return -ENOMEM;
 	}
 	memset(ns->mem.byte, 0xFF, ns->geom.totszoob);
-#endif
 
 	/* Allocate / initialize the internal buffer */
 	ns->buf.byte = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
@@ -474,11 +461,7 @@
 	return 0;
 
 error:
-#ifdef CONFIG_NS_ABS_POS
-	iounmap(ns->mem.byte);
-#else
 	vfree(ns->mem.byte);
-#endif
 
 	return -ENOMEM;
 }
@@ -490,12 +473,7 @@
 free_nandsim(struct nandsim *ns)
 {
 	kfree(ns->buf.byte);
-
-#ifdef CONFIG_NS_ABS_POS
-	iounmap(ns->mem.byte);
-#else
 	vfree(ns->mem.byte);
-#endif
 
 	return;
 }
