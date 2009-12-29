Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NPZPn-0000Ti-0a
	for linux-mtd@lists.infradead.org; Tue, 29 Dec 2009 10:35:03 +0000
From: Sanjeev Premi <premi@ti.com>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [PATCH] omap2/3: mtd: fix compile warning
Date: Tue, 29 Dec 2009 16:04:52 +0530
Message-Id: <1262082892-5260-1-git-send-email-premi@ti.com>
Cc: Sanjeev Premi <premi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes following compile warning:

drivers/mtd/nand/omap2.c:508: warning: passing argumen
t 2 of 'omap_nand_dma_transfer' discards qualifiers fr
om pointer target type

Signed-off-by: Sanjeev Premi <premi@ti.com>
---
 drivers/mtd/nand/omap2.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 1bb799f..08c193c 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -505,7 +505,7 @@ static void omap_write_buf_dma_pref(struct mtd_info *mtd,
 		omap_write_buf_pref(mtd, buf, len);
 	else
 		/* start transfer in DMA mode */
-		omap_nand_dma_transfer(mtd, buf, len, 0x1);
+		omap_nand_dma_transfer(mtd, (void *)buf, len, 0x1);
 }
 
 /**
-- 
1.6.2.2
