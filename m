Received: from smtp07.smtpout.orange.fr ([80.12.242.129]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUb5G-00068X-Fk
 for linux-mtd@lists.infradead.org; Sun, 17 Jun 2018 17:03:23 +0000
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
Subject: [PATCH v3 06/14] mtd: rawnand: marvell: remove the dmaengine compat
 need
Date: Sun, 17 Jun 2018 19:02:09 +0200
Message-Id: <20180617170217.24177-7-robert.jarzmik@free.fr>
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

As the pxa architecture switched towards the dmaengine slave map, the
old compatibility mechanism to acquire the dma requestor line number and
priority are not needed anymore.

This patch simplifies the dma resource acquisition, using the more
generic function dma_request_slave_channel().

Signed-off-by: Signed-off-by: Daniel Mack <daniel@zonque.org>
Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 10e953218948..64618254d6de 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2613,8 +2613,6 @@ static int marvell_nfc_init_dma(struct marvell_nfc *nfc)
 						    dev);
 	struct dma_slave_config config = {};
 	struct resource *r;
-	dma_cap_mask_t mask;
-	struct pxad_param param;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_PXA_DMA)) {
@@ -2627,20 +2625,7 @@ static int marvell_nfc_init_dma(struct marvell_nfc *nfc)
 	if (ret)
 		return ret;
 
-	r = platform_get_resource(pdev, IORESOURCE_DMA, 0);
-	if (!r) {
-		dev_err(nfc->dev, "No resource defined for data DMA\n");
-		return -ENXIO;
-	}
-
-	param.drcmr = r->start;
-	param.prio = PXAD_PRIO_LOWEST;
-	dma_cap_zero(mask);
-	dma_cap_set(DMA_SLAVE, mask);
-	nfc->dma_chan =
-		dma_request_slave_channel_compat(mask, pxad_filter_fn,
-						 &param, nfc->dev,
-						 "data");
+	nfc->dma_chan =	dma_request_slave_channel(nfc->dev, "data");
 	if (!nfc->dma_chan) {
 		dev_err(nfc->dev,
 			"Unable to request data DMA channel\n");
-- 
2.11.0
