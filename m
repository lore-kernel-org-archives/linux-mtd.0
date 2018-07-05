From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/8] mtd: rawnand: Remove nand_do_read() prototype from
 rawnand.h
Date: Thu,  5 Jul 2018 12:27:27 +0200
Message-Id: <20180705102733.29673-3-boris.brezillon@bootlin.com>
In-Reply-To: <20180705102733.29673-1-boris.brezillon@bootlin.com>
References: <20180705102733.29673-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_do_read() is a static function implemented in nand_base.c. There's
no good reason to expose its prototype in rawnand.h.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 include/linux/mtd/rawnand.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 0c6fb316b409..4d7a46c42900 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1545,8 +1545,6 @@ int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
 int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
 int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		    int allowbbt);
-int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
-		 size_t *retlen, uint8_t *buf);
 
 /**
  * struct platform_nand_chip - chip level device structure
-- 
2.14.1
