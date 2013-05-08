Received: from egauge.net ([108.168.136.98] helo=slt.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZwao-00017G-Jw
 for linux-mtd@lists.infradead.org; Wed, 08 May 2013 05:07:08 +0000
From: David Mosberger <dmosberger@gmail.com>
To: David.Woodhouse@intel.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand_base: Only use GET/SET FEATURES command on chips
 that support them.
Date: Tue,  7 May 2013 23:06:22 -0600
Message-Id: <1367989582-6375-1-git-send-email-dmosberger@gmail.com>
Cc: David Mosberger <davidm@egauge.net>, David Mosberger <dmosberger@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Mosberger <davidm@egauge.net>

Spansion's S34MLx chips support ONFI but not the GET/SET FEATURES calls.

Signed-off-by: David Mosberger <dmosberger@gmail.com>
Reviewed-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    8 ++++++--
 include/linux/mtd/nand.h     |    3 +++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index dfcd0a5..13bdb96 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2720,7 +2720,9 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
 {
 	int status;
 
-	if (!chip->onfi_version)
+	if (!chip->onfi_version ||
+	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
+	      & ONFI_OPT_CMD_SET_GET_FEATURES))
 		return -EINVAL;
 
 	chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, -1);
@@ -2741,7 +2743,9 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
 static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
 			int addr, uint8_t *subfeature_param)
 {
-	if (!chip->onfi_version)
+	if (!chip->onfi_version ||
+	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
+	      & ONFI_OPT_CMD_SET_GET_FEATURES))
 		return -EINVAL;
 
 	/* clear the sub feature parameters */
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index ab63634..9b98af8 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -217,6 +217,9 @@ struct nand_chip;
 /* ONFI subfeature parameters length */
 #define ONFI_SUBFEATURE_PARAM_LEN	4
 
+/* ONFI optional commands SET/GET FEATURES supported? */
+#define ONFI_OPT_CMD_SET_GET_FEATURES	(1 << 2)
+
 struct nand_onfi_params {
 	/* rev info and features block */
 	/* 'O' 'N' 'F' 'I'  */
-- 
1.7.5.4
