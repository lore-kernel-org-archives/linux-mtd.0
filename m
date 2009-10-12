Received: from mail.df.lth.se ([194.47.250.12] helo=df.lth.se)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxHFW-0005tA-4D
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 09:31:31 +0000
From: Linus Walleij <linus.walleij@stericsson.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Use resource_size() macro for Nomadik NAND driver
Date: Mon, 12 Oct 2009 10:49:09 +0200
Message-Id: <1255337349-30567-1-git-send-email-linus.walleij@stericsson.com>
Cc: Linus Walleij <linus.walleij@stericsson.com>,
	Alessandro Rubini <rubini@unipv.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This makes a trivial fix for the Nomadik NAND driver to use the
resource_size() macro.

Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>
Cc: Alessandro Rubini <rubini@unipv.it>
---
 drivers/mtd/nand/nomadik_nand.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nomadik_nand.c b/drivers/mtd/nand/nomadik_nand.c
index 7c302d5..ed966c0 100644
--- a/drivers/mtd/nand/nomadik_nand.c
+++ b/drivers/mtd/nand/nomadik_nand.c
@@ -104,21 +104,21 @@ static int nomadik_nand_probe(struct platform_device *pdev)
 		ret = -EIO;
 		goto err_unmap;
 	}
-	host->addr_va = ioremap(res->start, res->end - res->start + 1);
+	host->addr_va = ioremap(res->start, resource_size(res));
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
 	if (!res) {
 		ret = -EIO;
 		goto err_unmap;
 	}
-	host->data_va = ioremap(res->start, res->end - res->start + 1);
+	host->data_va = ioremap(res->start, resource_size(res));
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_cmd");
 	if (!res) {
 		ret = -EIO;
 		goto err_unmap;
 	}
-	host->cmd_va = ioremap(res->start, res->end - res->start + 1);
+	host->cmd_va = ioremap(res->start, resource_size(res));
 
 	if (!host->addr_va || !host->data_va || !host->cmd_va) {
 		ret = -ENOMEM;
-- 
1.6.3.3
