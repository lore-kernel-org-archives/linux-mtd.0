Received: from mail.dif.dk ([193.138.115.101])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CifXb-0008R5-7G
	for linux-mtd@lists.infradead.org; Sun, 26 Dec 2004 16:03:04 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.dif.dk (Postfix) with ESMTP id 611DDFFC9D
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Dec 2004 22:06:27 +0100 (CET)
Received: from mail.dif.dk ([127.0.0.1])
	by localhost (saerimmer [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP
	id 15399-14 for <linux-mtd@lists.infradead.org>;
	Sun, 26 Dec 2004 22:06:26 +0100 (CET)
Received: from diftmgw2.backbone.dif.dk (diftmgw2.backbone.dif.dk
	[10.227.136.246]) by mail.dif.dk (Postfix) with ESMTP id A77D2FFC74
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Dec 2004 22:06:26 +0100 (CET)
Date: Sun, 26 Dec 2004 22:13:48 +0100 (CET)
From: Jesper Juhl <juhl-lkml@dif.dk>
To: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.61.0412262202510.3552@dragon.hygekrogen.localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wh.fh-wedel.de>,
	Greg Ungerer <gerg@snapgear.com>, David Woodhouse <dwmw2@redhat.com>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [patch] remove unnessesary casts from drivers/mtd/maps/nettel.c and
 kill two warnings
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I took a look at the cause for these warnings in the 2.6.10 kernel,

drivers/mtd/maps/nettel.c:361: warning: assignment makes pointer from integer without a cast
drivers/mtd/maps/nettel.c:395: warning: assignment makes pointer from integer without a cast

and as far as I can see the casts in there (to unsigned long and back to 
void*) are completely unnessesary ('virt' in 'struct map_info' is a void 
__iomem *), and getting rid of those casts buys us a warning free build.

Are there any reasons not to apply the patch below?
Unfortunately I don't have hardware to test this patch, so it has been 
compile tested only.

Please keep me on CC since I'm not subscribed to linux-mtd.


Signed-off-by: Jesper Juhl <juhl-lkml@dif.dk>

diff -up linux-2.6.10-orig/drivers/mtd/maps/nettel.c linux-2.6.10/drivers/mtd/maps/nettel.c
--- linux-2.6.10-orig/drivers/mtd/maps/nettel.c	2004-12-24 22:34:27.000000000 +0100
+++ linux-2.6.10/drivers/mtd/maps/nettel.c	2004-12-26 22:00:07.000000000 +0100
@@ -332,8 +332,8 @@ int __init nettel_init(void)
 
 		/* Destroy useless AMD MTD mapping */
 		amd_mtd = NULL;
-		iounmap((void *) nettel_amd_map.virt);
-		nettel_amd_map.virt = (unsigned long) NULL;
+		iounmap(nettel_amd_map.virt);
+		nettel_amd_map.virt = NULL;
 #else
 		/* Only AMD flash supported */
 		return(-ENXIO);
@@ -357,8 +357,7 @@ int __init nettel_init(void)
 	/* Probe for the the size of the first Intel flash */
 	nettel_intel_map.size = maxsize;
 	nettel_intel_map.phys = intel0addr;
-	nettel_intel_map.virt = (unsigned long)
-		ioremap_nocache(intel0addr, maxsize);
+	nettel_intel_map.virt = ioremap_nocache(intel0addr, maxsize);
 	if (!nettel_intel_map.virt) {
 		printk("SNAPGEAR: failed to ioremap() ROMCS1\n");
 		return(-EIO);
@@ -366,8 +365,8 @@ int __init nettel_init(void)
 	simple_map_init(&nettel_intel_map);
 
 	intel_mtd = do_map_probe("cfi_probe", &nettel_intel_map);
-	if (! intel_mtd) {
-		iounmap((void *) nettel_intel_map.virt);
+	if (!intel_mtd) {
+		iounmap(nettel_intel_map.virt);
 		return(-ENXIO);
 	}
 
@@ -388,11 +387,10 @@ int __init nettel_init(void)
 	/* Delete the old map and probe again to do both chips */
 	map_destroy(intel_mtd);
 	intel_mtd = NULL;
-	iounmap((void *) nettel_intel_map.virt);
+	iounmap(nettel_intel_map.virt);
 
 	nettel_intel_map.size = maxsize;
-	nettel_intel_map.virt = (unsigned long)
-		ioremap_nocache(intel0addr, maxsize);
+	nettel_intel_map.virt = ioremap_nocache(intel0addr, maxsize);
 	if (!nettel_intel_map.virt) {
 		printk("SNAPGEAR: failed to ioremap() ROMCS1/2\n");
 		return(-EIO);
@@ -480,7 +478,7 @@ void __exit nettel_cleanup(void)
 		map_destroy(intel_mtd);
 	}
 	if (nettel_intel_map.virt) {
-		iounmap((void *)nettel_intel_map.virt);
+		iounmap(nettel_intel_map.virt);
 		nettel_intel_map.virt = 0;
 	}
 #endif
