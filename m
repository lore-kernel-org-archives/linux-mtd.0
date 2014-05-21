Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnD95-0006ts-Aq
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 20:29:51 +0000
Received: by mail-ig0-f178.google.com with SMTP id hl10so2626473igb.17
 for <linux-mtd@lists.infradead.org>; Wed, 21 May 2014 13:29:29 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: lpddr: fix Kconfig dependency, for I/O accessors
Date: Wed, 21 May 2014 13:29:13 -0700
Message-Id: <1400704153-26626-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not all architectures implement a writel_relaxed() accessor. Hopefully
this will change eventually, but for now, this means lpddr2_nvm.c can't
compile on some architectures.

Let's add an ARM dependency for now, and leave a comment so maybe we can
change this in the future.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
---
 drivers/mtd/lpddr/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/lpddr/Kconfig b/drivers/mtd/lpddr/Kconfig
index 468f06dea45d..3a19cbee24d7 100644
--- a/drivers/mtd/lpddr/Kconfig
+++ b/drivers/mtd/lpddr/Kconfig
@@ -19,7 +19,8 @@ config MTD_QINFO_PROBE
 	    Flash products
 
 config MTD_LPDDR2_NVM
-	depends on MTD
+	# ARM dependency is only for writel_relaxed()
+	depends on MTD && ARM
 	tristate "Support for LPDDR2-NVM flash chips"
 	help
 	  This option enables support of PCM memories with a LPDDR2-NVM
-- 
1.8.3.2
