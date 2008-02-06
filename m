Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JMYl1-0002bi-Co
	for linux-mtd@lists.infradead.org; Wed, 06 Feb 2008 01:07:29 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: dwmw2@infradead.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [patch] mtd maps: document MTD_PHYSMAP module name in kconfig
Date: Tue, 5 Feb 2008 20:03:48 -0500
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200802052003.49527.vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Help out users by telling them the module name in the Kconfig help when using
the MTD_PHYSMAP option.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index a592fc0..2f15330 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -21,6 +21,9 @@ config MTD_PHYSMAP
 	  particular board as well as the bus width, either statically
 	  with config options or at run-time.
 
+	  To compile this driver as a module, choose M here: the
+	  module will be called physmap.
+
 config MTD_PHYSMAP_START
 	hex "Physical start address of flash mapping"
 	depends on MTD_PHYSMAP
