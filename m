Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPsWf-0002Wz-8Y
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 15:35:39 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: cqspi: remove duplicate const
Date: Tue, 27 Jun 2017 17:34:19 +0200
Message-Id: <20170627153508.1329697-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The variable was already marked 'const' before the previous
patch, but the qualifier was in an unusual place, and now the
extra 'const' causes a harmless warning:

drivers/mtd/spi-nor/cadence-quadspi.c:1286:34: error: duplicate 'const' declaration specifier [-Werror=duplicate-decl-specifier]

This removes the other 'const' instead.

Fixes: f993c123b461 ("mtd: spi-nor: cqspi: make of_device_ids const")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index d315c326e72f..53c7d8e0327a 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -1283,7 +1283,7 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
 #define CQSPI_DEV_PM_OPS	NULL
 #endif
 
-static const struct of_device_id const cqspi_dt_ids[] = {
+static const struct of_device_id cqspi_dt_ids[] = {
 	{.compatible = "cdns,qspi-nor",},
 	{ /* end of table */ }
 };
-- 
2.9.0
