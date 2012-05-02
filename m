Received: from mail-pz0-f44.google.com ([209.85.210.44])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPdA9-0002mH-C3
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 17:16:26 +0000
Received: by mail-pz0-f44.google.com with SMTP id x6so85712dac.31
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 10:16:25 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 10/10] mtd: pxa3xx_nand: utilize oob_required parameter
Date: Wed,  2 May 2012 10:15:04 -0700
Message-Id: <1335978904-8005-11-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
References: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
Cc: Lei Wen <leiwen@marvell.com>, eric miao <eric.miao@marvell.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
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
index 252aaef..8ca303a 100644
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
