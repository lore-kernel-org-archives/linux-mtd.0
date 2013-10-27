Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VaTGx-0001xh-GU
 for linux-mtd@lists.infradead.org; Sun, 27 Oct 2013 16:33:03 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 4/5] mtd: m25p80: remove M25PXX_USE_FAST_READ Kconfig
Date: Sun, 27 Oct 2013 17:32:42 +0100
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <1382583503-13748-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1382583503-13748-4-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310271732.42518.marex@denx.de>
Cc: sourav.poddar@ti.com, linux-mtd@lists.infradead.org,
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

> Remove the compile-time option for FAST_READ, since we have run-time
> support for detecting it.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/devices/Kconfig  |  7 -------
>  drivers/mtd/devices/m25p80.c | 11 ++++++-----
>  2 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> index 74ab4b7..0128138 100644
> --- a/drivers/mtd/devices/Kconfig
> +++ b/drivers/mtd/devices/Kconfig
> @@ -95,13 +95,6 @@ config MTD_M25P80
>  	  if you want to specify device partitioning or to use a device which
>  	  doesn't support the JEDEC ID instruction.
> 
> -config M25PXX_USE_FAST_READ
> -	bool "Use FAST_READ OPCode allowing SPI CLK >= 50MHz"
> -	depends on MTD_M25P80
> -	default y
> -	help
> -	  This option enables FAST_READ access supported by ST M25Pxx.
> -
>  config MTD_SPEAR_SMI
>  	tristate "SPEAR MTD NOR Support through SMI controller"
>  	depends on PLAT_SPEAR
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 7e3ec7a..d6c5c57 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -1055,13 +1055,14 @@ static int m25p_probe(struct spi_device *spi)
>  	flash->page_size = info->page_size;
>  	flash->mtd.writebufsize = flash->page_size;
> 
> -	flash->fast_read = false;
> -	if (np && of_property_read_bool(np, "m25p,fast-read"))
> +	if (np)
> +		/* If we were instantiated by DT, use it */
> +		flash->fast_read = of_property_read_bool(np, "m25p,fast-read");
> +	else
> +		/* If we weren't instantiated by DT, default to fast-read */
>  		flash->fast_read = true;

We should default to FALSE , unless explicitly requested by DT, am I wrong? 
Otherwise this might break the old chips.

[...]

Best regards,
Marek Vasut
