Received: from smtp.mei.co.jp ([133.183.100.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WajTZ-0002RA-Jf
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 10:23:26 +0000
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
 by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile11) with ESMTP id
 s3HAN33i010990
 for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2014 19:23:03 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
 by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili16) with ESMTP id s3HAN4M08972
 for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2014 19:23:04 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: denali: fix write_oob_data() function
Date: Thu, 17 Apr 2014 19:22:54 +0900
Message-Id: <1397730174-4763-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since write_oob_data is calling denali_send_pipeline_cmd()
with access_type=SPARE_ACCESS, this might has no impact.

But calling it with tranfser_spare=false looks weird because
write_oob_data() is the function for transferring the spare area.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 drivers/mtd/nand/denali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index c07cd57..a55b9d4 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -841,7 +841,7 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 
 	denali->page = page;
 
-	if (denali_send_pipeline_cmd(denali, false, false, SPARE_ACCESS,
+	if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
 							DENALI_WRITE) == PASS) {
 		write_data_to_flash_mem(denali, buf, mtd->oobsize);
 
-- 
1.8.3.2
