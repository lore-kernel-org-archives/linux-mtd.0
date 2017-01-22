Subject: Re: [PATCH 10/22] mtd: physmap_of: add a hook for Gemini flash probing
To: Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20170122122154.10561-1-linus.walleij@linaro.org>
Cc: Janos Laube <janos.dev@gmail.com>,
 Paulius Zaleckas <paulius.zaleckas@gmail.com>, openwrt-devel@openwrt.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <7fe9bfbd-1b87-3642-e62d-bdce2b087865@gmail.com>
Date: Sun, 22 Jan 2017 15:46:44 +0100
MIME-Version: 1.0
In-Reply-To: <20170122122154.10561-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/22/2017 01:21 PM, Linus Walleij wrote:
> In order to support device tree probing of Gemini NOR flash
> chips, a certain register in the syscon needs to be poked
> to enable parallel flash mode.
> 
> Such things used to happen in "necessarily different" board
> file code, and this indeed was also done for the Gemini, so
> the MTD driver could treat it as any memory-mapped NOR flash,
> but this is not the way in the future: board files need to
> go, and hardware concerns distributed down to the applicable
> drivers.
> 
> This adds a hook in the same way that the Versatile did: if
> the Kconfig symbol is not selected the net total of supporting
> Gemini should be zero bytes of added code. To live up to this
> promise, also the return value error print from the Versatile
> extra probe call get to be removed in this patch, all printing
> need to happen in the add-ons.
> 
> Cc: Janos Laube <janos.dev@gmail.com>
> Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> MTD maintainers: please just apply this to the MTD tree when
> you are happy with it. It is functionally orthogonal to the rest
> of the series and is just in the series for context.
> ---
>  drivers/mtd/maps/Kconfig             |  10 +++
>  drivers/mtd/maps/Makefile            |   3 +
>  drivers/mtd/maps/physmap_of.c        |   9 ++-
>  drivers/mtd/maps/physmap_of_gemini.c | 120 +++++++++++++++++++++++++++++++++++
>  drivers/mtd/maps/physmap_of_gemini.h |  16 +++++
>  5 files changed, 155 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/mtd/maps/physmap_of_gemini.c
>  create mode 100644 drivers/mtd/maps/physmap_of_gemini.h
> 
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index 5bcc896a48c3..e9206060c598 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -84,6 +84,16 @@ config MTD_PHYSMAP_OF_VERSATILE
>  	  platforms, basically to add a VPP (write protection) callback so
>  	  the flash can be taken out of write protection.
>  
> +config MTD_PHYSMAP_OF_GEMINI
> +	bool "Support Gemini physmap OF"

I understand the description is basically copied from versatile, but
it's really cryptic. But maybe this can be fixed with subsequent patch
alongside versatile.

> +	depends on MTD_PHYSMAP_OF
> +	depends on MFD_SYSCON
> +	default ARCH_GEMINI
> +	help
> +	  This provides some extra DT physmap parsing for the Gemini
> +	  platforms, some detection and setting up parallel mode on the
> +	  external interface.
> +
>  config MTD_PMC_MSP_EVM
>  	tristate "CFI Flash device mapped on PMC-Sierra MSP"
>  	depends on PMC_MSP && MTD_CFI
> diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
> index 644f7d36d35d..36fe05ec9fab 100644
> --- a/drivers/mtd/maps/Makefile
> +++ b/drivers/mtd/maps/Makefile
> @@ -21,6 +21,9 @@ obj-$(CONFIG_MTD_PHYSMAP_OF)	+= physmap_of.o
>  ifdef CONFIG_MTD_PHYSMAP_OF_VERSATILE
>  obj-$(CONFIG_MTD_PHYSMAP_OF)	+= physmap_of_versatile.o
>  endif
> +ifdef CONFIG_MTD_PHYSMAP_OF_GEMINI
> +obj-$(CONFIG_MTD_PHYSMAP_OF)	+= physmap_of_gemini.o
> +endif

Can CONFIG_MTD_PHYSMAP_OF_GEMINI be selected without
CONFIG_MTD_PHYSMAP_OF being selected ? I don't think
so, since CONFIG_MTD_PHYSMAP_OF_GEMINI depends on
CONFIG_MTD_PHYSMAP_OF . So do we really need the ifdef?

>  obj-$(CONFIG_MTD_PISMO)		+= pismo.o
>  obj-$(CONFIG_MTD_PMC_MSP_EVM)   += pmcmsp-flash.o
>  obj-$(CONFIG_MTD_PCMCIA)	+= pcmciamtd.o

[...]

> +int of_flash_probe_gemini(struct platform_device *pdev,
> +			  struct device_node *np,
> +			  struct map_info *map)
> +{
> +	static struct regmap *rmap;
> +	struct device *dev = &pdev->dev;
> +	u32 val;
> +	int ret;
> +
> +	/* Multiplatform guard */
> +	if (!of_device_is_compatible(np, "cortina,gemini-flash"))
> +		return 0;
> +
> +	rmap = syscon_regmap_lookup_by_phandle(np, "syscon");
> +	if (IS_ERR(rmap)) {
> +		dev_err(dev, "no syscon\n");
> +		return PTR_ERR(rmap);
> +	}
> +
> +	ret = regmap_read(rmap, GLOBAL_STATUS, &val);
> +	if (ret) {
> +		dev_err(dev, "failed to read global status register\n");
> +		return -ENODEV;
> +	}
> +	dev_info(dev, "global status reg: %08x\n", val);

dev_dbg() ?

> +	/*
> +	 * It would be contradictory if a physmap flash was NOT parallel.
> +	 */
> +	if ((val & FLASH_TYPE_MASK) != FLASH_TYPE_PARALLEL) {
> +		dev_err(dev, "flash is not parallel\n");
> +		return -ENODEV;
> +	}
> +

[...]

-- 
Best regards,
Marek Vasut
