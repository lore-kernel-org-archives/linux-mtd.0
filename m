Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e8uDD-0004JC-Iw
 for linux-mtd@lists.infradead.org; Sun, 29 Oct 2017 20:29:41 +0000
Subject: Re: [PATCH] mtd: spi-nor: Add support for mr25h128
To: Philipp Puschmann <pp@emlix.com>, linux-mtd@lists.infradead.org
References: <20171019081247.5486-1-pp@emlix.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <dd554f06-b978-1250-1b3e-5da0a325cddb@wedev4u.fr>
Date: Sun, 29 Oct 2017 21:29:14 +0100
MIME-Version: 1.0
In-Reply-To: <20171019081247.5486-1-pp@emlix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Philipp,

+ Marek

Please add spi-nor maintainers en CC when submitting spi-nor patches.
Also always good to add linux-kernel@vger.kernel.org en CC when submitting
patches.

Le 19/10/2017 à 10:12, Philipp Puschmann a écrit :
> Add Everspin mr25h128 16KB MRAM to the list of supported chips.
> 
> Signed-off-by: Philipp Puschmann <pp@emlix.com>

Applied to the spi-nor/next branch of l2-mtd with the tiny modification below:
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
>  drivers/mtd/devices/m25p80.c                            | 1 +
>  drivers/mtd/spi-nor/spi-nor.c                           | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> index 9ce35af8507c..956bb046e599 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> @@ -13,6 +13,7 @@ Required properties:
>                   at25df321a
>                   at25df641
>                   at26df081a
> +                 mr25h128
>                   mr25h256
>                   mr25h10
>                   mr25h40
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 00eea6fd379c..dbe6a1de2bb8 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -359,6 +359,7 @@ static const struct spi_device_id m25p_ids[] = {
>  	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
>  
>  	/* Everspin MRAMs (non-JEDEC) */
> +	{ "mr25h128" }, /* 128 Kib, 40 MHz */
>  	{ "mr25h256" }, /* 256 Kib, 40 MHz */
>  	{ "mr25h10" },  /*   1 Mib, 40 MHz */
>  	{ "mr25h40" },  /*   4 Mib, 40 MHz */
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 386de64e5a86..a835bb890166 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -964,6 +964,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
>  
>  	/* Everspin */
> +	{ "mr25h128", CAT25_INFO(16 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>  	{ "mr25h256", CAT25_INFO(32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },

As explained in my reply to your other mail "mtd: spi-nor: fix style issue", I'd
rather keep data aligned, so I kept the "mr25h256" entry as before and just add
your "mr25h128" entry:

+	{ "mr25h128", CAT25_INFO( 16 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>  	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>  	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> 
