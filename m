Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axKVF-0002wH-Oa
 for linux-mtd@lists.infradead.org; Mon, 02 May 2016 20:31:38 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: nandsim: Relax page size restrictions
Date: Mon,  2 May 2016 22:31:03 +0200
Message-Id: <1462221063-20333-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Allow any page size as long it is a power of two and less
than KMALLOC_MAX_SIZE.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 66e87c6..9a444e2 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -175,9 +175,6 @@ MODULE_PARM_DESC(bbt,		 "0 OOB, 1 BBT with marker in OOB, 2 BBT with marker in d
 MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 				 "be correctable in 512-byte blocks");
 
-/* The largest possible page size */
-#define NS_LARGEST_PAGE_SIZE	4096
-
 /* The prefix for simulator output */
 #define NS_OUTPUT_PREFIX "[nandsim]"
 
@@ -267,10 +264,8 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 
 #define OPT_ANY          0xFFFFFFFF /* any chip supports this operation */
 #define OPT_PAGE512      0x00000002 /* 512-byte  page chips */
-#define OPT_PAGE2048     0x00000008 /* 2048-byte page chips */
+#define OPT_LARGEPAGE    0x00000008 /* >= 2048-byte page chips */
 #define OPT_PAGE512_8BIT 0x00000040 /* 512-byte page chips with 8-bit bus width */
-#define OPT_PAGE4096     0x00000080 /* 4096-byte page chips */
-#define OPT_LARGEPAGE    (OPT_PAGE2048 | OPT_PAGE4096) /* 2048 & 4096-byte page chips */
 #define OPT_SMALLPAGE    (OPT_PAGE512) /* 512-byte page chips */
 
 /* Remove action bits from state */
@@ -699,13 +694,18 @@ static int init_nandsim(struct mtd_info *mtd)
 		ns->options |= OPT_PAGE512;
 		if (ns->busw == 8)
 			ns->options |= OPT_PAGE512_8BIT;
-	} else if (ns->geom.pgsz == 2048) {
-		ns->options |= OPT_PAGE2048;
-	} else if (ns->geom.pgsz == 4096) {
-		ns->options |= OPT_PAGE4096;
-	} else {
-		NS_ERR("init_nandsim: unknown page size %u\n", ns->geom.pgsz);
-		return -EIO;
+	} else if (ns->geom.pgsz >= 2048) {
+		ns->options |= OPT_LARGEPAGE;
+	}
+
+	if (!is_power_of_2(ns->geom.pgsz)) {
+		NS_ERR("page size is not a power of two.\n");
+		return -EINVAL;
+	}
+
+	if (ns->geom.pgszoob > KMALLOC_MAX_SIZE) {
+		NS_ERR("page size plus oob too large: %u.\n", ns->geom.pgszoob);
+		return -EINVAL;
 	}
 
 	if (ns->options & OPT_SMALLPAGE) {
-- 
2.7.3
