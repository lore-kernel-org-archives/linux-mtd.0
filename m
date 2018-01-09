Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYpcg-0008QN-79
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 08:51:07 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 Ladislav Michl <ladis@linux-mips.org>
Subject: [PATCH v5 1/3] mtd: mtdpart: Make ECC stat handling consistent
Date: Tue,  9 Jan 2018 09:50:33 +0100
Message-Id: <20180109085035.12438-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

part_read() and part_read_oob() where counting ECC failures and
bitflips differently. Adjust part_read_oob() to mimic what is done in
part_read(). This is in needed to use ->_read_oob() as a fallback when
when ->_read() is not implemented.

Note that bitflips and ECC failure accounting on MTD partitions is
broken by design, because nothing prevents concurrent accesses to the
underlying master MTD device between the moment we save the stats in a
local variable and the moment master->_read[_oob]() returns. It's not
something that can easily be fixed, so leave it like that for now.

Suggested-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Tested-by: Ladislav Michl <ladis@linux-mips.org>
---
Changes in v5:
- save master's ECC stats before calling ->_read_oob()

Changes in v4:
- new patch
---
 drivers/mtd/mtdpart.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index be088bccd593..79bf1f61c7a0 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -105,6 +105,7 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 		struct mtd_oob_ops *ops)
 {
 	struct mtd_part *part = mtd_to_part(mtd);
+	struct mtd_ecc_stats stats;
 	int res;
 
 	if (from >= mtd->size)
@@ -126,13 +127,14 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 			return -EINVAL;
 	}
 
+	stats = part->parent->ecc_stats;
 	res = part->parent->_read_oob(part->parent, from + part->offset, ops);
-	if (unlikely(res)) {
-		if (mtd_is_bitflip(res))
-			mtd->ecc_stats.corrected++;
-		if (mtd_is_eccerr(res))
-			mtd->ecc_stats.failed++;
-	}
+	if (unlikely(mtd_is_eccerr(res)))
+		mtd->ecc_stats.failed +=
+			part->parent->ecc_stats.failed - stats.failed;
+	else
+		mtd->ecc_stats.corrected +=
+			part->parent->ecc_stats.corrected - stats.corrected;
 	return res;
 }
 
-- 
2.11.0
