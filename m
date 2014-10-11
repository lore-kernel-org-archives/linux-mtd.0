Received: from galahad.ideasonboard.com ([2001:4b98:dc2:45:216:3eff:febb:480d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xd0Kp-0002di-AK
 for linux-mtd@lists.infradead.org; Sat, 11 Oct 2014 17:20:04 +0000
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 05/12] mtd: sh_flctl: use dmaengine_terminate_all() API
Date: Sat, 11 Oct 2014 20:19:50 +0300
Message-ID: <4775968.otKQDIzYx4@avalon>
In-Reply-To: <1413042040-28222-5-git-send-email-vinod.koul@intel.com>
References: <1413041973-28146-1-git-send-email-vinod.koul@intel.com>
 <1413042040-28222-5-git-send-email-vinod.koul@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 dmaengine@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 11 October 2014 21:10:33 Vinod Koul wrote:
> The drivers should use dmaengine_terminate_all() API instead of
> accessing the device_control which will be deprecated soon
> 
> Signed-off-by: Vinod Koul <vinod.koul@intel.com>

Acked-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/mtd/nand/sh_flctl.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index c067023..0ed7c60 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -395,7 +395,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl
> *flctl, unsigned long *buf, msecs_to_jiffies(3000));
> 
>  	if (ret <= 0) {
> -		chan->device->device_control(chan, DMA_TERMINATE_ALL, 0);
> +		dmaengine_terminate_all(chan);
>  		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
>  	}

-- 
Regards,

Laurent Pinchart
