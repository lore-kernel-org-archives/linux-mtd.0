Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBLCQ-0007o6-R7
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 08:52:35 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/6] mtd: fsmc_nand: simplify
 platform_get_resource_byname/devm_ioremap_resource
Date: Mon, 19 Aug 2013 10:51:53 +0200
Message-Id: <1376902316-18520-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource_byname when the value is passed to devm_ioremap_resource.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,e,e1;
expression ret != 0;
identifier l;
@@

  res = platform_get_resource_byname(...);
- if (res == NULL) { ... \(goto l;\|return ret;\) }
  e = devm_ioremap_resource(e1, res);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/nand/fsmc_nand.c |   12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 2a3b1b9..3dc1a75 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -958,9 +958,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
-	if (!res)
-		return -EINVAL;
-
 	host->data_va = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(host->data_va))
 		return PTR_ERR(host->data_va);
@@ -968,25 +965,16 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	host->data_pa = (dma_addr_t)res->start;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_addr");
-	if (!res)
-		return -EINVAL;
-
 	host->addr_va = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(host->addr_va))
 		return PTR_ERR(host->addr_va);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_cmd");
-	if (!res)
-		return -EINVAL;
-
 	host->cmd_va = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(host->cmd_va))
 		return PTR_ERR(host->cmd_va);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "fsmc_regs");
-	if (!res)
-		return -EINVAL;
-
 	host->regs_va = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(host->regs_va))
 		return PTR_ERR(host->regs_va);
