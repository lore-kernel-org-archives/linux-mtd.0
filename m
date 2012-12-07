Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Th4Cn-0000gt-5j
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2012 20:07:29 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: nand/docg4: reserve bb marker area in ecclayout
Date: Fri,  7 Dec 2012 12:07:22 -0800
Message-Id: <1354910843-5598-3-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
References: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Modify the nand_ecclayout to place the two bb marker bytes in the oob region
off-limits to the user. 

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/nand/docg4.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 54b1e5e..04e5fa9 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -214,15 +214,17 @@ struct docg4_priv {
 #define DOCG4_FACTORY_BBT_PAGE 16 /* page where read-only factory bbt lives */
 
 /*
- * Oob bytes 0 - 6 are available to the user.
- * Byte 7 is hamming ecc for first 7 bytes.  Bytes 8 - 14 are hw-generated ecc.
+ * Bytes 0, 1 are used as badblock marker.
+ * Bytes 2 - 6 are available to the user.
+ * Byte 7 is hamming ecc for first 7 oob bytes only.
+ * Bytes 8 - 14 are hw-generated ecc covering entire page + oob bytes 0 - 14.
  * Byte 15 (the last) is used by the driver as a "page written" flag.
  */
 static struct nand_ecclayout docg4_oobinfo = {
 	.eccbytes = 9,
 	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14, 15},
-	.oobavail = 7,
-	.oobfree = { {0, 7} }
+	.oobavail = 5,
+	.oobfree = { {.offset = 2, .length = 5} }
 };
 
 /*
-- 
1.7.8.6
