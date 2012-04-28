Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNwX5-00036o-83
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 01:33:08 +0000
Received: by mail-pz0-f43.google.com with SMTP id n15so2142415dad.16
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 18:33:07 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 09/10] mtd: nand: utilize oob_required parameter
Date: Fri, 27 Apr 2012 18:29:53 -0700
Message-Id: <1335576594-25267-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't read/write OOB if the caller doesn't requre it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 13a6355..5b390ae 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1075,7 +1075,8 @@ static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 			      uint8_t *buf, int oob_required, int page)
 {
 	chip->read_buf(mtd, buf, mtd->writesize);
-	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
 	return 0;
 }
 
@@ -1934,7 +1935,8 @@ static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 				const uint8_t *buf, int oob_required)
 {
 	chip->write_buf(mtd, buf, mtd->writesize);
-	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
 }
 
 /**
-- 
1.7.5.4.2.g519b1
