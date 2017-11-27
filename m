Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eJO2m-0000ga-MY
 for linux-mtd@lists.infradead.org; Mon, 27 Nov 2017 18:22:15 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990451AbdK0SVqZLm7k (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Mon, 27 Nov 2017 19:21:46 +0100
Date: Mon, 27 Nov 2017 19:21:43 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: Roger Quadros <rogerq@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v4 12/16] mtd: onenand: omap2: Enable DMA by default
Message-ID: <20171127182143.GA22043@lenoch>
References: <20171111211206.465pgorrjp3eyix6@lenoch>
 <20171111212442.ucbatglvqeoiqb72@lenoch>
 <d2cd7de6-744c-6944-70d6-276a8530b6f5@ti.com>
 <20171115103209.b2wolfglkrwdjfku@lenoch>
 <c66e20cd-3099-53d8-045e-dc4d5383ba54@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c66e20cd-3099-53d8-045e-dc4d5383ba54@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Nov 15, 2017 at 12:43:19PM +0200, Roger Quadros wrote:
> On 15/11/17 12:32, Ladislav Michl wrote:
> > On Wed, Nov 15, 2017 at 12:08:05PM +0200, Roger Quadros wrote:
> >> Hi,
> >>
> >> On 11/11/17 23:24, Ladislav Michl wrote:
> >>> @@ -529,15 +527,11 @@ static int omap2_onenand_probe(struct platform_device *pdev)
> >>>  		dma_cap_set(DMA_MEMCPY, mask);
> >>>  
> >>>  		c->dma_chan = dma_request_channel(mask, NULL, NULL);
> >>> -		if (!c->dma_chan)
> >>> -			dev_info(&pdev->dev,
> >>> -				 "failed to allocate DMA for OneNAND, "
> >>> -				 "using PIO instead\n");
> >>
> >> Why get rid of the print message? Instead we could choose to error out completely
> >> if a DMA channel was provided and we couldn't get it.
> > 
> > The point is that without pdata->dma_channel condition above, DMA is always
> > enabled and it seems too strict to me to fail, when driver can continue to work.
> 
> OK. fair enough.

Just FYI, tested 4.15-rc1 and got this:
[    0.168701] omap_hwmod: dma: no dt node
[    0.292968] omap_device: omap_dma_system: build failed (-22)
[    0.292968] omap2_system_dma_init_dev: Can't build omap_device for omap_dma_system:dma.
[    0.411590] onenand_check_lock_status: block = 2048, wp status = 0x2
[    0.777435] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    0.787841] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    4.959228] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    5.077667] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    5.187011] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    5.288726] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    5.426971] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    5.987457] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    6.098937] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    6.243530] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    6.311950] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    6.355957] omap-sham 480c3000.sham: initialization failed.
[    6.397247] omap-aes 480c5000.aes: Unable to request in DMA channel
[    6.403869] omap-aes 480c5000.aes: initialization failed.
[    6.614807] omap-sham 480c3000.sham: initialization failed.
[    6.621551] omap-aes 480c5000.aes: Unable to request in DMA channel
[    6.628234] omap-aes 480c5000.aes: initialization failed.
[    6.793853] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    7.176910] omap-sham 480c3000.sham: initialization failed.
[    7.183563] omap-aes 480c5000.aes: Unable to request in DMA channel
[    7.190246] omap-aes 480c5000.aes: initialization failed.
[    7.417022] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    7.629211] omap-sham 480c3000.sham: initialization failed.
[    7.635986] omap-aes 480c5000.aes: Unable to request in DMA channel
[    7.642578] omap-aes 480c5000.aes: initialization failed.
[    7.854522] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    7.938964] omap-sham 480c3000.sham: initialization failed.
[    7.945617] omap-aes 480c5000.aes: Unable to request in DMA channel
[    7.952331] omap-aes 480c5000.aes: initialization failed.
[    8.142791] omap_hsmmc 4809c000.mmc: RX DMA channel request failed

Above error seems to be caused by missing DT changes merged during -rc1
(Which DT related brokeness is allowed and which not is still mystery
to me).

Anyway, driver can deal with that pretty well:
omap2-onenand 30000000.onenand: initializing on CS0 (0x30000000), va e0080000, PIO mode
...and oprerates normally (unlike mmc, sound, etc.)

Best regards,
	ladis
