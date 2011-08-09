Message-ID: <4E40D563.2090202@freescale.com>
Date: Tue, 9 Aug 2011 14:36:19 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Koen Beel <koen.beel.barco@gmail.com>
Subject: Re: GPMI-NAND Status?
References: <20110805135133.GA26981@pengutronix.de>	<4E3F8087.6070206@freescale.com>	<CAHMSPgMYP+5Hpa5sC-yt=1H-S=tEER8uNzj6uMSK403_DGYJ9Q@mail.gmail.com>	<4E3FBC75.7010703@freescale.com>
	<CAHMSPgMdBmmNG41_QgGivSb+M1rG5nqJjtveyZueKHHJrA8vzA@mail.gmail.com>
In-Reply-To: <CAHMSPgMdBmmNG41_QgGivSb+M1rG5nqJjtveyZueKHHJrA8vzA@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------040304010008030902080407"
Cc: Wolfram Sang <w.sang@pengutronix.de>, linux-mtd@lists.infradead.org,
	Shawn Guo <shawn.guo@linaro.org>, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	=?ISO-8859-1?Q?Lothar_Wa=DFmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------040304010008030902080407
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Koen:
> Hi,
>
> On Mon, Aug 8, 2011 at 12:37 PM, Huang Shijie<b32955@freescale.com>  wrote:
>> Hi,
>>> On my target, the mxs-dma is working for sdio until the gpmi-nand
>>> gives a timeout. After that the dma for sdio is *not fully* working
>>> anymore.
>>>
>> We need more log in following aspects:
>> [1] apbh-dma registers
>> [2] clk registers
>> [3] gpmi registers
>>
>> Please git-apply the patch in the attachment.
>> It will print out more DMA information WHEN dma-timeout occur.
> Don't get it. What exactly are you trying to dump?
> This patch dumps CTRL0, CTRL1, CTRL2, DEVSEL but also some registers
> of APBH channel0 which is reserved....
sorry, I intended to print out the channel 4(NAND_DEVICE0).

I want to know that:
  When the dma timeout occurs, whether it caused by the GPMI or by the 
DMA itself.


Please try the new patch.

Best Regards
Huang Shijie
> Then it prints some debug info on channel 1 (ssp1) and then alle
> channel 2 register except the debug register (ssp2 = not used here).
>
> What info do you need?
>
> Br,
> Koen
>
>> Best Regards
>> Huang Shijie
>>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>


--------------040304010008030902080407
Content-Type: text/x-patch; name="0001-print_more_log.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-print_more_log.patch"

>From 69b5bf4d3bf73a89b521a7c592f5bea1d66c2755 Mon Sep 17 00:00:00 2001
From: Huang Shijie <b32955@freescale.com>
Date: Mon, 8 Aug 2011 18:39:11 +0800
Subject: [PATCH] print_more_log

print out the DMA register when timeout occur.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/dma/mxs-dma.c                  |   37 +++++++++++++++++++++++++++++++-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +
 2 files changed, 38 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 88aad4f..755cbfc 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -130,6 +130,7 @@ struct mxs_dma_engine {
 	struct mxs_dma_chan		mxs_chans[MXS_DMA_CHANNELS];
 };
 
+struct mxs_dma_chan *g_mxs_chan;
 static void mxs_dma_reset_chan(struct mxs_dma_chan *mxs_chan)
 {
 	struct mxs_dma_engine *mxs_dma = mxs_chan->mxs_dma;
@@ -239,6 +240,7 @@ static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	struct mxs_dma_chan *mxs_chan = to_mxs_dma_chan(tx->chan);
 
 	mxs_dma_enable_chan(mxs_chan);
+	g_mxs_chan = mxs_chan;
 
 	return mxs_dma_assign_cookie(mxs_chan);
 }
@@ -370,6 +372,7 @@ static void mxs_dma_free_chan_resources(struct dma_chan *chan)
 	clk_disable(mxs_dma->clk);
 }
 
+static int idx;
 static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
 		struct dma_chan *chan, struct scatterlist *sgl,
 		unsigned int sg_len, enum dma_data_direction direction,
@@ -381,7 +384,6 @@ static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
 	struct scatterlist *sg;
 	int i, j;
 	u32 *pio;
-	static int idx;
 
 	if (mxs_chan->status == DMA_IN_PROGRESS && !append)
 		return NULL;
@@ -606,6 +608,39 @@ err_out:
 	return ret;
 }
 
+
+void dump_dma_reg(void)
+{
+	int i;
+	u32 stat1;
+
+	struct mxs_dma_chan *mxs_chan = g_mxs_chan;
+	struct mxs_dma_engine *g_mxs_dma = mxs_chan->mxs_dma;
+	struct mxs_dma_ccw *ccw;
+
+	printk("------------------------DMA DUMP END ------------\n");
+	for (i = 0; i < 7; i++) {
+		stat1 = readl(g_mxs_dma->base + 0x10 * i);
+		printk("APBH REG :%x : %.8X\n", 0x10 * i, stat1);
+	}
+	for (i = 0; i < 7; i++) {
+		stat1 = readl(g_mxs_dma->base + 0x10 * i + 0x400);
+		printk("APBH REG :%x : %.8X\n", 0x10 * i + 0x400, stat1);
+	}
+
+	for (i = 0; i < idx; i++) {
+		int j;
+
+		ccw = &mxs_chan->ccw[i];
+		printk("[ %d ] : ME : %.8x, next : %.8x, bits : %.8x, bytes : %.8x, buf : %.8x\n",
+			i, mxs_chan->ccw_phys + sizeof(*ccw) * i,
+			ccw->next, ccw->bits, ccw->xfer_bytes, ccw->bufaddr);
+		for (j = 0; j < 3; j++)
+			printk("[ %d ] PIO[%d] : %.8x\n", i, j, ccw->pio_words[j]); 
+	}
+	printk("------------------------DMA DUMP END ------------\n");
+}
+
 static int __init mxs_dma_probe(struct platform_device *pdev)
 {
 	const struct platform_device_id *id_entry =
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 1c2cbc5..3d6895b 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -378,6 +378,7 @@ int start_dma_without_bch_irq(struct gpmi_nand_data *this,
 {
 	struct completion *dma_c = &this->dma_done;
 	int err;
+	extern void dump_dma_reg(void);
 
 	init_completion(dma_c);
 
@@ -391,6 +392,7 @@ int start_dma_without_bch_irq(struct gpmi_nand_data *this,
 	if (err) {
 		pr_info("DMA timeout, last DMA :%d\n", this->last_dma_type);
 		if (gpmi_debug & GPMI_DEBUG_CRAZY) {
+			dump_dma_reg();
 			gpmi_show_regs(this);
 			panic("-----------DMA FAILED------------------");
 		}
-- 
1.7.0.4


--------------040304010008030902080407--
