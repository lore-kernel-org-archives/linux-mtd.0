Received: from galahad.ideasonboard.com ([2001:4b98:dc2:45:216:3eff:febb:480d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoK2S-00029P-W8
 for linux-mtd@lists.infradead.org; Fri, 01 May 2015 23:08:09 +0000
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Subject: Re: [PATCH 2/3] mtd: sh_flctl: fix alignment of function argument
Date: Sat, 02 May 2015 02:08:11 +0300
Message-ID: <3465963.CN2EL6peQN@avalon>
In-Reply-To: <1430489763-18417-2-git-send-email-hofrat@osadl.org>
References: <1430489763-18417-1-git-send-email-hofrat@osadl.org>
 <1430489763-18417-2-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Wolfram Sang <wsa@the-dreams.de>, Vinod Koul <vinod.koul@intel.com>,
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

Hi Nicholas,

Thank you for the patch.

On Friday 01 May 2015 16:16:02 Nicholas Mc Guire wrote:
> This just is a minor coding style cleanup - align the function arguments
> with the opening (.

I would just squash this into patch 1/3.

> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
> 
> Patch was compile tested with ap325rxa_defconfig (implies
> CONFIG_MTD_NAND_SH_FLCTL=y)
> 
> Patch is against 4.1-rc1 (localversion-next is -next-20150501)
> 
>  drivers/mtd/nand/sh_flctl.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index 4450864..b9f265a 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -391,7 +391,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl
> *flctl, unsigned long *buf,
> 
>  	time_left =
>  	wait_for_completion_timeout(&flctl->dma_complete,
> -				msecs_to_jiffies(3000));
> +				    msecs_to_jiffies(3000));
> 
>  	if (time_left == 0) {
>  		dmaengine_terminate_all(chan);

-- 
Regards,

Laurent Pinchart
