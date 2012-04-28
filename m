Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNwX6-00038V-JR
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 01:33:09 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq13so1739571pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 18:33:08 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 10/10] mtd: pxa3xx_nand: utilize oob_required parameter
Date: Fri, 27 Apr 2012 18:29:54 -0700
Message-Id: <1335576594-25267-11-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Axel Lin <axel.lin@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
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
 drivers/mtd/nand/pxa3xx_nand.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 82ef968..372bc47 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -685,7 +685,8 @@ static void pxa3xx_nand_write_page_hwecc(struct mtd_info *mtd,
 		struct nand_chip *chip, const uint8_t *buf, int oob_required)
 {
 	chip->write_buf(mtd, buf, mtd->writesize);
-	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
 }
 
 static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
@@ -696,7 +697,8 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
 	struct pxa3xx_nand_info *info = host->info_data;
 
 	chip->read_buf(mtd, buf, mtd->writesize);
-	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
 
 	if (info->retcode == ERR_SBERR) {
 		switch (info->use_ecc) {
-- 
1.7.5.4.2.g519b1
