Received: from mail-oi0-f66.google.com ([209.85.218.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuTDh-00076R-JM
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 01:55:15 +0000
Received: by mail-oi0-f66.google.com with SMTP id t68-v6so1698525oie.12
 for <linux-mtd@lists.infradead.org>; Mon, 27 Aug 2018 18:55:00 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: Convert to using %pOFn instead of
 device_node.name
Date: Mon, 27 Aug 2018 20:52:34 -0500
Message-Id: <20180828015252.28511-33-robh@kernel.org>
In-Reply-To: <20180828015252.28511-1-robh@kernel.org>
References: <20180828015252.28511-1-robh@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In preparation to remove the node name pointer from struct device_node,
convert printf users to use the %pOFn format specifier.

Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/mtd/nand/raw/fsl_upm.c | 4 ++--
 drivers/mtd/nand/raw/ndfc.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index a88e2cf66e0f..ca82727eca94 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -184,8 +184,8 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 		return -ENODEV;
 
 	nand_set_flash_node(&fun->chip, flash_np);
-	mtd->name = kasprintf(GFP_KERNEL, "0x%llx.%s", (u64)io_res->start,
-			      flash_np->name);
+	mtd->name = kasprintf(GFP_KERNEL, "0x%llx.%pOFn", (u64)io_res->start,
+			      flash_np);
 	if (!mtd->name) {
 		ret = -ENOMEM;
 		goto err;
diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index 540fa1a0ea24..b193f373f235 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -174,8 +174,8 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 		return -ENODEV;
 	nand_set_flash_node(chip, flash_np);
 
-	mtd->name = kasprintf(GFP_KERNEL, "%s.%s", dev_name(&ndfc->ofdev->dev),
-			      flash_np->name);
+	mtd->name = kasprintf(GFP_KERNEL, "%s.%pOFn", dev_name(&ndfc->ofdev->dev),
+			      flash_np);
 	if (!mtd->name) {
 		ret = -ENOMEM;
 		goto err;
-- 
2.17.1
