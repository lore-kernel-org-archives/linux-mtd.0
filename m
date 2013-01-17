Received: from outbound-mail03.westnet.com.au ([203.10.1.244])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TvfuO-000562-Dv
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 03:12:54 +0000
Message-ID: <50F76C2E.8060707@westnet.com.au>
Date: Thu, 17 Jan 2013 13:12:46 +1000
From: Greg Ungerer <gregungerer@westnet.com.au>
MIME-Version: 1.0
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v4 1/2] mtd/uclinux: support ROM and allow passing the
 base address
References: <1357835498-23904-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1358347016-507-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1358347016-507-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17/01/13 00:36, Uwe Kleine-König wrote:
> This allows to put the filesystem at a defined address in ROM allowing
> to save more precious RAM.
>
> I think it's safe to default to ROM because the intention of using the
> uclinux map is to use a romfs and so mtd-ram doesn't give you anything
> that mtd-rom doesn't.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Greg Ungerer <gerg@uclinux.org>


> ---
> Changes since v3,
> id:1357835498-23904-1-git-send-email-u.kleine-koenig@pengutronix.de:
>
>   - drop runtime warning
>   - only probe one of map_rom or map_ram as both should succeed in the
>     same cases
>
> Changes since v2,
> id:1350027693-19528-1-git-send-email-u.kleine-koenig@pengutronix.de:
>
>   - drop a few "ram"s from printks instead of making them "ram/rom".
>   - fix a typo in the commit log and add rational for the introduced
>     warning.
>
> Changes since v1,
> id:1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de:
>
>   - don't make uclinux_ram_map static as pointed out by Mike and Greg.
> ---
>   drivers/mtd/maps/Kconfig   |    2 +-
>   drivers/mtd/maps/uclinux.c |   24 +++++++++++++++++++-----
>   2 files changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index 62ba82c..3ed17c4 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -429,7 +429,7 @@ config MTD_GPIO_ADDR
>
>   config MTD_UCLINUX
>   	bool "Generic uClinux RAM/ROM filesystem support"
> -	depends on MTD_RAM=y && (!MMU || COLDFIRE)
> +	depends on (MTD_RAM=y || MTD_ROM=y) && (!MMU || COLDFIRE)
>   	help
>   	  Map driver to support image based filesystems for uClinux.
>
> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
> index 299bf88..f56d0aa 100644
> --- a/drivers/mtd/maps/uclinux.c
> +++ b/drivers/mtd/maps/uclinux.c
> @@ -23,12 +23,20 @@
>
>   /****************************************************************************/
>
> +#ifdef CONFIG_MTD_ROM
> +#define MAP_NAME "rom"
> +#else
> +#define MAP_NAME "ram"
> +#endif
> +
>   struct map_info uclinux_ram_map = {
> -	.name = "RAM",
> -	.phys = (unsigned long)__bss_stop,
> +	.name = MAP_NAME,
>   	.size = 0,
>   };
>
> +static unsigned long physaddr = -1;
> +module_param(physaddr, ulong, S_IRUGO);
> +
>   static struct mtd_info *uclinux_ram_mtdinfo;
>
>   /****************************************************************************/
> @@ -60,11 +68,17 @@ static int __init uclinux_mtd_init(void)
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
> @@ -82,7 +96,7 @@ static int __init uclinux_mtd_init(void)
>
>   	simple_map_init(mapp);
>
> -	mtd = do_map_probe("map_ram", mapp);
> +	mtd = do_map_probe("map_" MAP_NAME, mapp);
>   	if (!mtd) {
>   		printk("uclinux[mtd]: failed to find a mapping?\n");
>   		return(-ENXIO);
> @@ -118,6 +132,6 @@ module_exit(uclinux_mtd_cleanup);
>
>   MODULE_LICENSE("GPL");
>   MODULE_AUTHOR("Greg Ungerer <gerg@snapgear.com>");
> -MODULE_DESCRIPTION("Generic RAM based MTD for uClinux");
> +MODULE_DESCRIPTION("Generic MTD for uClinux");
>
>   /****************************************************************************/
>
