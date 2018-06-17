Received: from smtp07.smtpout.orange.fr ([80.12.242.129]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUb53-0006tu-6H
 for linux-mtd@lists.infradead.org; Sun, 17 Jun 2018 17:03:11 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tejun Heo <tj@kernel.org>, Vinod Koul <vinod.koul@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Nicolas Pitre <nico@fluxnic.net>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH v3 01/14] dmaengine: pxa: use a dma slave map
Date: Sun, 17 Jun 2018 19:02:04 +0200
Message-Id: <20180617170217.24177-2-robert.jarzmik@free.fr>
In-Reply-To: <20180617170217.24177-1-robert.jarzmik@free.fr>
References: <20180617170217.24177-1-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to remove the specific knowledge of the dma mapping from PXA
drivers, add a default slave map for pxa architectures.

This won't impact MMP architecture, but is aimed only at all PXA boards.

This is the first step, and once all drivers are converted,
pxad_filter_fn() will be made static, and the DMA resources removed from
device.c.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
Reported-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/pxa_dma.c                 | 10 +++++++++-
 include/linux/platform_data/mmp_dma.h |  4 ++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index b53fb618bbf6..9505334f9c6e 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -179,6 +179,8 @@ static unsigned int pxad_drcmr(unsigned int line)
 	return 0x1000 + line * 4;
 }
 
+bool pxad_filter_fn(struct dma_chan *chan, void *param);
+
 /*
  * Debug fs
  */
@@ -1396,9 +1398,10 @@ static int pxad_probe(struct platform_device *op)
 {
 	struct pxad_device *pdev;
 	const struct of_device_id *of_id;
+	const struct dma_slave_map *slave_map = NULL;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
 	struct resource *iores;
-	int ret, dma_channels = 0, nb_requestors = 0;
+	int ret, dma_channels = 0, nb_requestors = 0, slave_map_cnt = 0;
 	const enum dma_slave_buswidth widths =
 		DMA_SLAVE_BUSWIDTH_1_BYTE   | DMA_SLAVE_BUSWIDTH_2_BYTES |
 		DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -1429,6 +1432,8 @@ static int pxad_probe(struct platform_device *op)
 	} else if (pdata && pdata->dma_channels) {
 		dma_channels = pdata->dma_channels;
 		nb_requestors = pdata->nb_requestors;
+		slave_map = pdata->slave_map;
+		slave_map_cnt = pdata->slave_map_cnt;
 	} else {
 		dma_channels = 32;	/* default 32 channel */
 	}
@@ -1440,6 +1445,9 @@ static int pxad_probe(struct platform_device *op)
 	pdev->slave.device_prep_dma_memcpy = pxad_prep_memcpy;
 	pdev->slave.device_prep_slave_sg = pxad_prep_slave_sg;
 	pdev->slave.device_prep_dma_cyclic = pxad_prep_dma_cyclic;
+	pdev->slave.filter.map = slave_map;
+	pdev->slave.filter.mapcnt = slave_map_cnt;
+	pdev->slave.filter.fn = pxad_filter_fn;
 
 	pdev->slave.copy_align = PDMA_ALIGNMENT;
 	pdev->slave.src_addr_widths = widths;
diff --git a/include/linux/platform_data/mmp_dma.h b/include/linux/platform_data/mmp_dma.h
index d1397c8ed94e..6397b9c8149a 100644
--- a/include/linux/platform_data/mmp_dma.h
+++ b/include/linux/platform_data/mmp_dma.h
@@ -12,9 +12,13 @@
 #ifndef MMP_DMA_H
 #define MMP_DMA_H
 
+struct dma_slave_map;
+
 struct mmp_dma_platdata {
 	int dma_channels;
 	int nb_requestors;
+	int slave_map_cnt;
+	const struct dma_slave_map *slave_map;
 };
 
 #endif /* MMP_DMA_H */
-- 
2.11.0
