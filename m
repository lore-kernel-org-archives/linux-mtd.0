Received: from smtp.mei.co.jp ([133.183.100.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXmuU-0008Iu-KN
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 07:27:04 +0000
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
 by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile13) with ESMTP id
 s397Qcrf026275
 for <linux-mtd@lists.infradead.org>; Wed, 9 Apr 2014 16:26:38 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
 by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili13) with ESMTP id s397QbJ12670
 for <linux-mtd@lists.infradead.org>; Wed, 9 Apr 2014 16:26:37 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: fix a typo in a comment line
Date: Wed,  9 Apr 2014 16:26:26 +0900
Message-Id: <1397028386-16304-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9d01c4d..33ec641 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3607,7 +3607,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	chip->onfi_version = 0;
 	if (!type->name || !type->pagesize) {
-		/* Check is chip is ONFI compliant */
+		/* Check if the chip is ONFI compliant */
 		if (nand_flash_detect_onfi(mtd, chip, &busw))
 			goto ident_done;
 
-- 
1.8.3.2
