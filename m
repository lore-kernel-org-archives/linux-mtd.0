Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgMA3-0008FZ-N0
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 00:19:20 +0000
Received: by pablk4 with SMTP id lk4so59818470pab.3
 for <linux-mtd@lists.infradead.org>; Sun, 27 Sep 2015 17:18:58 -0700 (PDT)
Date: Sun, 27 Sep 2015 17:18:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: nand: pxa3xx-nand: switch to dmaengine
Message-ID: <20150928001856.GB34421@google.com>
References: <1441545167-23383-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441545167-23383-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sparse has one complaint, but I have no others:

On Sun, Sep 06, 2015 at 03:12:47PM +0200, Robert Jarzmik wrote:
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 2f39bfe34584..1e9d462065e8 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -15,7 +15,9 @@
...
> @@ -564,57 +567,61 @@ static void handle_data_pio(struct pxa3xx_nand_info *info)
[...]
> +static void start_data_dma(struct pxa3xx_nand_info *info)
> +{
> +	enum dma_data_direction direction;

I think this should be dma_transfer_direction. See warning below.

> +	struct dma_async_tx_descriptor *tx;
>  
>  	switch (info->state) {
>  	case STATE_DMA_WRITING:
> -		desc->dsadr = info->data_buff_phys;
> -		desc->dtadr = info->mmio_phys + NDDB;
> -		desc->dcmd |= DCMD_INCSRCADDR | DCMD_FLOWTRG;
> +		info->dma_dir = DMA_TO_DEVICE;
> +		direction = DMA_MEM_TO_DEV;
>  		break;
>  	case STATE_DMA_READING:
> -		desc->dtadr = info->data_buff_phys;
> -		desc->dsadr = info->mmio_phys + NDDB;
> -		desc->dcmd |= DCMD_INCTRGADDR | DCMD_FLOWSRC;
> +		info->dma_dir = DMA_FROM_DEVICE;
> +		direction = DMA_DEV_TO_MEM;
>  		break;
>  	default:
>  		dev_err(&info->pdev->dev, "%s: invalid state %d\n", __func__,
>  				info->state);
>  		BUG();
>  	}
> -
> -	DRCMR(info->drcmr_dat) = DRCMR_MAPVLD | info->data_dma_ch;
> -	DDADR(info->data_dma_ch) = info->data_desc_addr;
> -	DCSR(info->data_dma_ch) |= DCSR_RUN;
> -}
> -
> -static void pxa3xx_nand_data_dma_irq(int channel, void *data)
> -{
> -	struct pxa3xx_nand_info *info = data;
> -	uint32_t dcsr;
> -
> -	dcsr = DCSR(channel);
> -	DCSR(channel) = dcsr;
> -
> -	if (dcsr & DCSR_BUSERR) {
> -		info->retcode = ERR_DMABUSERR;
> +	info->sg.length = info->data_size +
> +		(info->oob_size ? info->spare_size + info->ecc_size : 0);
> +	dma_map_sg(info->dma_chan->device->dev, &info->sg, 1, info->dma_dir);
> +
> +	tx = dmaengine_prep_slave_sg(info->dma_chan, &info->sg, 1, direction,
> +				     DMA_PREP_INTERRUPT);

drivers/mtd/nand/pxa3xx_nand.c:631:68: warning: mixing different enum types [sparse]
drivers/mtd/nand/pxa3xx_nand.c:631:68:     int enum dma_data_direction  versus [sparse]
drivers/mtd/nand/pxa3xx_nand.c:631:68:     int enum dma_transfer_direction  [sparse]

> +	if (!tx) {
> +		dev_err(&info->pdev->dev, "prep_slave_sg() failed\n");
> +		return;
>  	}
> -
> -	info->state = STATE_DMA_DONE;
> -	enable_int(info, NDCR_INT_MASK);
> -	nand_writel(info, NDSR, NDSR_WRDREQ | NDSR_RDDREQ);
> +	tx->callback = pxa3xx_nand_data_dma_irq;
> +	tx->callback_param = info;
> +	info->dma_cookie = dmaengine_submit(tx);
> +	dma_async_issue_pending(info->dma_chan);
> +	dev_dbg(&info->pdev->dev, "%s(dir=%d cookie=%x size=%u)\n",
> +		__func__, direction, info->dma_cookie, info->sg.length);
>  }
> -#else
> -static void start_data_dma(struct pxa3xx_nand_info *info)
> -{}
> -#endif
[...]

Brian
