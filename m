Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqmjT-0007KX-Ux
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 14:24:52 +0000
Received: by mail-pw0-f49.google.com with SMTP id x9so2050943pbd.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 06:24:51 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH] mtd/onenand: use string library
Date: Fri, 27 Jan 2012 23:24:50 +0900
Message-Id: <1327674295-3700-3-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1327674295-3700-1-git-send-email-akinobu.mita@gmail.com>
References: <1327674295-3700-1-git-send-email-akinobu.mita@gmail.com>
Cc: linux-mtd@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- Use memchr_inv to check if the data contains all 0xFF bytes.
  It is faster than looping for each byte.

- Use memcmp to compare memory areas

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/onenand/onenand_base.c |    8 ++------
 drivers/mtd/onenand/onenand_bbt.c  |   10 +++-------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a061bc1..374605f 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3673,7 +3673,7 @@ static void flexonenand_get_size(struct mtd_info *mtd)
 static int flexonenand_check_blocks_erased(struct mtd_info *mtd, int start, int end)
 {
 	struct onenand_chip *this = mtd->priv;
-	int i, ret;
+	int ret;
 	int block;
 	struct mtd_oob_ops ops = {
 		.mode = MTD_OPS_PLACE_OOB,
@@ -3699,11 +3699,7 @@ static int flexonenand_check_blocks_erased(struct mtd_info *mtd, int start, int
 		if (ret)
 			return ret;
 
-		for (i = 0; i < mtd->oobsize; i++)
-			if (this->oob_buf[i] != 0xff)
-				break;
-
-		if (i != mtd->oobsize) {
+		if (memchr_inv(this->oob_buf, 0xff, mtd->oobsize)) {
 			printk(KERN_WARNING "%s: Block %d not erased.\n",
 				__func__, block);
 			return 1;
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index 66fe3b7..8b1277b 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -32,14 +32,10 @@
  */
 static int check_short_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
 {
-	int i;
-	uint8_t *p = buf;
-
 	/* Compare the pattern */
-	for (i = 0; i < td->len; i++) {
-		if (p[i] != td->pattern[i])
-			return -1;
-	}
+	if (memcmp(buf, td->pattern, td->len))
+		return -1;
+
         return 0;
 }
 
-- 
1.7.4.4
