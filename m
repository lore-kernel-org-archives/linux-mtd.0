From: Daniel Mack <zonque@gmail.com>
To: haojian.zhuang@linaro.org, eric.y.miao@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 15/20] ASoC: pxa: pxa-ssp: set dma filter data from startup
 hook
Date: Wed,  7 Aug 2013 17:34:04 +0200
Message-Id: <1375889649-14638-16-git-send-email-zonque@gmail.com>
In-Reply-To: <1375889649-14638-1-git-send-email-zonque@gmail.com>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 Daniel Mack <zonque@gmail.com>, cxie4@marvell.com, lars@metafoo.de,
 nico@linaro.org, vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 broonie@kernel.org, mika.westerberg@linux.intel.com,
 thomas.petazzoni@free-electrons.com, gregkh@linuxfoundation.org,
 g.liakhovetski@gmx.de, sachin.kamat@linaro.org, kernel@pengutronix.de,
 djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With the new dmaengine implementation, the filter_data parameter has
to be set earlier, from pxa_ssp_startup().

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 sound/soc/pxa/pxa-ssp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 3903343..12491bd 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -84,7 +84,6 @@ static void pxa_ssp_disable(struct ssp_device *ssp)
 static void pxa_ssp_set_dma_params(struct ssp_device *ssp, int width4,
 			int out, struct snd_dmaengine_dai_dma_data *dma)
 {
-	dma->filter_data = out ? &ssp->drcmr_tx : &ssp->drcmr_rx;
 	dma->addr_width = width4 ? DMA_SLAVE_BUSWIDTH_4_BYTES :
 				   DMA_SLAVE_BUSWIDTH_2_BYTES;
 	dma->maxburst = 16;
@@ -107,6 +106,10 @@ static int pxa_ssp_startup(struct snd_pcm_substream *substream,
 	dma = kzalloc(sizeof(struct snd_dmaengine_dai_dma_data), GFP_KERNEL);
 	if (!dma)
 		return -ENOMEM;
+
+	dma->filter_data = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+				&ssp->drcmr_tx : &ssp->drcmr_rx;
+
 	snd_soc_dai_set_dma_data(cpu_dai, substream, dma);
 
 	return ret;
-- 
1.8.3.1
