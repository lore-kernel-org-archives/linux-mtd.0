Received: from mail-ee0-f45.google.com ([74.125.83.45])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TnAzE-0006Fy-6G
 for linux-mtd@lists.infradead.org; Mon, 24 Dec 2012 16:34:44 +0000
Received: by mail-ee0-f45.google.com with SMTP id d49so3549325eek.4
 for <linux-mtd@lists.infradead.org>; Mon, 24 Dec 2012 08:34:40 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [FIX][PATCH 3.8] mtd: bcm47xxnflash: increase NFLASH_READY_RETRIES
Date: Mon, 24 Dec 2012 17:34:29 +0100
Message-Id: <1356366869-22943-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Recently imlemented writing support has shown that current num of
retries is too low. Writing requires longer waiting than simple reading.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index 86c9a79..595de40 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -17,8 +17,8 @@
 #include "bcm47xxnflash.h"
 
 /* Broadcom uses 1'000'000 but it seems to be too many. Tests on WNDR4500 has
- * shown 164 retries as maxiumum. */
-#define NFLASH_READY_RETRIES		1000
+ * shown ~1000 retries as maxiumum. */
+#define NFLASH_READY_RETRIES		10000
 
 #define NFLASH_SECTOR_SIZE		512
 
-- 
1.7.7
