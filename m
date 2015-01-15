Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBhxt-0000hs-6M
 for linux-mtd@lists.infradead.org; Thu, 15 Jan 2015 10:47:49 +0000
Received: by mail-pa0-f41.google.com with SMTP id rd3so16833051pab.0
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2015 02:47:27 -0800 (PST)
From: Masanari Iida <standby24x7@gmail.com>
To: kamlakant.patel@broadcom.com, gregkh@linuxfoundation.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH] staging: mt29f_spinand: Fix typo in Kconfig
Date: Thu, 15 Jan 2015 19:47:24 +0900
Message-Id: <1421318844-18203-1-git-send-email-standby24x7@gmail.com>
Cc: devel@driverdev.osuosl.org, Masanari Iida <standby24x7@gmail.com>,
 manonuevo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fix a spelling typo in Kconfig.

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 drivers/staging/mt29f_spinand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt29f_spinand/Kconfig b/drivers/staging/mt29f_spinand/Kconfig
index 4031748..f3f9cb3 100644
--- a/drivers/staging/mt29f_spinand/Kconfig
+++ b/drivers/staging/mt29f_spinand/Kconfig
@@ -12,5 +12,5 @@ config MTD_SPINAND_ONDIEECC
 	bool "Use SPINAND internal ECC"
 	depends on MTD_SPINAND_MT29F
 	help
-	  Internel ECC.
+	  Internal ECC.
 	  Enables Hardware ECC support for Micron SPI NAND.
-- 
2.3.0.rc0
