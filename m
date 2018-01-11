Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZkc7-0006h4-4r
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 21:42:20 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>, stable@vger.kernel.org
Subject: [PATCH v2] mtd: nand: Fix nand_do_read_oob() return value
Date: Thu, 11 Jan 2018 22:42:02 +0100
Message-Id: <20180111214202.24531-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Starting from commit 041e4575f034 ("mtd: nand: handle ECC errors in
OOB"), nand_do_read_oob() (from the NAND core) did return 0 or a
negative error, and the MTD layer expected it.

However, the trend for the NAND layer is now to return an error or a
positive number of bitflips. Deciding which status to return to the user
belongs to the MTD layer.

Commit e47f68587b82 ("mtd: check for max_bitflips in mtd_read_oob()")
brought this logic to the mtd_read_oob() function while the return value
coming from nand_do_read_oob() (called by the ->_read_oob() hook) was
left unchanged.

Fixes: e47f68587b82 ("mtd: check for max_bitflips in mtd_read_oob()")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---

Changes since v1:
  - s/->ecc.read_oob() hook/->_read_oob() hook/ in the commit message
  - Fixed the compilation issue

 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 469220065b8b..440d9f5d5b17 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3876,7 +3876,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
 
-	return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	return ret;
 }
 
 /**
-- 
2.11.0
