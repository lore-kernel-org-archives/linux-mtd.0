Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjQDv-0008Fi-J7
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 10:11:37 +0000
Received: by mail-wi0-f182.google.com with SMTP id d1so4079149wiv.3
 for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2014 03:11:05 -0700 (PDT)
From: Rostislav Lisovy <lisovy@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4] mtd: nand: omap: Synchronize the access to the ECC engine
Date: Wed, 29 Oct 2014 11:10:59 +0100
Message-Id: <1414577459-26135-1-git-send-email-lisovy@merica.cz>
Cc: lisovy@gmail.com, michal.vokac@comap.cz, sojkam1@fel.cvut.cz,
 Rostislav Lisovy <lisovy@merica.cz>, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The AM335x Technical Reference Manual (spruh73j.pdf) says
"Because the ECC engine includes only one accumulation context,
it can be allocated to only one chip-select at a time ... "
(7.1.3.3.12.3). Since the commit 97a288ba2cfa ("ARM: omap2+:
gpmc-nand: Use dynamic platform_device_alloc()") gpmc-nand
driver supports multiple NAND flash devices connected to
the single controller.
Use global 'struct nand_hw_control' among multiple NAND
instances to synchronize the access to the single ECC Engine.

Tested with custom AM335x board using 2x NAND flash chips.

Signed-off-by: Rostislav Lisovy <lisovy@merica.cz>
Acked-by: Roger Quadros <rogerq@ti.com>
---
Changes since v3:
* Make the omap_gpmc_controller static (Frans Klaver)

Changes since v2:
* Do not use custom locks. Use global 'struct nand_hw_control'
  among multiple NAND instances and it will do the work for us
  (Roger Quadros)

Changes since v1:
* Since not all the read/write operations are performed by the
  omap_read(write)_page_bch() functions use the locks directly on
  those places that configure the ECC engine (take the lock) and
  read the result from the ECC engine (release the lock).
  This approach should cover read/write operations with all
  possible ECC modes. (Roger Quadros)


 drivers/mtd/nand/omap2.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index b0f89d8..ec040b4 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -144,8 +144,13 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 	0xac, 0x6b, 0xff, 0x99, 0x7b};
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
+/* Shared among all NAND instances to synchronize the access to the ECC Engine */
+static struct nand_hw_control omap_gpmc_controller = {
+	.lock = __SPIN_LOCK_UNLOCKED(omap_gpmc_controller.lock),
+	.wq = __WAIT_QUEUE_HEAD_INITIALIZER(omap_gpmc_controller.wq),
+};
+
 struct omap_nand_info {
-	struct nand_hw_control		controller;
 	struct omap_nand_platform_data	*pdata;
 	struct mtd_info			mtd;
 	struct nand_chip		nand;
@@ -1685,9 +1690,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, info);
 
-	spin_lock_init(&info->controller.lock);
-	init_waitqueue_head(&info->controller.wq);
-
 	info->pdev		= pdev;
 	info->gpmc_cs		= pdata->cs;
 	info->reg		= pdata->reg;
@@ -1707,7 +1709,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 
 	info->phys_base = res->start;
 
-	nand_chip->controller = &info->controller;
+	nand_chip->controller = &omap_gpmc_controller;
 
 	nand_chip->IO_ADDR_W = nand_chip->IO_ADDR_R;
 	nand_chip->cmd_ctrl  = omap_hwcontrol;
-- 
1.9.1
