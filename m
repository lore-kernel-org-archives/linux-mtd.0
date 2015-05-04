Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yp8oc-0003kg-9V
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 05:21:14 +0000
Date: Mon, 4 May 2015 10:51:38 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Subject: Re: [PATCH 4/4] mtd: sh_flctl: fix wrapped condition alignment
Message-ID: <20150504052138.GX3521@localhost>
References: <1430553430-21396-1-git-send-email-hofrat@osadl.org>
 <1430553430-21396-4-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1430553430-21396-4-git-send-email-hofrat@osadl.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <wsa@the-dreams.de>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 02, 2015 at 09:57:10AM +0200, Nicholas Mc Guire wrote:
> CodingStyle fix only - align function parameters to opening (.
> 
This doesnt look any better to me...

-- 
~Vinod

> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
> 
> Patch was compile tested with ap325rxa_defconfig (implies
> CONFIG_MTD_NAND_SH_FLCTL=y)
> 
> Patch is against 4.1-rc1 (localversion-next is -next-20150501)
> 
>  drivers/mtd/nand/sh_flctl.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index ffda530..2078c4d 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -428,8 +428,8 @@ static void read_fiforeg(struct sh_flctl *flctl, int rlen, int offset)
>  
>  	/* initiate DMA transfer */
>  	if (flctl->chan_fifo0_rx && rlen >= 32 &&
> -		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_DEV_TO_MEM) == 0)
> -			goto convert;	/* DMA success */
> +	    flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_DEV_TO_MEM) == 0)
> +		goto convert;	/* DMA success */
>  
>  	/* do polling transfer */
>  	for (i = 0; i < len_4align; i++) {
> @@ -487,8 +487,8 @@ static void write_ec_fiforeg(struct sh_flctl *flctl, int rlen,
>  
>  	/* initiate DMA transfer */
>  	if (flctl->chan_fifo0_tx && rlen >= 32 &&
> -		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV) == 0)
> -			return;	/* DMA success */
> +	    flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV) == 0)
> +		return;	/* DMA success */
>  
>  	/* do polling transfer */
>  	for (i = 0; i < len_4align; i++) {
> -- 
> 1.7.10.4
> 

-- 
