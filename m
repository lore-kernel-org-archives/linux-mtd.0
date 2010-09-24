Received: from duck.dooz.org ([194.146.227.125])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OzG53-0007Vd-Et
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 21:45:22 +0000
From: =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@linaro.org>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [PATCH] nand: omap2: Missing arg to gpmc_prefetch_reset()
Date: Fri, 24 Sep 2010 23:45:02 +0200
Message-Id: <1285364702-13922-1-git-send-email-loic.minier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>,
	=?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@linaro.org>,
	Sukumar Ghorai <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix missing cs arg to gpmc_prefetch_reset() when
CONFIG_MTD_NAND_OMAP_PREFETCH_DMA=y which caused a build failure since
948d38e799f0ab87cf8ed9113fcdaaee61acf321:
drivers/mtd/nand/omap2.c: In function 'omap_nand_dma_transfer':
drivers/mtd/nand/omap2.c:416: error: too few arguments to function 'gpmc_prefetch_reset'

Signed-off-by: Loïc Minier <loic.minier@linaro.org>
---
 drivers/mtd/nand/omap2.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 133d515..513e0a7 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -413,7 +413,7 @@ static inline int omap_nand_dma_transfer(struct mtd_info *mtd, void *addr,
 		prefetch_status = gpmc_read_status(GPMC_PREFETCH_COUNT);
 	} while (prefetch_status);
 	/* disable and stop the PFPW engine */
-	gpmc_prefetch_reset();
+	gpmc_prefetch_reset(info->gpmc_cs);
 
 	dma_unmap_single(&info->pdev->dev, dma_addr, len, dir);
 	return 0;
-- 
1.7.1
