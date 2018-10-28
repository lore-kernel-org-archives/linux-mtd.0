Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGjGn-0002CL-P7
 for linux-mtd@lists.infradead.org; Sun, 28 Oct 2018 11:30:15 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org
Subject: [PATCH] mtd: nand: Fix nanddev_neraseblocks()
Date: Sun, 28 Oct 2018 12:29:55 +0100
Message-Id: <20181028112955.26547-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nanddev_neraseblocks() currently returns the number pages per LUN
instead of the total number of eraseblocks.

Fixes: 9c3736a3de21 ("mtd: nand: Add core infrastructure to deal with NAND devices")
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 include/linux/mtd/nand.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index abe975c87b90..78b86dea2f29 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -324,9 +324,8 @@ static inline unsigned int nanddev_ntargets(const struct nand_device *nand)
  */
 static inline unsigned int nanddev_neraseblocks(const struct nand_device *nand)
 {
-	return (u64)nand->memorg.luns_per_target *
-	       nand->memorg.eraseblocks_per_lun *
-	       nand->memorg.pages_per_eraseblock;
+	return nand->memorg.ntargets * nand->memorg.luns_per_target *
+	       nand->memorg.eraseblocks_per_lun;
 }
 
 /**
-- 
2.17.1
