Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5Ekb-0006Bs-N4
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 08:28:30 +0000
Subject: Re: [PATCH 2/3]NAND: OMAP: Fixing omap nand driver, compiled as
	module
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790910300227r41d42673webad0ee48e3444d1@mail.gmail.com>
References: <ce9ab5790910292321y1e7239b7pbffe9a5891d66448@mail.gmail.com>
	<ce9ab5790910300142kf12e31cpd6249d4c7383553f@mail.gmail.com>
	<ce9ab5790910300227r41d42673webad0ee48e3444d1@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Nov 2009 10:28:17 +0200
Message-Id: <1257236897.21596.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-omap@vger.kernel.org, Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-30 at 14:57 +0530, Vimal Singh wrote:
> Last time I forgot to 'git add' for 'arch/arm/mach-omap2/gpmc.c'... My bad.
> Correct patch is below.
> 
> -vimal
> 
> 
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Fri, 30 Oct 2009 14:54:29 +0530
> Subject: [PATCH] NAND: OMAP: Fixing omap nand driver, compiled as module
> 
> Removing OMAP NAND driver, when loaded as a module, gives error and
> does not get success. This fixes this and makes driver loadable and
> removable run time.
> 
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
>  arch/arm/mach-omap2/gpmc.c |    2 ++
>  drivers/mtd/nand/omap2.c   |    5 ++++-
>  2 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
> index 1587682..1d10b7b 100644
> --- a/arch/arm/mach-omap2/gpmc.c
> +++ b/arch/arm/mach-omap2/gpmc.c
> @@ -88,6 +88,7 @@ void gpmc_cs_write_reg(int cs, int idx, u32 val)
>  	reg_addr = gpmc_base + GPMC_CS0 + (cs * GPMC_CS_SIZE) + idx;
>  	__raw_writel(val, reg_addr);
>  }
> +EXPORT_SYMBOL(gpmc_cs_write_reg);
> 
>  u32 gpmc_cs_read_reg(int cs, int idx)
>  {
> @@ -96,6 +97,7 @@ u32 gpmc_cs_read_reg(int cs, int idx)
>  	reg_addr = gpmc_base + GPMC_CS0 + (cs * GPMC_CS_SIZE) + idx;
>  	return __raw_readl(reg_addr);
>  }
> +EXPORT_SYMBOL(gpmc_cs_read_reg);

Why do you export these?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
