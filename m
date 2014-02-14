Received: from mail-yh0-f43.google.com ([209.85.213.43])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WE9Af-0004g0-Js
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 03:10:34 +0000
Received: by mail-yh0-f43.google.com with SMTP id z6so11095899yhz.30
 for <linux-mtd@lists.infradead.org>; Thu, 13 Feb 2014 19:10:05 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: mxc_nand: Propagate the error if platform_get_irq() fails
Date: Fri, 14 Feb 2014 01:09:34 -0200
Message-Id: <1392347374-8481-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Check the return value from platform_get_irq() and propagate it in the case of
error.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/mxc_nand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index e9a4835..dba262b 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1501,6 +1501,8 @@ static int mxcnd_probe(struct platform_device *pdev)
 	init_completion(&host->op_completion);
 
 	host->irq = platform_get_irq(pdev, 0);
+	if (host->irq < 0)
+		return host->irq;
 
 	/*
 	 * Use host->devtype_data->irq_control() here instead of irq_control()
-- 
1.8.1.2
