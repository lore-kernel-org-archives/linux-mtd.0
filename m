Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SmjWy-0001lb-2y
 for linux-mtd@lists.infradead.org; Thu, 05 Jul 2012 10:43:29 +0000
Received: by bkcji2 with SMTP id ji2so2785718bkc.36
 for <linux-mtd@lists.infradead.org>; Thu, 05 Jul 2012 03:41:23 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: sh_flctl: Only copy OOB data if it is required
Date: Thu,  5 Jul 2012 12:41:02 +0200
Message-Id: <1341484862-24033-2-git-send-email-hechtb@gmail.com>
In-Reply-To: <1341484862-24033-1-git-send-email-hechtb@gmail.com>
References: <1341484862-24033-1-git-send-email-hechtb@gmail.com>
Cc: Bastian Hecht <hechtb@gmail.com>, Linux-SH <linux-sh@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Check the new oob_required flag and only copy the OOB data to the internal
buffer if needed.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
I did this only for reading, as for writing the current code would write random data to the non-ECC OOB area when oob_required is false, so I preferred taking the data from the nand_base layer.

 drivers/mtd/nand/sh_flctl.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index e4f31ef..0b798fb 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -398,7 +398,8 @@ static int flctl_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 				uint8_t *buf, int oob_required, int page)
 {
 	chip->read_buf(mtd, buf, mtd->writesize);
-	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
 	return 0;
 }
 
-- 
1.7.9.5
