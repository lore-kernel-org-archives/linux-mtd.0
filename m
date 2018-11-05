Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJnoJ-0000aa-BS
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 22:57:45 +0000
Date: Mon, 5 Nov 2018 23:57:10 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Reset nor->addr_width when SFDP parsing
 failed
Message-ID: <20181105235710.794efa36@bbrezillon>
In-Reply-To: <20181019090222.17592-1-boris.brezillon@bootlin.com>
References: <20181019090222.17592-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 19 Oct 2018 11:02:22 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Commit 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI
> NOR flash memories") removed the 'nor->addr_width = 0;' statement when
> spi_nor_parse_sfdp() returns an error, thus leaving ->addr_width in an
> undefined state which can cause trouble when spi_nor_scan() checks its
> value.
> 
> Reported-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories")
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Queued to the fixes branch.

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 9407ca5f9443..3e54e31889c7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -3250,12 +3250,14 @@ static int spi_nor_init_params(struct spi_nor *nor,
>  		memcpy(&sfdp_params, params, sizeof(sfdp_params));
>  		memcpy(&prev_map, &nor->erase_map, sizeof(prev_map));
>  
> -		if (spi_nor_parse_sfdp(nor, &sfdp_params))
> +		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
> +			nor->addr_width = 0;
>  			/* restore previous erase map */
>  			memcpy(&nor->erase_map, &prev_map,
>  			       sizeof(nor->erase_map));
> -		else
> +		} else {
>  			memcpy(params, &sfdp_params, sizeof(*params));
> +		}
>  	}
>  
>  	return 0;
