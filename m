Received: from belize.chezphil.org ([80.68.91.122])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HokYv-0006VA-0L
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 14:18:55 -0400
Received: from localhost ([127.0.0.1] helo=chezphil.org)
	by belize.chezphil.org with esmtp (Exim 4.50) id 1Hop5M-0006Ah-J2
	for linux-mtd@lists.infradead.org; Fri, 18 May 2007 00:08:40 +0100
To: <linux-mtd@lists.infradead.org>
Date: Thu, 17 May 2007 19:18:14 +0100
Subject: [PATCH] Fix kfree usage in various mtd map remove functions
Message-ID: <1179425894742@dmwebmail.belize.chezphil.org>
MIME-Version: 1.0
Content-Type: text/plain; format="fixed"
From: "Phil Endecott" <spam_from_linux_mtd@chezphil.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The remove() functions in various mtd map drivers were incorrectly kfree()ing the struct 
resource that they had passed to release_resource(), and/or failing to free the *_flash_info 
structure.  This looks like a typo which has gradually propogated by copy&paste into a number 
of these drivers.

Since mtd drivers are rarely or never used as modules (they typically provide root filesystems) 
it is unlikely that these code paths have ever been exercised.  It also means that this patch 
has not been tested by the author.

This patch is against 2.6.21.

Signed-off-by: Phil Endecott <spam_from_linux_mtd_patch@chezphil.org>


diff -Nur linux-arm-2.6.21/drivers/mtd/maps.orig/integrator-flash.c linux-arm-2.6.21/drivers/mtd/maps/integrator-flash.c
--- linux-arm-2.6.21/drivers/mtd/maps.orig/integrator-flash.c	2007-05-17 18:56:10.000000000 +0100
+++ linux-arm-2.6.21/drivers/mtd/maps/integrator-flash.c	2007-05-17 18:58:16.000000000 +0100
@@ -174,7 +174,6 @@
 
 		iounmap(info->map.virt);
 		release_resource(info->res);
-		kfree(info->res);
 
 		if (info->plat && info->plat->exit)
 			info->plat->exit();
diff -Nur linux-arm-2.6.21/drivers/mtd/maps.orig/ixp2000.c linux-arm-2.6.21/drivers/mtd/maps/ixp2000.c
--- linux-arm-2.6.21/drivers/mtd/maps.orig/ixp2000.c	2007-05-17 18:56:10.000000000 +0100
+++ linux-arm-2.6.21/drivers/mtd/maps/ixp2000.c	2007-05-17 18:57:29.000000000 +0100
@@ -129,10 +129,10 @@
 
 	kfree(info->partitions);
 
-	if (info->res) {
+	if (info->res)
 		release_resource(info->res);
-		kfree(info->res);
-	}
+
+	kfree(info);
 
 	if (plat->exit)
 		plat->exit();
diff -Nur linux-arm-2.6.21/drivers/mtd/maps.orig/ixp4xx.c linux-arm-2.6.21/drivers/mtd/maps/ixp4xx.c
--- linux-arm-2.6.21/drivers/mtd/maps.orig/ixp4xx.c	2007-05-17 18:56:10.000000000 +0100
+++ linux-arm-2.6.21/drivers/mtd/maps/ixp4xx.c	2007-05-17 18:57:02.000000000 +0100
@@ -172,10 +172,10 @@
 
 	kfree(info->partitions);
 
-	if (info->res) {
+	if (info->res)
 		release_resource(info->res);
-		kfree(info->res);
-	}
+
+	kfree(info);
 
 	if (plat->exit)
 		plat->exit();
Binary files linux-arm-2.6.21/drivers/mtd/maps.orig/ixp4xx.o and linux-arm-2.6.21/drivers/mtd/maps/ixp4xx.o differ
diff -Nur linux-arm-2.6.21/drivers/mtd/maps.orig/physmap.c linux-arm-2.6.21/drivers/mtd/maps/physmap.c
--- linux-arm-2.6.21/drivers/mtd/maps.orig/physmap.c	2007-05-17 18:56:10.000000000 +0100
+++ linux-arm-2.6.21/drivers/mtd/maps/physmap.c	2007-05-17 18:59:20.000000000 +0100
@@ -64,10 +64,10 @@
 	if (info->map.virt != NULL)
 		iounmap(info->map.virt);
 
-	if (info->res != NULL) {
+	if (info->res)
 		release_resource(info->res);
-		kfree(info->res);
-	}
+
+	kfree(info);
 
 	return 0;
 }
diff -Nur linux-arm-2.6.21/drivers/mtd/maps.orig/physmap_of.c linux-arm-2.6.21/drivers/mtd/maps/physmap_of.c
--- linux-arm-2.6.21/drivers/mtd/maps.orig/physmap_of.c	2007-05-17 18:56:10.000000000 +0100
+++ linux-arm-2.6.21/drivers/mtd/maps/physmap_of.c	2007-05-17 18:59:57.000000000 +0100
@@ -107,10 +107,10 @@
 	if (info->map.virt != NULL)
 		iounmap(info->map.virt);
 
-	if (info->res != NULL) {
+	if (info->res)
 		release_resource(info->res);
-		kfree(info->res);
-	}
+
+	kfree(info);
 
 	return 0;
 }
