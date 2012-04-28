Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNwVz-0002z5-8Q
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 01:31:59 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq13so1738840pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 18:31:59 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 03/10] mtd: Blackfin NFC: utilize oob_required parameter
Date: Fri, 27 Apr 2012 18:29:47 -0700
Message-Id: <1335576594-25267-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Jamie Iles <jamie@jamieiles.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't read/write OOB if the caller doesn't require it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/bf5xx_nand.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 3f1c185..8188416 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -561,7 +561,8 @@ static int bf5xx_nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip
 		uint8_t *buf, int oob_required, int page)
 {
 	bf5xx_nand_read_buf(mtd, buf, mtd->writesize);
-	bf5xx_nand_read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		bf5xx_nand_read_buf(mtd, chip->oob_poi, mtd->oobsize);
 
 	return 0;
 }
@@ -570,7 +571,8 @@ static void bf5xx_nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *ch
 		const uint8_t *buf, int oob_required)
 {
 	bf5xx_nand_write_buf(mtd, buf, mtd->writesize);
-	bf5xx_nand_write_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		bf5xx_nand_write_buf(mtd, chip->oob_poi, mtd->oobsize);
 }
 
 /*
-- 
1.7.5.4.2.g519b1
