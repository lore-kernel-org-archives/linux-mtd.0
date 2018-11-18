Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOTWw-0002sj-0A
 for linux-mtd@lists.infradead.org; Sun, 18 Nov 2018 20:18:56 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/2] mtd: fix mtd_oobavail() incoherent returned value
Date: Sun, 18 Nov 2018 21:18:30 +0100
Message-Id: <20181118201831.11636-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_oobavail() returns either mtd->oovabail or mtd->oobsize. Both
values are unsigned 32-bit entities, so there is no reason to pretend
returning a signed one.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/mtd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cd0be91bdefa..035d641e8847 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -386,7 +386,7 @@ static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
 	return dev_of_node(&mtd->dev);
 }
 
-static inline int mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
+static inline u32 mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
 {
 	return ops->mode == MTD_OPS_AUTO_OOB ? mtd->oobavail : mtd->oobsize;
 }
-- 
2.17.1
