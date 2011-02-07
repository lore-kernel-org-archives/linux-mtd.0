Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmY0i-0003y2-8F
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 20:48:37 +0000
Received: by bwz5 with SMTP id 5so5613623bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Feb 2011 12:48:32 -0800 (PST)
Date: Mon, 7 Feb 2011 23:48:25 +0300
From: Stanislav Fomichev <kernel@fomichev.me>
To: dwmw2@infradead.org
Subject: [PATCH] mtd/nand: move pointer dereferencing after the actual
	check in verify_bbt_descr
Message-ID: <4d505a9f.918acc0a.1584.ffffbfd6@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Stanislav Fomichev <kernel@fomichev.me>
---
 drivers/mtd/nand/nand_bbt.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 6ebd869..a1e8b30 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1101,12 +1101,16 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
 	struct nand_chip *this = mtd->priv;
-	u32 pattern_len = bd->len;
-	u32 bits = bd->options & NAND_BBT_NRBITS_MSK;
+	u32 pattern_len;
+	u32 bits;
 	u32 table_size;
 
 	if (!bd)
 		return;
+
+	pattern_len = bd->len;
+	bits = bd->options & NAND_BBT_NRBITS_MSK;
+
 	BUG_ON((this->options & NAND_USE_FLASH_BBT_NO_OOB) &&
 			!(this->options & NAND_USE_FLASH_BBT));
 	BUG_ON(!bits);
-- 
1.7.1
