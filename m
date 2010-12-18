Date: Fri, 17 Dec 2010 16:03:45 -0800
From: Tony Lindgren <tony@atomide.com>
To: Sukumar Ghorai <s-ghorai@ti.com>
Subject: Re: [PATCH 1/7] omap3630: nand: fix device size to work in polled mode
Message-ID: <20101218000344.GV5941@atomide.com>
References: <1290785677-16005-1-git-send-email-s-ghorai@ti.com>
	<1290785677-16005-2-git-send-email-s-ghorai@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1290785677-16005-2-git-send-email-s-ghorai@ti.com>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Sukumar Ghorai <s-ghorai@ti.com> [101126 07:25]:
> zoom3 and 3630-sdp having the x16 nand device.
> This patch configure gpmc as x16 and select the currect function in driver
> for polled mode (without prefetch enable) transfer.
> 
> Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>
> ---
>  arch/arm/mach-omap2/board-flash.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/board-flash.c b/arch/arm/mach-omap2/board-flash.c
> index fd38c05..001c605 100644
> --- a/arch/arm/mach-omap2/board-flash.c
> +++ b/arch/arm/mach-omap2/board-flash.c
> @@ -145,6 +145,9 @@ __init board_nand_init(struct mtd_partition *nand_parts, u8 nr_parts, u8 cs)
>  	board_nand_data.parts		= nand_parts;
>  	board_nand_data.nr_parts		= nr_parts;
>  
> +	if (cpu_is_omap3630())
> +		board_nand_data.devsize = 1;
> +
>  	gpmc_nand_init(&board_nand_data);
>  }
>  #else

I guess this is board specific for the size, not omap specific?

Regards,

Tony
