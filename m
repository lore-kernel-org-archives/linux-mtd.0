Received: from mail-pb0-f51.google.com ([209.85.160.51])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UEdEc-0003iF-27
 for linux-mtd@lists.infradead.org; Sun, 10 Mar 2013 10:12:06 +0000
Received: by mail-pb0-f51.google.com with SMTP id un15so2725110pbc.10
 for <linux-mtd@lists.infradead.org>; Sun, 10 Mar 2013 03:12:04 -0700 (PDT)
From: Tao Hou <hotforest@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: fix the partial page write condition
Date: Sun, 10 Mar 2013 18:18:24 +0800
Message-Id: <1362910704-24133-1-git-send-email-hotforest@gmail.com>
Cc: Tao Hou <hotforest@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When writelen is mtd->writesize - 1, it is still a partial page write

Signed-off-by: Tao Hou <hotforest@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4321415..c6161eb 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2210,7 +2210,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 		uint8_t *wbuf = buf;
 
 		/* Partial page write? */
-		if (unlikely(column || writelen < (mtd->writesize - 1))) {
+		if (unlikely(column || writelen < mtd->writesize)) {
 			cached = 0;
 			bytes = min_t(int, bytes - column, (int) writelen);
 			chip->pagebuf = -1;
-- 
1.7.9.5
