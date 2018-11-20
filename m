Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP3iy-0006o1-03
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 10:57:45 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [RFC PATCH 3/5] mtd: rawnand: omap2: Use nand_controller_init()
Date: Tue, 20 Nov 2018 11:57:18 +0100
Message-Id: <20181120105720.23081-4-boris.brezillon@bootlin.com>
In-Reply-To: <20181120105720.23081-1-boris.brezillon@bootlin.com>
References: <20181120105720.23081-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stop initializing omap_gpmc_controller fields are declaration time and
replace that by a call to nand_controller_init(). Since the same object
might be shared by several NAND chips and the NAND controller driver
expects a ->probe() per-chip, we need to keep track of the
omap_gpmc_controller state (whether it's already been initialized or
not).

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/omap2.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 886d05c391ef..086561811896 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2173,11 +2173,8 @@ static const struct nand_controller_ops omap_nand_controller_ops = {
 };
 
 /* Shared among all NAND instances to synchronize access to the ECC Engine */
-static struct nand_controller omap_gpmc_controller = {
-	.lock = __SPIN_LOCK_UNLOCKED(omap_gpmc_controller.lock),
-	.wq = __WAIT_QUEUE_HEAD_INITIALIZER(omap_gpmc_controller.wq),
-	.ops = &omap_nand_controller_ops,
-};
+static struct nand_controller omap_gpmc_controller;
+static bool omap_gpmc_controller_initialized;
 
 static int omap_nand_probe(struct platform_device *pdev)
 {
@@ -2227,6 +2224,12 @@ static int omap_nand_probe(struct platform_device *pdev)
 
 	info->phys_base = res->start;
 
+	if (!omap_gpmc_controller_initialized) {
+		omap_gpmc_controller.ops = &omap_nand_controller_ops;
+		nand_controller_init(&omap_gpmc_controller);
+		omap_gpmc_controller_initialized = true;
+	}
+
 	nand_chip->controller = &omap_gpmc_controller;
 
 	nand_chip->legacy.IO_ADDR_W = nand_chip->legacy.IO_ADDR_R;
-- 
2.17.1
