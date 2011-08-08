Message-ID: <4E3FBC75.7010703@freescale.com>
Date: Mon, 8 Aug 2011 18:37:41 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Koen Beel <koen.beel.barco@gmail.com>
Subject: Re: GPMI-NAND Status?
References: <20110805135133.GA26981@pengutronix.de>	<4E3F8087.6070206@freescale.com>
	<CAHMSPgMYP+5Hpa5sC-yt=1H-S=tEER8uNzj6uMSK403_DGYJ9Q@mail.gmail.com>
In-Reply-To: <CAHMSPgMYP+5Hpa5sC-yt=1H-S=tEER8uNzj6uMSK403_DGYJ9Q@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------030105050108080108040309"
Cc: Wolfram Sang <w.sang@pengutronix.de>, linux-mtd@lists.infradead.org,
	Shawn Guo <shawn.guo@linaro.org>, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------030105050108080108040309
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
> Hi Wolfram,
>
> Thanks for taking the initiative to summarize the current status.
> Also thanks to Huang Shijie for all the work done so far.
>
>
> On Mon, Aug 8, 2011 at 8:21 AM, Huang Shijie<b32955@freescale.com>  wrote:
>> Hi Wolfram:
>>> Hi,
>>>
>>> I am a bit uncertain how the state of the GPMI-NAND driver currently is,
>>> so
>>> I'll try to sum it up here. There is without doubt interest in getting the
>>> driver into mainline from at least Huang, Shawn, Lothar, Koen and me, so I
>>> wonder if we can join forces more effectively. First of all, I want to
>>> thank
>>> Huang Shijie for all his work so far which was already quite some effort;
>>> this
>>> sum-up is by no means meant as bashing, just trying to understand the
>>> status
>>> quo (Sidenote: I am more or less on holiday until Monday, so no time for
>>> real
>>> debugging myself. I write this mail so we hopefully gain a common
>>> understanding. When I am back to full strength, I can then start working
>>> on
>>> what seems apropriate)
>>>
>>> Issues with the current driver I am aware of:
>>>
>>> DMA timeouts [1]
>>> ================
>>>
>>> [    2.560000] [ start_dma_without_bch_irq : 392 ] DMA timeout, last DMA
>>> :1
>>> [    3.560000] [ start_dma_with_bch_irq : 427 ] bch timeout!!!
>>>
>>> Always reproducible by me when trying to format mtd0. Sometimes(always?)
>>> seen
>>> by Koen during boot (on read?). Never seen by Huang? It is currently
>>> unclear if
>> After I used a different .config, it never appears in my side.
> flash_eraseall of mtd1 works for me.
> ubi_format of mtd1 always gives the dma timeout
> reading/writing of mtd0/1 always gives the dma timeout
> I have seen dma timeout during boot if i try to enable ubi rootfs (so
> that's the same issue as dma time during read/write).
>
> I don't use mtd0 for testing as this contains my uboot.
>
> I tested using Huang's .config and the Linaro git but still see
> exactly the same issue.
>
strange.
>>> the bug is in the GPMI driver, or in the MXS-DMA driver. Still, I'd say
>>> the
>>> issue is a show-stopper. We can't put a driver into mainline which leads
>>> to the
>>> above failure. The fact that there is _some_ configuration which works for
>>> someone does not help, it doesn't work for Koen and me at least. We need
> On my target, the mxs-dma is working for sdio until the gpmi-nand
> gives a timeout. After that the dma for sdio is *not fully* working
> anymore.
>
We need more log in following aspects:
[1] apbh-dma registers
[2] clk registers
[3] gpmi registers

Please git-apply the patch in the attachment.
It will print out more DMA information WHEN dma-timeout occur.
>> Hi Koen, do you test my uImage?
>> Does the timeout occur?
> I was not able to test you uImage. It ended with a "Kernel panic - not
> syncing: read error". See (off list) mail from last week.
>
ok.
>>> reliable drivers in mainline, so the issue needs to be resolved,
>>> regardless
>>> where the bug resides.
>> ok. I will debug it too.
>>
>>
>> Please test the driver again when you back to office.
>> Pay attention to your version of /arch/arm/configs/mxs_defconfig.
>> Your mxs_defconfig may miss Shawn Guo's patches.
>>
>> thanks.
>>
>>
>>> problem overwriting all-0xff data in NAND [2]
>>> =============================================
>>>
>>> Although it occured only when writing JFFS2 images so far, this is a
>>> generic
>>> issue and needs to be fixed, right?
>>>
>> Artem said it should not change the driver, but the upper layer(jffs2).
>>
>> So I think i do not need to change the driver.
>>> ecclayout needs to be used to show that OOB is fully in use [1]
>>> ===============================================================
>>>
>>> Needed to make it work for JFFS2 and to pass the mtd-testsuite. A driver
>>> only
>>> working with UBIFS is surely not ready for mainline.
>>>
>> I programmed for mx6q in the recent days. I have no time to fix it. The mx6q
>> can runs well now.
>>
>> So I will fix the issue in the following days.
>>
>>> Pecularities
>>> ============
>>>
>>> There are a few issues which are odd. I don't know if some are mainly
>>> intended
>>> for debugging, yet they shouldn't be in a mainline driver. At least:
>>>
>>> * custom sysfs-entries
>> My sysfs-entries is in the GPMI-NAND directory.
>> Does be a mainline driver means I should not have any sysfs-entries?
>> If it does, i can remove it.
>>
>>> * custom kernel command line parameters
>> The kernel command line 'gpmi_nand' is to avoid the conflict with other
>> modules such as
>> SD.
>>
>> If it's be removed, I have to use different config to resolve the issue
>> which is not better either. :(
>>
>>> * namespacing (some functions have no prefix, some have "mil_", some have
>>> mx23)
>>>    (I think 'mil' means 'mtd interface layer', but why is that needed?)
>> The mil is used to make the gpmi_nand_data{} simple.
>> Without it, the gpmi_nand_data{} will very big.
>>
>> The functions which have mx23 prefix are only used in mx23.
>> The functions which have no prefix can used in both mx28 and mx23.
>>
>>> Complexity
>>> ==========
>>>
>>> The driver is not easy to review. I wonder if it makes sense to use
>>> incremental
>>> patches for it? maybe making it a staging driver could be a solution for
>>> that?
>> Frankly speaking, the current driver is maybe the smallest version now.
>>
>> I even do not add the on-chip BBT feature now.
>>> Huang, are you interested in accepting patches or do you prefer we just
>>> point
>>> at certain code and you then fix it? Starting with a simpler driver and
>>> then
>> Feel free to mail me the patch. it's welcome.
>>
>>
>>> adding stuff might be another option if we can't chase all the bugs in the
>>> current driver.
>>>
>>> That being said, I'd think fixing the DMA issue has prio #1 and maybe we
>>> can
>>> meet in IRC or something to work that out? Is there interest in that?
>> What about gtalk?
> Anything is good for me.
> Could also be useful to make sure we test on the same HW as much as
> possible and are using the same source tree.
> HW I have:
> - mx23evk rev C1
> - mx23evk rev B2
> - own target hw using mx23 lqfp-128 chip and different type of ddr and nand.
>
I have mx23evk rev C.

Best Regards
Huang Shijie

--------------030105050108080108040309
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
+		stat1 = readl(g_mxs_dma->base + 0x10 * i + 0x100);
+		printk("APBH REG :%x : %.8X\n", 0x10 * i + 0x100, stat1);
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


--------------030105050108080108040309--
