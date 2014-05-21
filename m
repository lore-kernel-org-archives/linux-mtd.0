Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmzqS-0000it-Bx
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 06:17:44 +0000
Received: by mail-pa0-f54.google.com with SMTP id bj1so1089286pad.27
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 23:17:23 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/6] mtd: nand_bbt: handle error case for
 nand_create_badblock_pattern()
Date: Tue, 20 May 2014 23:17:02 -0700
Message-Id: <1400653023-25757-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
References: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 6cbf8768a0a4..7f0c3b4c2a4f 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1282,6 +1282,7 @@ static int nand_create_badblock_pattern(struct nand_chip *this)
 int nand_default_bbt(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
+	int ret;
 
 	/* Is a flash based bad block table requested? */
 	if (this->bbt_options & NAND_BBT_USE_FLASH) {
@@ -1300,8 +1301,11 @@ int nand_default_bbt(struct mtd_info *mtd)
 		this->bbt_md = NULL;
 	}
 
-	if (!this->badblock_pattern)
-		nand_create_badblock_pattern(this);
+	if (!this->badblock_pattern) {
+		ret = nand_create_badblock_pattern(this);
+		if (ret)
+			return ret;
+	}
 
 	return nand_scan_bbt(mtd, this->badblock_pattern);
 }
-- 
1.7.9.5
