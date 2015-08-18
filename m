Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1ZRck1-0002gl-Tr
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 08:59:35 +0000
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: ezequiel.garcia@free-electrons.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, robert.jarzmik@free.fr
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: pxa3xx_nand: add a default chunk size
Date: Tue, 18 Aug 2015 10:59:10 +0200
Message-Id: <1439888350-9253-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When keeping the configuration set by the bootloader (by using
the marvell,nand-keep-config property), the pxa3xx_nand_detect_config()
function is called and set the chunk size to 512 as a default value if
NDCR_PAGE_SZ is not set.

In the other case, when not keeping the bootloader configuration, no
chunk size is set. Fix this by adding a default chunk size of 512.

Fixes: 70ed85232a93 ("mtd: nand: pxa3xx: Introduce multiple page I/O
support")

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free>
---
 drivers/mtd/nand/pxa3xx_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 1259cc558ce9..5465fa439c9e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1473,6 +1473,9 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
 		goto KEEP_CONFIG;
 
+	/* Set a default chunk size */
+	info->chunk_size = 512;
+
 	ret = pxa3xx_nand_sensing(info);
 	if (ret) {
 		dev_info(&info->pdev->dev, "There is no chip on cs %d!\n",
-- 
2.5.0
