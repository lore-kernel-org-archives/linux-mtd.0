Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9PVA-00085F-1Z
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:08:24 +0000
Received: by mail-pa0-f44.google.com with SMTP id eu11so11056211pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:08:03 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: maps: solutionengine: drop excess dependency
Date: Mon, 21 Jul 2014 19:07:56 -0700
Message-Id: <1405994876-19571-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Already depends on SOLUTION_ENGINE, so we don't need the SUPERH
dependency too.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/maps/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 21b2874a303b..ba801d2c6dcc 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -249,7 +249,7 @@ config MTD_CFI_FLAGADM
 
 config MTD_SOLUTIONENGINE
 	tristate "CFI Flash device mapped on Hitachi SolutionEngine"
-	depends on SUPERH && SOLUTION_ENGINE && MTD_CFI && MTD_REDBOOT_PARTS
+	depends on SOLUTION_ENGINE && MTD_CFI && MTD_REDBOOT_PARTS
 	help
 	  This enables access to the flash chips on the Hitachi SolutionEngine and
 	  similar boards. Say 'Y' if you are building a kernel for such a board.
-- 
1.9.1
