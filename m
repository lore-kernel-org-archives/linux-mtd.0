Received: from smtp01.smtpout.orange.fr ([80.12.242.123]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLkLl-0003hv-6F
 for linux-mtd@lists.infradead.org; Thu, 24 May 2018 07:07:50 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 09/13] ata: pata_pxa: remove the dmaengine compat need
Date: Thu, 24 May 2018 09:06:59 +0200
Message-Id: <20180524070703.11901-10-robert.jarzmik@free.fr>
In-Reply-To: <20180524070703.11901-1-robert.jarzmik@free.fr>
References: <20180524070703.11901-1-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As the pxa architecture switched towards the dmaengine slave map, the
old compatibility mechanism to acquire the dma requestor line number and
priority are not needed anymore.

This patch simplifies the dma resource acquisition, using the more
generic function dma_request_slave_channel().

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/ata/pata_pxa.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/ata/pata_pxa.c b/drivers/ata/pata_pxa.c
index f6c46e9a4dc0..e8b6a2e464c9 100644
--- a/drivers/ata/pata_pxa.c
+++ b/drivers/ata/pata_pxa.c
@@ -25,7 +25,6 @@
 #include <linux/libata.h>
 #include <linux/platform_device.h>
 #include <linux/dmaengine.h>
-#include <linux/dma/pxa-dma.h>
 #include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
@@ -180,8 +179,6 @@ static int pxa_ata_probe(struct platform_device *pdev)
 	struct resource *irq_res;
 	struct pata_pxa_pdata *pdata = dev_get_platdata(&pdev->dev);
 	struct dma_slave_config	config;
-	dma_cap_mask_t mask;
-	struct pxad_param param;
 	int ret = 0;
 
 	/*
@@ -278,10 +275,6 @@ static int pxa_ata_probe(struct platform_device *pdev)
 
 	ap->private_data = data;
 
-	dma_cap_zero(mask);
-	dma_cap_set(DMA_SLAVE, mask);
-	param.prio = PXAD_PRIO_LOWEST;
-	param.drcmr = pdata->dma_dreq;
 	memset(&config, 0, sizeof(config));
 	config.src_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 	config.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
@@ -294,8 +287,7 @@ static int pxa_ata_probe(struct platform_device *pdev)
 	 * Request the DMA channel
 	 */
 	data->dma_chan =
-		dma_request_slave_channel_compat(mask, pxad_filter_fn,
-						 &param, &pdev->dev, "data");
+		dma_request_slave_channel(&pdev->dev, "data");
 	if (!data->dma_chan)
 		return -EBUSY;
 	ret = dmaengine_slave_config(data->dma_chan, &config);
-- 
2.11.0
