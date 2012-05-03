Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQ0AP-0006V6-F2
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 17:50:14 +0000
From: John Crispin <blogic@openwrt.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] MTD: lantiq: fixes typo inside NAND driver
Date: Thu,  3 May 2012 19:48:31 +0200
Message-Id: <1336067311-24797-1-git-send-email-blogic@openwrt.org>
Cc: linux-mtd@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This Patch fixes a minor typo in my patch

[PATCH 4/4] MTD: MIPS: lantiq: add xway nand support

from last monday. Could you please fold this fix into the patch.

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/xway_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index e4cd00d..e655fa6 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -178,7 +178,7 @@ static struct platform_nand_data xway_nand_data = {
 };
 
 /*
- * Try to find the node inside the DT. If it is available attach out
+ * Try to find the node inside the DT. If it is available attach our
  * platform_nand_data
  */
 int __init xway_register_nand(void)
-- 
1.7.9.1
