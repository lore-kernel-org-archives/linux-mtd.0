Received: from outbound-mail03.westnet.com.au ([203.10.1.244])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ttenj-0000sI-Io
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2013 13:37:41 +0000
Message-ID: <50F01599.30309@westnet.com.au>
Date: Fri, 11 Jan 2013 23:37:29 +1000
From: Greg Ungerer <gregungerer@westnet.com.au>
MIME-Version: 1.0
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2 v3] mtd/uclinux: support ROM and allow passing the
 base address
References: <1357835498-23904-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1357835498-23904-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>,
 kernel@pengutronix.de, Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/11/2013 02:31 AM, Uwe Kleine-König wrote:
> This allows to put the filesystem at a defined address in ROM allowing
> to save more precious RAM.
>
> I think it's safe to default to ROM because the intention of using the
> uclinux map is to use a romfs and so mtd-ram doesn't give you anything
> that mtd-rom doesn't.
>
> Just in case I missed something a warning is added if the driver has to
> fall back to the RAM mapping.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Changes since v2, id:1350027693-19528-1-git-send-email-u.kleine-koenig@pengutronix.de:
>
>   - drop a few "ram"s from printks instead of making them "ram/rom"
>   - fix a typo in the commit log and add rational for the introduced warning.
>
> Who is responsible for taking (or not) these two patches? David? Artem?
>
> Best regards
> Uwe
>
> ---
>   drivers/mtd/maps/Kconfig   |    2 +-
>   drivers/mtd/maps/uclinux.c |   26 +++++++++++++++++++++-----
>   2 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index 2e47c2e..0dc86fc 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -443,7 +443,7 @@ config MTD_GPIO_ADDR
>
>   config MTD_UCLINUX
>   	bool "Generic uClinux RAM/ROM filesystem support"
> -	depends on MTD_RAM=y && (!MMU || COLDFIRE)
> +	depends on (MTD_RAM=y || MTD_ROM=y) && (!MMU || COLDFIRE)
>   	help
>   	  Map driver to support image based filesystems for uClinux.
>
> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
> index 299bf88..b3a9c54 100644
> --- a/drivers/mtd/maps/uclinux.c
> +++ b/drivers/mtd/maps/uclinux.c
> @@ -24,11 +24,12 @@
>   /****************************************************************************/
>
>   struct map_info uclinux_ram_map = {
> -	.name = "RAM",
> -	.phys = (unsigned long)__bss_stop,
>   	.size = 0,
>   };
>
> +static unsigned long physaddr = -1;
> +module_param(physaddr, ulong, S_IRUGO);
> +
>   static struct mtd_info *uclinux_ram_mtdinfo;
>
>   /****************************************************************************/
> @@ -60,11 +61,17 @@ static int __init uclinux_mtd_init(void)
>   	struct map_info *mapp;
>
>   	mapp = &uclinux_ram_map;
> +
> +	if (physaddr == -1)
> +		mapp->phys = (resource_size_t)__bss_stop;
> +	else
> +		mapp->phys = physaddr;
> +
>   	if (!mapp->size)
>   		mapp->size = PAGE_ALIGN(ntohl(*((unsigned long *)(mapp->phys + 8))));
>   	mapp->bankwidth = 4;
>
> -	printk("uclinux[mtd]: RAM probe address=0x%x size=0x%x\n",
> +	printk("uclinux[mtd]: probe address=0x%x size=0x%x\n",
>   	       	(int) mapp->phys, (int) mapp->size);
>
>   	/*
> @@ -82,7 +89,16 @@ static int __init uclinux_mtd_init(void)
>
>   	simple_map_init(mapp);
>
> -	mtd = do_map_probe("map_ram", mapp);
> +	mapp->name = "ROM";
> +	mtd = do_map_probe("map_rom", mapp);
> +	if (!mtd) {
> +		/* fall back to ram probing for compatibility reasons */
> +		mapp->name = "RAM";
> +		mtd = do_map_probe("map_ram", mapp);
> +		if (mtd && IS_ENABLED(CONFIG_MTD_ROM))
> +			pr_err("Failed to map rom, but ram succeeded. Please report this issue!\n");

I still don't like this, as per:

http://lists.infradead.org/pipermail/linux-mtd/2012-October/044612.html

Regards
Greg


> +	}
> +
>   	if (!mtd) {
>   		printk("uclinux[mtd]: failed to find a mapping?\n");
>   		return(-ENXIO);
> @@ -118,6 +134,6 @@ module_exit(uclinux_mtd_cleanup);
>
>   MODULE_LICENSE("GPL");
>   MODULE_AUTHOR("Greg Ungerer <gerg@snapgear.com>");
> -MODULE_DESCRIPTION("Generic RAM based MTD for uClinux");
> +MODULE_DESCRIPTION("Generic MTD for uClinux");
>
>   /****************************************************************************/
>
