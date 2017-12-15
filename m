Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ePpHw-00045P-H3
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 12:40:30 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: [PATCH v3 1/4] mtd: Do not allow MTD devices with inconsistent erase
 properties
Date: Fri, 15 Dec 2017 13:39:51 +0100
Message-Id: <20171215123954.30017-2-boris.brezillon@free-electrons.com>
In-Reply-To: <20171215123954.30017-1-boris.brezillon@free-electrons.com>
References: <20171215123954.30017-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When mtd->erasesize is 0 or mtd->_erase is NULL, that means the device
does not support the erase operation, which in turn means it should
have the MTD_NO_ERASE flag set.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
Changes in v3:
- new patch
---
 drivers/mtd/mtdcore.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index f80e911b8843..642c35dde686 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -503,6 +503,11 @@ int add_mtd_device(struct mtd_info *mtd)
 		return -EEXIST;
 
 	BUG_ON(mtd->writesize == 0);
+
+	if (WARN_ON((!mtd->erasesize || !mtd->_erase) &&
+		    !(mtd->flags & MTD_NO_ERASE)))
+		return -EINVAL;
+
 	mutex_lock(&mtd_table_mutex);
 
 	i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
-- 
2.11.0
