Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsL8u-0006wM-7w
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 01:39:40 +0000
Date: Sat, 31 Oct 2015 07:12:44 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Han Xu <b45815@freescale.com>
Cc: shijie.huang@arm.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dan.j.williams@intel.com,
 dmaengine@vger.kernel.org
Subject: Re: [PATCH v7 2/7] dmaengine: mxs: APBH DMA supports deep sleep mode
Message-ID: <20151031014244.GF21326@localhost>
References: <1445983540-27155-1-git-send-email-b45815@freescale.com>
 <1445983540-27155-3-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445983540-27155-3-git-send-email-b45815@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 27, 2015 at 05:05:35PM -0500, Han Xu wrote:
>  
> -static int __init mxs_dma_init(struct mxs_dma_engine *mxs_dma)
> +static int mxs_dma_init(struct mxs_dma_engine *mxs_dma)

This change seems unrelated to patch description, can you explain why?

> +#ifdef CONFIG_PM_SLEEP
> +static int mxs_dma_pm_resume(struct device *dev)
> +{
> +	struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = mxs_dma_init(mxs_dma);
> +	if (ret)
> +		return ret;
> +	return 0;

why not return mxs_dma_init() then!

-- 
~Vinod
