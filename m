Received: from mail-we0-x243.google.com ([2a00:1450:400c:c03::243])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W9f1z-00054H-UX
 for linux-mtd@lists.infradead.org; Sat, 01 Feb 2014 18:11:04 +0000
Received: by mail-we0-f195.google.com with SMTP id t60so362539wes.2
 for <linux-mtd@lists.infradead.org>; Sat, 01 Feb 2014 10:10:33 -0800 (PST)
From: Boris BREZILLON <b.brezillon.dev@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: fix erronous read_buf call in
 nand_write_page_raw_syndrome
Date: Sat,  1 Feb 2014 19:10:28 +0100
Message-Id: <1391278228-12701-1-git-send-email-b.brezillon.dev@gmail.com>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

read_buf is called in place of write_buf in the
nand_write_page_raw_syndrome function.

Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 15069ec..f59a465 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1902,7 +1902,7 @@ static int nand_write_page_raw_syndrome(struct mtd_info *mtd,
 			oob += chip->ecc.prepad;
 		}
 
-		chip->read_buf(mtd, oob, eccbytes);
+		chip->write_buf(mtd, oob, eccbytes);
 		oob += eccbytes;
 
 		if (chip->ecc.postpad) {
-- 
1.7.9.5
