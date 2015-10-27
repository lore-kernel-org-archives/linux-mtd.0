Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqtxJ-0001bX-4i
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 02:25:45 +0000
Date: Tue, 27 Oct 2015 11:25:10 +0900
From: Vinod Koul <vinod.koul@intel.com>
To: Han Xu <b45815@freescale.com>
Cc: shijie.huang@arm.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dan.j.williams@intel.com,
 dmaengine@vger.kernel.org
Subject: Re: [PATCH v6 2/7] dmaengine: mxs: APBH DMA supports deep sleep mode
Message-ID: <20151027022508.GG11691@vkoul-mobl.iind.intel.com>
References: <1445543676-19876-1-git-send-email-b45815@freescale.com>
 <1445543676-19876-3-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445543676-19876-3-git-send-email-b45815@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 22, 2015 at 02:54:31PM -0500, Han Xu wrote:
> +static int mxs_dma_pm_resume(struct device *dev)
> +{
> +	struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = mxs_dma_init(mxs_dma);
> +	if (ret)
> +		return ret;
> +	return 0;
> +}

Did you compile this without runtime PM defined, it will give out a warning
of unused symbol which cna be fixed by definig thru under runtime pm config

-- 
~Vinod
