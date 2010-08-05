Subject: Re: [PATCH] S5PC110: Add OneNAND interrupt number
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>
In-Reply-To: <20100727103937.GA1247@july>
References: <20100727103937.GA1247@july>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 07:32:56 +0300
Message-Id: <1280982776.4363.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kgene.kim@samsung.com, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-27 at 19:39 +0900, Kyungmin Park wrote:
> To use OneNAND interrupt at drivers, also extend DMA address to cover fully.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> diff --git a/arch/arm/mach-s5pv210/dev-onenand.c b/arch/arm/mach-s5pv210/dev-onenand.c
> index 34997b7..f8ede33 100644
> --- a/arch/arm/mach-s5pv210/dev-onenand.c
> +++ b/arch/arm/mach-s5pv210/dev-onenand.c
> @@ -27,9 +27,14 @@ static struct resource s5pc110_onenand_resources[] = {
>  	},
>  	[1] = {
>  		.start	= S5PC110_PA_ONENAND_DMA,
> -		.end	= S5PC110_PA_ONENAND_DMA + SZ_2K - 1,
> +		.end	= S5PC110_PA_ONENAND_DMA + SZ_8K - 1,
>  		.flags	= IORESOURCE_MEM,
>  	},
> +	[2] = {
> +		.start	= IRQ_ONENAND_AUDI,
> +		.end	= IRQ_ONENAND_AUDI,
> +		.flags	= IORESOURCE_IRQ,
> +	},
>  };

You do not expect this to go through the MTD tree, right?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
