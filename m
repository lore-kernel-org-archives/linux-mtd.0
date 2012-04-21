Received: from perceval.ideasonboard.com ([95.142.166.194])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLgb4-0007c7-5b
 for linux-mtd@lists.infradead.org; Sat, 21 Apr 2012 20:07:54 +0000
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bastian Hecht <hechtb@googlemail.com>
Subject: Re: [PATCH 2/9] ARM: sh-mobile: mackerel: Add error IRQ resource
Date: Sat, 21 Apr 2012 16:30:36 +0200
Message-ID: <2098300.FxL39kQn7a@avalon>
In-Reply-To: <1334913230-23615-3-git-send-email-hechtb@gmail.com>
References: <1334913230-23615-1-git-send-email-hechtb@gmail.com>
 <1334913230-23615-3-git-send-email-hechtb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bastian,

Thanks for the patch.

On Friday 20 April 2012 11:13:43 Bastian Hecht wrote:
> Supply the platform data for the FLSTEI error IRQ.

This should come before your 1/9 patch, otherwise the FLCTL driver will fail 
to get the IRQ, breaking git bisect.

> Signed-off-by: Bastian Hecht <hechtb@gmail.com>
> ---
>  arch/arm/mach-shmobile/board-mackerel.c |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-shmobile/board-mackerel.c
> b/arch/arm/mach-shmobile/board-mackerel.c index 8758f94..1de1fb7 100644
> --- a/arch/arm/mach-shmobile/board-mackerel.c
> +++ b/arch/arm/mach-shmobile/board-mackerel.c
> @@ -990,7 +990,11 @@ static struct resource nand_flash_resources[] = {
>  		.start	= 0xe6a30000,
>  		.end	= 0xe6a3009b,
>  		.flags	= IORESOURCE_MEM,
> -	}
> +	},
> +	[1] = {
> +		.start	= evt2irq(0x0d80), /* flstei: status error irq */
> +		.flags	= IORESOURCE_IRQ,
> +	},
>  };
> 
>  static struct sh_flctl_platform_data nand_flash_data = {
-- 
Regards,

Laurent Pinchart
