Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjV6R-0002Mn-EY
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 15:24:04 +0000
From: Marek Vasut <marex@denx.de>
To: Chunhe Lan <Chunhe.Lan@freescale.com>
Subject: Re: [PATCH] mtd: spi-nor: Move n25q032 entry to Micron devices list
Date: Wed, 29 Oct 2014 15:05:48 +0100
References: <1414576675-7792-1-git-send-email-Chunhe.Lan@freescale.com>
In-Reply-To: <1414576675-7792-1-git-send-email-Chunhe.Lan@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201410291505.48720.marex@denx.de>
Cc: Huang Shijie <shijie8@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, October 29, 2014 at 10:57:55 AM, Chunhe Lan wrote:

[...]

There are problems with this patch. Firstly, it misses any description
explaining why the change took place at all. From an outside observer
point of view, this change seems random at best.

Secondly, the change in itself makes no sense -- it just reorders the
entries in an array. I can only speculate here, that your SPI NOR was
recognised as some other part, right ? That's why moving the n25q032
higher resolved the problem for you, right ?

The problem is with the fragility of this code which matches the JEDEC
ID and type of the SPI NOR. I recall Huang had some patches which tried
to resolve this, not sure what the status of those patches is though.

> Signed-off-by: Chunhe Lan <Chunhe.Lan@freescale.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Huang Shijie <shijie8@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index ae16aa2..1fa5e05 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -530,6 +530,7 @@ const struct spi_device_id spi_nor_ids[] = {
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) 
},
> 
>  	/* Micron */
> +	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, 0) },
>  	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, 0) },
>  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0) },
>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
> @@ -586,7 +587,6 @@ const struct spi_device_id spi_nor_ids[] = {
>  	{ "m25p32",  INFO(0x202016,  0,  64 * 1024,  64, 0) },
>  	{ "m25p64",  INFO(0x202017,  0,  64 * 1024, 128, 0) },
>  	{ "m25p128", INFO(0x202018,  0, 256 * 1024,  64, 0) },
> -	{ "n25q032", INFO(0x20ba16,  0,  64 * 1024,  64, 0) },
> 
>  	{ "m25p05-nonjedec",  INFO(0, 0,  32 * 1024,   2, 0) },
>  	{ "m25p10-nonjedec",  INFO(0, 0,  32 * 1024,   4, 0) },

Best regards,
Marek Vasut
