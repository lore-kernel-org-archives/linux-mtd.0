Received: from mail-qg0-f54.google.com ([209.85.192.54])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYIMc-0005Pq-Ap
 for linux-mtd@lists.infradead.org; Sat, 05 Sep 2015 18:38:59 +0000
Received: by qgt47 with SMTP id 47so38654284qgt.2
 for <linux-mtd@lists.infradead.org>; Sat, 05 Sep 2015 11:38:37 -0700 (PDT)
Date: Sat, 5 Sep 2015 15:34:45 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: switch to dmaengine
Message-ID: <20150905183445.GB6978@laptop.cereza>
References: <1440441674-12103-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440441674-12103-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robert,

Just a couple of minor comments.

On 24 Aug 08:41 PM, Robert Jarzmik wrote:
> Now pxa architecture has a dmaengine driver, remove the access to direct
> dma registers in favor of the more generic dmaengine code.
> 
> This should be also applicable for mmp and orion, provided they work in
> device-tree environment.
> 
> This patch also removes the previous hack which was necessary to make
> the driver work in a devicetree environment.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 223 ++++++++++++++++++++---------------------
>  1 file changed, 109 insertions(+), 114 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 34c9a60c8c5c..9c555276afc3 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -15,7 +15,9 @@
>  #include <linux/module.h>
>  #include <linux/interrupt.h>
>  #include <linux/platform_device.h>
> +#include <linux/dmaengine.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/dma/pxa-dma.h>
>  #include <linux/delay.h>
>  #include <linux/clk.h>
>  #include <linux/mtd/mtd.h>
> @@ -33,10 +35,6 @@
>  #define ARCH_HAS_DMA
>  #endif
>  
> -#ifdef ARCH_HAS_DMA
> -#include <mach/dma.h>
> -#endif
> -
>  #include <linux/platform_data/mtd-nand-pxa3xx.h>
>  
>  #define	CHIP_DELAY_TIMEOUT	msecs_to_jiffies(200)
> @@ -206,6 +204,10 @@ struct pxa3xx_nand_info {
>  	unsigned int		oob_buff_pos;
>  
>  	/* DMA information */
> +	struct scatterlist	sg;
> +	enum dma_data_direction	dma_dir;
> +	struct dma_chan		*dma_chan;
> +	dma_cookie_t		dma_cookie;
>  	int			drcmr_dat;
>  	int			drcmr_cmd;
>  
> @@ -213,8 +215,6 @@ struct pxa3xx_nand_info {
>  	unsigned char		*oob_buff;
>  	dma_addr_t 		data_buff_phys;
>  	int 			data_dma_ch;
> -	struct pxa_dma_desc	*data_desc;
> -	dma_addr_t 		data_desc_addr;
>  
>  	struct pxa3xx_nand_host *host[NUM_CHIP_SELECT];
>  	unsigned int		state;
> @@ -473,6 +473,9 @@ static void pxa3xx_nand_stop(struct pxa3xx_nand_info *info)
>  		ndcr &= ~NDCR_ND_RUN;
>  		nand_writel(info, NDCR, ndcr);
>  	}
> +	if (info->dma_chan)
> +		dmaengine_terminate_all(info->dma_chan);
> +
>  	/* clear status bits */
>  	nand_writel(info, NDSR, NDSR_MASK);
>  }
> @@ -564,57 +567,62 @@ static void handle_data_pio(struct pxa3xx_nand_info *info)
>  	info->data_size -= do_bytes;
>  }
>  
> -#ifdef ARCH_HAS_DMA
> -static void start_data_dma(struct pxa3xx_nand_info *info)
> +static void pxa3xx_nand_data_dma_irq(void *data)
>  {
> -	struct pxa_dma_desc *desc = info->data_desc;
> -	int dma_len = ALIGN(info->data_size + info->oob_size, 32);
> +	struct pxa3xx_nand_info *info = data;
> +	struct dma_tx_state state;
> +	enum dma_status status;
> +
> +	status = dmaengine_tx_status(info->dma_chan, info->dma_cookie, &state);
> +	if (likely(status == DMA_COMPLETE)) {
> +		info->state = STATE_DMA_DONE;
> +	} else {
> +		dev_err(&info->pdev->dev, "DMA error on data channel\n");
> +		info->retcode = ERR_DMABUSERR;
> +	}
> +	dma_unmap_sg(info->dma_chan->device->dev,
> +		     &info->sg, 1, info->dma_dir);

Unneeded line breaking.

>  
> -	desc->ddadr = DDADR_STOP;
> -	desc->dcmd = DCMD_ENDIRQEN | DCMD_WIDTH4 | DCMD_BURST32 | dma_len;
> +	nand_writel(info, NDSR, NDSR_WRDREQ | NDSR_RDDREQ);
> +	enable_int(info, NDCR_INT_MASK);
> +}
> +
> +static void start_data_dma(struct pxa3xx_nand_info *info)
> +{
> +	enum dma_data_direction direction;
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
>  
>  static irqreturn_t pxa3xx_nand_irq_thread(int irq, void *data)
>  {
> @@ -1313,36 +1321,50 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
>  	return 0;
>  }
>  
> -#ifdef ARCH_HAS_DMA
>  static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
>  {
>  	struct platform_device *pdev = info->pdev;
> -	int data_desc_offset = info->buf_size - sizeof(struct pxa_dma_desc);
> +	struct dma_slave_config	config;
> +	dma_cap_mask_t mask;
> +	struct pxad_param param;
> +	int ret;
>  
> -	if (use_dma == 0) {
> -		info->data_buff = kmalloc(info->buf_size, GFP_KERNEL);
> -		if (info->data_buff == NULL)
> -			return -ENOMEM;
> +	info->data_buff = kmalloc(info->buf_size, GFP_KERNEL);
> +	if (info->data_buff == NULL)
> +		return -ENOMEM;
> +	if (use_dma == 0)
>  		return 0;
> -	}
>  
> -	info->data_buff = dma_alloc_coherent(&pdev->dev, info->buf_size,
> -				&info->data_buff_phys, GFP_KERNEL);
> -	if (info->data_buff == NULL) {
> -		dev_err(&pdev->dev, "failed to allocate dma buffer\n");
> -		return -ENOMEM;
> -	}
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return ret;
>  
> -	info->data_desc = (void *)info->data_buff + data_desc_offset;
> -	info->data_desc_addr = info->data_buff_phys + data_desc_offset;
> +	sg_init_one(&info->sg, info->data_buff, info->buf_size);
> +	dma_cap_zero(mask);
> +	dma_cap_set(DMA_SLAVE, mask);
> +	param.prio = PXAD_PRIO_LOWEST;
> +	param.drcmr = info->drcmr_dat;
> +	info->dma_chan = dma_request_slave_channel_compat(mask, pxad_filter_fn,
> +							  &param, &pdev->dev,
> +							  "data");
> +	if (!info->dma_chan) {
> +		dev_err(&pdev->dev, "unable to request data dma channel\n");
> +		return -ENODEV;
> +	}
>  
> -	info->data_dma_ch = pxa_request_dma("nand-data", DMA_PRIO_LOW,
> -				pxa3xx_nand_data_dma_irq, info);
> -	if (info->data_dma_ch < 0) {
> -		dev_err(&pdev->dev, "failed to request data dma\n");
> -		dma_free_coherent(&pdev->dev, info->buf_size,
> -				info->data_buff, info->data_buff_phys);
> -		return info->data_dma_ch;
> +	memset(&config, 0, sizeof(config));
> +	config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	config.src_addr = info->mmio_phys + NDDB;
> +	config.dst_addr = info->mmio_phys + NDDB;
> +	config.src_maxburst = 32;
> +	config.dst_maxburst = 32;
> +	ret = dmaengine_slave_config(info->dma_chan, &config);
> +	if (ret < 0) {
> +		dev_err(&info->pdev->dev,
> +			"dma channel configuration failed: %d\n",
> +			ret);
> +		return ret;
>  	}
>  
>  	/*
> @@ -1355,29 +1377,12 @@ static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
>  
>  static void pxa3xx_nand_free_buff(struct pxa3xx_nand_info *info)
>  {
> -	struct platform_device *pdev = info->pdev;
>  	if (info->use_dma) {
> -		pxa_free_dma(info->data_dma_ch);
> -		dma_free_coherent(&pdev->dev, info->buf_size,
> -				  info->data_buff, info->data_buff_phys);
> -	} else {
> -		kfree(info->data_buff);
> +		dmaengine_terminate_all(info->dma_chan);
> +		dma_release_channel(info->dma_chan);
>  	}
> -}
> -#else
> -static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
> -{
> -	info->data_buff = kmalloc(info->buf_size, GFP_KERNEL);
> -	if (info->data_buff == NULL)
> -		return -ENOMEM;
> -	return 0;
> -}
> -
> -static void pxa3xx_nand_free_buff(struct pxa3xx_nand_info *info)
> -{
>  	kfree(info->data_buff);
>  }
> -#endif
>  
>  static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
>  {
> @@ -1679,34 +1684,23 @@ static int alloc_nand_resource(struct platform_device *pdev)
>  		return ret;
>  
>  	if (use_dma) {
> -		/*
> -		 * This is a dirty hack to make this driver work from
> -		 * devicetree bindings. It can be removed once we have
> -		 * a prober DMA controller framework for DT.
> -		 */
> -		if (pdev->dev.of_node &&
> -		    of_machine_is_compatible("marvell,pxa3xx")) {
> -			info->drcmr_dat = 97;
> -			info->drcmr_cmd = 99;
> -		} else {
> -			r = platform_get_resource(pdev, IORESOURCE_DMA, 0);
> -			if (r == NULL) {
> -				dev_err(&pdev->dev,
> -					"no resource defined for data DMA\n");
> -				ret = -ENXIO;
> -				goto fail_disable_clk;
> -			}
> -			info->drcmr_dat = r->start;
> -
> -			r = platform_get_resource(pdev, IORESOURCE_DMA, 1);
> -			if (r == NULL) {
> -				dev_err(&pdev->dev,
> -					"no resource defined for cmd DMA\n");
> -				ret = -ENXIO;
> -				goto fail_disable_clk;
> -			}
> -			info->drcmr_cmd = r->start;
> +		r = platform_get_resource(pdev, IORESOURCE_DMA, 0);
> +		if (r == NULL) {
> +			dev_err(&pdev->dev,
> +				"no resource defined for data DMA\n");
> +			ret = -ENXIO;
> +			goto fail_disable_clk;
>  		}
> +		info->drcmr_dat = r->start;
> +
> +		r = platform_get_resource(pdev, IORESOURCE_DMA, 1);
> +		if (r == NULL) {
> +			dev_err(&pdev->dev,
> +				"no resource defined for cmd DMA\n");
> +			ret = -ENXIO;
> +			goto fail_disable_clk;
> +		}
> +		info->drcmr_cmd = r->start;

AFAICS, you only do data DMA, so this command resource can go away.
If you want to keep it for now and remove it as a follow up patch,
that's fine.

Other than this minor stuff:

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Tested on Armada 370 to make sure it doesn't cause any regressions.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
