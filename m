Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6ErO-0000h3-0N
 for linux-mtd@lists.infradead.org; Wed, 31 Dec 2014 08:42:31 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: remove duplicate comment line
Date: Wed, 31 Dec 2014 10:41:54 +0200
Message-Id: <a1b5a128d9a40456cbc701f5a255c7edde7a7f7a.1420015314.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 7854d3f7495b1 (mtd: spelling, capitalization, uniformity) added a
correctly spelled line, but failed to remove the wrongly spelled one. Commit
064a7694b534 (mtd: Fix typo mtd/tests) then fixed the spelling again, but left
the duplication.

Fixes: 7854d3f7495b1 (mtd: spelling, capitalization, uniformity)
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/nand_base.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 41585dfb206f..7bfa519588a4 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -157,7 +157,6 @@ static uint8_t nand_read_byte(struct mtd_info *mtd)
 
 /**
  * nand_read_byte16 - [DEFAULT] read one byte endianness aware from the chip
- * nand_read_byte16 - [DEFAULT] read one byte endianness aware from the chip
  * @mtd: MTD device structure
  *
  * Default read function for 16bit buswidth with endianness conversion.
-- 
2.1.4
