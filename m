Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcWaV-0006k2-PJ
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2015 10:06:32 +0000
Received: by pacwe9 with SMTP id we9so162629442pac.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 03:06:08 -0700 (PDT)
From: Masanari Iida <standby24x7@gmail.com>
To: linux-kernel@vger.kernel.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd:ts5500_flash: Fix typo in MODULE_DESCRIPTION in
 ts5500_flash.c
Date: Mon, 30 Mar 2015 19:06:22 +0900
Message-Id: <1427709982-5679-1-git-send-email-standby24x7@gmail.com>
Cc: Masanari Iida <standby24x7@gmail.com>, trivial@kernel.org, sean@mess.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fix a spelling typo in MODULE_DESCRIPTION in ts5500_flash.c.

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 drivers/mtd/maps/ts5500_flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/ts5500_flash.c b/drivers/mtd/maps/ts5500_flash.c
index d1d671d..9969fed 100644
--- a/drivers/mtd/maps/ts5500_flash.c
+++ b/drivers/mtd/maps/ts5500_flash.c
@@ -117,5 +117,5 @@ module_exit(cleanup_ts5500_map);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sean Young <sean@mess.org>");
-MODULE_DESCRIPTION("MTD map driver for Techology Systems TS-5500 board");
+MODULE_DESCRIPTION("MTD map driver for Technology Systems TS-5500 board");
 
-- 
2.3.4.274.g92e625d
