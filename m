Received: from 6.mo2.mail-out.ovh.net ([87.98.165.38])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clMy7-0005aC-6F
 for linux-mtd@lists.infradead.org; Tue, 07 Mar 2017 21:48:33 +0000
Received: from player718.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 71EEB5F643
 for <linux-mtd@lists.infradead.org>; Tue,  7 Mar 2017 22:48:05 +0100 (CET)
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for ESMT F25L32QA and
 F25L64QA
To: "L. D. Pinney" <ldpinney@gmail.com>,
 Linux MTD Development List <linux-mtd@lists.infradead.org>
References: <20170214222713.30913-1-ldpinney@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <0187d645-b65e-caf8-27e3-b524c3cfd72b@wedev4u.fr>
Date: Tue, 7 Mar 2017 22:48:03 +0100
MIME-Version: 1.0
In-Reply-To: <20170214222713.30913-1-ldpinney@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 14/02/2017 à 23:27, L. D. Pinney a écrit :
> Add Support for the ESMT F25L32QA and F25L64QA
> These are 4MB and 8MB SPI-NOR Chips from Elite Semiconductor Memory Technology

checkpatch displays a warning for this line:
WARNING: Possible unwrapped commit description (prefer a maximum 75
chars per line)

So I moved "Technology" on the next line.

Please verify your patch with checkpatch next time ;)

> 
> Signed-off-by: L. D. Pinney <ldpinney@gmail.com>

Applied to spi-nor/next after rewording the commit message as explained
above.

Thanks!
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 70e52ffc2203..205efab4746c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -960,6 +960,8 @@ static const struct flash_info spi_nor_ids[] = {
>  
>  	/* ESMT */
>  	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
> +	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
> +	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
>  
>  	/* Everspin */
>  	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
