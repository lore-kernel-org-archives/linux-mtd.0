From: Daniel Mack <zonque@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] mtd: pxa3xx_nand: fix a memory leak
Date: Mon,  7 Nov 2011 16:43:28 +0100
Message-Id: <1320680611-29448-2-git-send-email-zonque@gmail.com>
In-Reply-To: <1320680611-29448-1-git-send-email-zonque@gmail.com>
References: <1320680611-29448-1-git-send-email-zonque@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, David.Woodhouse@intel.com,
 leiwen@marvell.com, s.neumann@raumfeld.com, Axel Lin <axel.lin@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Axel Lin <axel.lin@gmail.com>

In pxa3xx_nand_remove, we should call nand_release instead of
mtd_device_unregister to properly free bad block table memory
and bad block descriptor memory.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
Acked-by: Lei Wen <leiwen@marvell.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 1fb3b3a..f7040ea 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1119,7 +1119,7 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 	clk_put(info->clk);
 
 	if (mtd) {
-		mtd_device_unregister(mtd);
+		nand_release(mtd);
 		kfree(mtd);
 	}
 	return 0;
-- 
1.7.6.4
