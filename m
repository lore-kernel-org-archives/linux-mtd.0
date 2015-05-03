Received: from galahad.ideasonboard.com ([185.26.127.97])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yozg4-0006Wg-UL
 for linux-mtd@lists.infradead.org; Sun, 03 May 2015 19:35:49 +0000
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicholas Mc Guire <hofrat@osadl.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 1/4] mtd: sh_flctl: let flctl_dma_fifo0_transfer return 0
 on success
Date: Sun, 03 May 2015 22:35:47 +0300
Message-ID: <2970495.e6NA0vdFiS@avalon>
In-Reply-To: <1430553430-21396-1-git-send-email-hofrat@osadl.org>
References: <1430553430-21396-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <wsa@the-dreams.de>,
 Vinod Koul <vinod.koul@intel.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nicholas,

Thank you for the patch.

On Saturday 02 May 2015 09:57:07 Nicholas Mc Guire wrote:
> wait_for_completion_timeout() returns unsigned long not int so the check
> for <= should be == and the type unsigned long. With that fixup the return
> value of flctl_dma_fifo0_transfer can be changed to 0 for success. This
> changes the failure return value for wait_for_completion_timeout to
> -ETIMEDOUT and implicitly 0 on success by initializing ret to 0.
> The call-sites are fixed up to check for == 0 rather than > 0 as well.
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>

I would squash patches 3/4 and 4/4 into this one, there isn't much point in 
having indentation fixes as separate patches when this one already touches the 
same lines of code. Then,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> V2: As suggested by Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>     the expected success return value is 0 so rather than just fixing up
>     wait_for_completion_timeout return handling the return value of
>     flctl_dma_fifo0_transfer should be adjusted.
> 
> call sites:
> read_fiforeg,write_ec_fiforeg assume > 0 == success
> are fixed up to check for == 0 for success
> and the comment in flctl_dma_fifo0_transfe
>         /* ret > 0 is success */
>         return ret;
> is dropped since returning 0 on success is the expected.
> 
> Patch was compile tested with ap325rxa_defconfig (implies
> CONFIG_MTD_NAND_SH_FLCTL=y)
> 
> Patch is against 4.1-rc1 (localversion-next is -next-20150501)
> 
>  drivers/mtd/nand/sh_flctl.c |   13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index c3ce81c..9b032dd 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -353,7 +353,8 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl
> *flctl, unsigned long *buf, dma_addr_t dma_addr;
>  	dma_cookie_t cookie = -EINVAL;
>  	uint32_t reg;
> -	int ret;
> +	int ret = 0;
> +	unsigned long time_left;
> 
>  	if (dir == DMA_FROM_DEVICE) {
>  		chan = flctl->chan_fifo0_rx;
> @@ -388,13 +389,14 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl
> *flctl, unsigned long *buf, goto out;
>  	}
> 
> -	ret =
> +	time_left =
>  	wait_for_completion_timeout(&flctl->dma_complete,
>  				msecs_to_jiffies(3000));
> 
> -	if (ret <= 0) {
> +	if (time_left == 0) {
>  		dmaengine_terminate_all(chan);
>  		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
> +		ret = -ETIMEDOUT;
>  	}
> 
>  out:
> @@ -404,7 +406,6 @@ out:
> 
>  	dma_unmap_single(chan->device->dev, dma_addr, len, dir);
> 
> -	/* ret > 0 is success */
>  	return ret;
>  }
> 
> @@ -428,7 +429,7 @@ static void read_fiforeg(struct sh_flctl *flctl, int
> rlen, int offset)
> 
>  	/* initiate DMA transfer */
>  	if (flctl->chan_fifo0_rx && rlen >= 32 &&
> -		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_DEV_TO_MEM) > 0)
> +		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_DEV_TO_MEM) == 0)
>  			goto convert;	/* DMA success */
> 
>  	/* do polling transfer */
> @@ -487,7 +488,7 @@ static void write_ec_fiforeg(struct sh_flctl *flctl, int
> rlen,
> 
>  	/* initiate DMA transfer */
>  	if (flctl->chan_fifo0_tx && rlen >= 32 &&
> -		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV) > 0)
> +		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV) == 0)
>  			return;	/* DMA success */
> 
>  	/* do polling transfer */

-- 
Regards,

Laurent Pinchart
