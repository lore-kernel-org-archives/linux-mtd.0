Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ze4VW-0000Ak-QU
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2015 17:04:03 +0000
Date: Mon, 21 Sep 2015 22:32:38 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Han Xu <b45815@freescale.com>
Cc: shijie.huang@arm.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dan.j.williams@intel.com,
 dmaengine@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dmaengine: mxs: support i.MX7D and deep sleep mode
Message-ID: <20150921170238.GP2381@localhost>
References: <1440790365-28072-1-git-send-email-b45815@freescale.com>
 <1440790365-28072-3-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440790365-28072-3-git-send-email-b45815@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 28, 2015 at 02:32:41PM -0500, Han Xu wrote:
> @@ -28,7 +28,6 @@
>  #include <linux/of_device.h>
>  #include <linux/of_dma.h>
>  #include <linux/list.h>
> -

Pl dont change at random places

> +	if (mxs_dma->dev_id == IMX7D_DMA) {
> +		ret = clk_prepare_enable(mxs_dma->clk_io);
> +		if (ret)
> +			goto err_clk_unprepare;
> +	}
> +
>  	mxs_dma_reset_chan(chan);
>  
>  	dma_async_tx_descriptor_init(&mxs_chan->desc, chan);
> @@ -450,6 +464,8 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
>  
>  	return 0;
>  
> +err_clk_unprepare:
> +	clk_disable_unprepare(mxs_dma->clk);

and this doesn't look right. You are calling this for failure on
clk_prepare_enable() so if clock prepare failed you are still going to
disable and unprepare??

> -static int __init mxs_dma_init(struct mxs_dma_engine *mxs_dma)
> +static int mxs_dma_init(struct mxs_dma_engine *mxs_dma)

this should be separate change explaining why

> +static int mxs_dma_pm_resume(struct device *dev)
> +{
> +	struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = mxs_dma_init(mxs_dma);
> +	if (ret)
> +		return ret;
> +	return 0;

Aren't you supposed to prepare and unprepare clock in PM handlers too?

-- 
~Vinod
