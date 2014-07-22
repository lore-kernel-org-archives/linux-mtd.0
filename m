Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9PUs-0007hy-1w
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:08:06 +0000
Received: by mail-pd0-f175.google.com with SMTP id r10so8791438pdi.34
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:07:44 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: denali: set proper error code on timeout
Date: Mon, 21 Jul 2014 19:07:31 -0700
Message-Id: <1405994851-19493-1-git-send-email-computersforpeace@gmail.com>
Cc: Jamie Iles <jamie@jamieiles.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The condition "if (irq_status == 0)" already ensures that one half of
the ternary ?: is dead. I think this should probably actually be a FAIL,
not a PASS.

Caught by Coverity.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 0b071a3136a2..332a3279dd8d 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1061,9 +1061,7 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
 		dev_err(denali->dev,
 				"timeout on write_page (type = %d)\n",
 				raw_xfer);
-		denali->status =
-			(irq_status & INTR_STATUS__PROGRAM_FAIL) ?
-			NAND_STATUS_FAIL : PASS;
+		denali->status = NAND_STATUS_FAIL;
 	}
 
 	denali_enable_dma(denali, false);
-- 
1.9.1
