Received: from [2002:c35c:f9fc::1] (helo=parcelfarce.linux.theplanet.co.uk)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CwQLH-0003nT-Tk
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 14:39:14 -0500
Date: Wed, 2 Feb 2005 19:39:09 +0000
From: Al Viro <viro@parcelfarce.linux.theplanet.co.uk>
To: Linus Torvalds <torvalds@osdl.org>
Message-ID: <20050202193909.GR8859@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Al Viro <viro@www.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH] (21/27) misc mtd sparse fixes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	* jedec - switched to C99 initializers
	* sun_uflash - removed bogus cast to void * in argument of iounmap() +
NULL noise removal.
Signed-off-by: Al Viro <viro@parcelfarce.linux.theplanet.co.uk>
----
diff -urN RC11-rc2-bk10-sent/drivers/mtd/chips/jedec_probe.c RC11-rc2-bk10-mtd-misc/drivers/mtd/chips/jedec_probe.c
--- RC11-rc2-bk10-sent/drivers/mtd/chips/jedec_probe.c	Fri Jan 21 22:46:40 2005
+++ RC11-rc2-bk10-mtd-misc/drivers/mtd/chips/jedec_probe.c	Wed Feb  2 10:34:57 2005
@@ -1302,7 +1302,7 @@
  		.DevSize	= SIZE_256KiB,
  		.CmdSet		= P_ID_SST_PAGE,
  		.NumEraseRegions= 1,
- 		regions: {ERASEINFO(0x01000,64),
+ 		.regions = {ERASEINFO(0x01000,64),
  		}
          }, {
  		.mfr_id		= MANUFACTURER_SST,
@@ -1314,7 +1314,7 @@
  		.DevSize	= SIZE_256KiB,
  		.CmdSet		= P_ID_SST_PAGE,
  		.NumEraseRegions= 1,
- 		regions: {ERASEINFO(0x01000,64),
+ 		.regions = {ERASEINFO(0x01000,64),
  		}
 	}, {
 		.mfr_id		= MANUFACTURER_SST,
diff -urN RC11-rc2-bk10-sent/drivers/mtd/maps/sun_uflash.c RC11-rc2-bk10-mtd-misc/drivers/mtd/maps/sun_uflash.c
--- RC11-rc2-bk10-sent/drivers/mtd/maps/sun_uflash.c	Fri Dec 24 20:11:47 2004
+++ RC11-rc2-bk10-mtd-misc/drivers/mtd/maps/sun_uflash.c	Wed Feb  2 10:34:57 2005
@@ -109,7 +109,7 @@
 	/* MTD registration */
 	pdev->mtd = do_map_probe("cfi_probe", &pdev->map);
 	if(0 == pdev->mtd) {
-		iounmap((void *)pdev->map.virt);
+		iounmap(pdev->map.virt);
 		kfree(pdev->name);
 		kfree(pdev);
 		return(-ENXIO);
@@ -163,8 +163,8 @@
 			map_destroy(udev->mtd);
 		}
 		if(0 != udev->map.virt) {
-			iounmap((void*)udev->map.virt);
-			udev->map.virt = 0;
+			iounmap(udev->map.virt);
+			udev->map.virt = NULL;
 		}
 		if(0 != udev->name) {
 			kfree(udev->name);
