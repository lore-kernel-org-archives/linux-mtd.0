Received: from verein.lst.de ([213.95.11.210] helo=mail.lst.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DH5j2-0006Xb-Qc
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 14:53:09 -0500
Date: Thu, 31 Mar 2005 21:52:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: dwmw2@infradead.org, gerg@snapgear.com
Message-ID: <20050331195254.GA9189@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] don't try to set ROOT_DEV from modular mtd drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Personally I think setting ROOT_DEV from drivers is a really bad idea
(and these two are the only two drivers actually doing it), but at least
let's do it only for the builtin case so we can kill the ROOT_DEV
export.


--- 1.8/drivers/mtd/maps/nettel.c	2005-01-05 18:17:45 +01:00
+++ edited/drivers/mtd/maps/nettel.c	2005-03-31 21:55:47 +02:00
@@ -415,7 +415,7 @@
 
 	intel_mtd->owner = THIS_MODULE;
 
-#ifndef CONFIG_BLK_DEV_INITRD
+#if !defined(MODULE) && !defined(CONFIG_BLK_DEV_INITRD)
 	ROOT_DEV = MKDEV(MTD_BLOCK_MAJOR, 1);
 #endif
 
--- 1.9/drivers/mtd/maps/uclinux.c	2005-01-05 19:08:36 +01:00
+++ edited/drivers/mtd/maps/uclinux.c	2005-03-31 21:55:38 +02:00
@@ -94,7 +94,9 @@
 
 	printk("uclinux[mtd]: set %s to be root filesystem\n",
 	     	uclinux_romfs[0].name);
+#ifndef MODULE
 	ROOT_DEV = MKDEV(MTD_BLOCK_MAJOR, 0);
+#endif
 	put_mtd_device(mtd);
 
 	return(0);
