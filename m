Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZGti-0002TA-KS
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 09:08:07 +0000
Message-ID: <5268E35C.2030000@ti.com>
Date: Thu, 24 Oct 2013 14:37:40 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 4/5] mtd: m25p80: remove M25PXX_USE_FAST_READ Kconfig
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <1382583503-13748-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1382583503-13748-4-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,
On Thursday 24 October 2013 08:28 AM, Brian Norris wrote:
> Remove the compile-time option for FAST_READ, since we have run-time
> support for detecting it.
>
> Signed-off-by: Brian Norris<computersforpeace@gmail.com>
> ---
>   drivers/mtd/devices/Kconfig  |  7 -------
>   drivers/mtd/devices/m25p80.c | 11 ++++++-----
>   2 files changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> index 74ab4b7..0128138 100644
> --- a/drivers/mtd/devices/Kconfig
> +++ b/drivers/mtd/devices/Kconfig
> @@ -95,13 +95,6 @@ config MTD_M25P80
>   	  if you want to specify device partitioning or to use a device which
>   	  doesn't support the JEDEC ID instruction.
>
> -config M25PXX_USE_FAST_READ
> -	bool "Use FAST_READ OPCode allowing SPI CLK>= 50MHz"
> -	depends on MTD_M25P80
> -	default y
> -	help
> -	  This option enables FAST_READ access supported by ST M25Pxx.
> -
>   config MTD_SPEAR_SMI
>   	tristate "SPEAR MTD NOR Support through SMI controller"
>   	depends on PLAT_SPEAR
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 7e3ec7a..d6c5c57 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -1055,13 +1055,14 @@ static int m25p_probe(struct spi_device *spi)
>   	flash->page_size = info->page_size;
>   	flash->mtd.writebufsize = flash->page_size;
>
> -	flash->fast_read = false;
> -	if (np&&  of_property_read_bool(np, "m25p,fast-read"))
> +	if (np)
> +		/* If we were instantiated by DT, use it */
> +		flash->fast_read = of_property_read_bool(np, "m25p,fast-read");
> +	else
> +		/* If we weren't instantiated by DT, default to fast-read */
>   		flash->fast_read = true;
>
This comment is in sync with my quad read mode support patch on the mtd 
list.

Here, you are defaulting the fast read to be true. Once I add quad mode
on top of this, I will set flash->quad_read = true. So, we will have both
fast and quad read set(which will not be correct). So, it is necessary 
to default to fast read ?
> -#ifdef CONFIG_M25PXX_USE_FAST_READ
> -	flash->fast_read = true;
> -#endif
> +	/* Some devices cannot do fast-read, no matter what DT tells us */
>   	if (info->flags&  M25P_NO_FR)
>   		flash->fast_read = false;
>
