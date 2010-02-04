Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ncvt2-0002jg-Kf
	for linux-mtd@lists.infradead.org; Thu, 04 Feb 2010 07:12:28 +0000
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id o147CMjl025359
	for <linux-mtd@lists.infradead.org>;
	Wed, 3 Feb 2010 23:12:22 -0800 (PST)
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: nand: move the checking the validity of oob into
	nand_write_oob
Date: Thu,  4 Feb 2010 15:18:37 +0800
Message-Id: <1265267917-2487-2-git-send-email-stanley.miao@windriver.com>
In-Reply-To: <1265267917-2487-1-git-send-email-stanley.miao@windriver.com>
References: <1265267917-2487-1-git-send-email-stanley.miao@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_write_oob will invoke nand_do_write_oob or nand_do_write_ops depending
on if ops->datbuf is NULL. nand_do_write_oob checked the validity of oob
but nand_do_write_ops didn't. Now move the check into nand_write_oob to
ensure the validity of oobbuf.

Signed-off-by: Stanley.Miao <stanley.miao@windriver.com>
---
 drivers/mtd/nand/nand_base.c |   69 ++++++++++++++++++++++-------------------
 1 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8f2958f..29e2a06 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2113,40 +2113,9 @@ static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
-	int chipnr, page, status, len;
+	int chipnr, page, status;
 	struct nand_chip *chip = mtd->priv;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
-			 __func__, (unsigned int)to, (int)ops->ooblen);
-
-	if (ops->mode == MTD_OOB_AUTO)
-		len = chip->ecc.layout->oobavail;
-	else
-		len = mtd->oobsize;
-
-	/* Do not allow write past end of page */
-	if ((ops->ooboffs + ops->ooblen) > len) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to write "
-				"past end of page\n", __func__);
-		return -EINVAL;
-	}
-
-	if (unlikely(ops->ooboffs >= len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to start "
-				"write outside oob\n", __func__);
-		return -EINVAL;
-	}
-
-	/* Do not allow reads past end of device */
-	if (unlikely(to >= mtd->size ||
-		     ops->ooboffs + ops->ooblen >
-			((mtd->size >> chip->page_shift) -
-			 (to >> chip->page_shift)) * len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt write beyond "
-				"end of device\n", __func__);
-		return -EINVAL;
-	}
-
 	chipnr = (int)(to >> chip->chip_shift);
 	chip->select_chip(mtd, chipnr);
 
@@ -2203,6 +2172,42 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 		return -EINVAL;
 	}
 
+	if (ops->oobbuf) {
+		int len;
+		DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, ooblen = %i\n",
+				__func__, (unsigned int)to, (int)ops->ooblen);
+
+		if (ops->mode == MTD_OOB_AUTO)
+			len = chip->ecc.layout->oobavail;
+		else
+			len = mtd->oobsize;
+
+		/* Do not allow write past end of page */
+		if ((ops->ooboffs + ops->ooblen) > len) {
+			DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to write "
+					"past end of page\n", __func__);
+			return -EINVAL;
+		}
+
+		if (unlikely(ops->ooboffs >= len)) {
+			DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to start "
+					"write outside oob\n", __func__);
+			return -EINVAL;
+		}
+
+		/* Do not allow reads past end of device */
+		if (unlikely(to >= mtd->size ||
+					ops->ooboffs + ops->ooblen >
+					((mtd->size >> chip->page_shift) -
+					 (to >> chip->page_shift)) * len)) {
+			DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt write beyond "
+					"end of device\n", __func__);
+			return -EINVAL;
+		}
+
+
+	}
+
 	nand_get_device(chip, mtd, FL_WRITING);
 
 	switch(ops->mode) {
-- 
1.5.4.3
