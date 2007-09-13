Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IVfYg-00046l-Bg
	for linux-mtd@lists.infradead.org; Wed, 12 Sep 2007 23:40:05 -0400
From: Mike Frysinger <vapier@gentoo.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [patch] update CFI URI n mtd kconfig
Date: Wed, 12 Sep 2007 23:39:54 -0400
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200709122339.55267.vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since AMD shunted its flash memory division, the URI in the mtd Kconfig is now
broken, so the attached patch points people to Wikipedia.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index 479d32b..980117a 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -11,8 +11,8 @@ config MTD_CFI
 	  AMD and other flash manufactures that provides a universal method
 	  for probing the capabilities of flash devices. If you wish to
 	  support any device that is CFI-compliant, you need to enable this
-	  option. Visit <http://www.amd.com/products/nvd/overview/cfi.html>
-	  for more information on CFI.
+	  option. For more information on CFI, visit:
+	  <http://wikipedia.org/wiki/Common_Flash_Memory_Interface>
 
 config MTD_JEDECPROBE
 	tristate "Detect non-CFI AMD/JEDEC-compatible flash chips"
