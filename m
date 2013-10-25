Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZeTS-00086B-J9
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 10:18:35 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	<linux-omap@vger.kernel.org>
Subject: [PATCH v2 4/5] mtd: nand: omap2: Use devm_kzalloc
Date: Fri, 25 Oct 2013 07:17:56 -0300
Message-Id: <1382696277-9063-5-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: marek.belisko@gmail.com,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>,
 Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This simplifies the error path and makes the code less error-prone.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/omap2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index e01a936..d3155b2 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1837,7 +1837,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info = kzalloc(sizeof(struct omap_nand_info), GFP_KERNEL);
+	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
@@ -2067,8 +2067,6 @@ out_release_mem_region:
 		free_irq(info->gpmc_irq_fifo, info);
 	release_mem_region(info->phys_base, info->mem_size);
 out_free_info:
-	kfree(info);
-
 	return err;
 }
 
@@ -2091,7 +2089,6 @@ static int omap_nand_remove(struct platform_device *pdev)
 	nand_release(&info->mtd);
 	iounmap(info->nand.IO_ADDR_R);
 	release_mem_region(info->phys_base, info->mem_size);
-	kfree(info);
 	return 0;
 }
 
-- 
1.8.1.5
