Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dLnfj-0003IS-HB
 for linux-mtd@lists.infradead.org; Fri, 16 Jun 2017 09:36:09 +0000
Received: by mail-pg0-x244.google.com with SMTP id j186so5162032pge.1
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jun 2017 02:35:51 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: cqspi: make of_device_ids const
Date: Fri, 16 Jun 2017 15:05:17 +0530
Message-Id: <c4663aaa9e5753053f6ac12a3565e0e1995f3b55.1497605323.git.arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

of_device_ids are not supposed to change at runtime. All functions
working with of_device_ids provided by <linux/of.h> work with const
of_device_ids. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 9f8102d..1a25637 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1277,7 +1277,7 @@ static int cqspi_resume(struct device *dev)
 #define CQSPI_DEV_PM_OPS	NULL
 #endif
 
-static struct of_device_id const cqspi_dt_ids[] = {
+static const struct of_device_id const cqspi_dt_ids[] = {
 	{.compatible = "cdns,qspi-nor",},
 	{ /* end of table */ }
 };
-- 
1.9.1
