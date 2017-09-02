Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1do49x-0002el-FP
 for linux-mtd@lists.infradead.org; Sat, 02 Sep 2017 08:52:11 +0000
Received: by mail-wm0-x243.google.com with SMTP id u26so2055616wma.5
 for <linux-mtd@lists.infradead.org>; Sat, 02 Sep 2017 01:51:47 -0700 (PDT)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH] mtd: nand: remove unused blockmask variable
Date: Sat,  2 Sep 2017 10:49:38 +0200
Message-Id: <20170902084938.15942-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fix the following build warning:
drivers/mtd/nand/nand_base.c:2671:30: attention : variable ‘blockmask’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9900476a0afe..b875fd365084 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2668,7 +2668,7 @@ static uint8_t *nand_fill_oob(struct mtd_info *mtd, uint8_t *oob, size_t len,
 static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
-	int chipnr, realpage, page, blockmask, column;
+	int chipnr, realpage, page, column;
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	uint32_t writelen = ops->len;
 
@@ -2704,7 +2704,6 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 
 	realpage = (int)(to >> chip->page_shift);
 	page = realpage & chip->pagemask;
-	blockmask = (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
 
 	/* Invalidate the page cache, when we write to the cached page */
 	if (to <= ((loff_t)chip->pagebuf << chip->page_shift) &&
-- 
2.13.5
