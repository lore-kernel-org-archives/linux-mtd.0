Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDRCg-0005Dw-R2
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 09:36:25 +0000
Subject: Re: [PATCH] mtd: spi-nor: Reset nor->addr_width when SFDP parsing
 failed
To: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "Marek
 Vasut" <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
References: <20181019090222.17592-1-boris.brezillon@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@microchip.com>
Message-ID: <a45c21fc-962f-9e3e-0b13-ff69e8143f8c@microchip.com>
Date: Fri, 19 Oct 2018 12:35:54 +0300
MIME-Version: 1.0
In-Reply-To: <20181019090222.17592-1-boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 10/19/2018 12:02 PM, Boris Brezillon wrote:
> Commit 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI
> NOR flash memories") removed the 'nor->addr_width = 0;' statement when
> spi_nor_parse_sfdp() returns an error, thus leaving ->addr_width in an
> undefined state which can cause trouble when spi_nor_scan() checks its
> value.
> 
> Reported-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories")
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Commit 5390a8df769e removed the following:

@@ -2521,20 +2962,20 @@ static int spi_nor_init_params(struct spi_nor *nor,
-       /* Override the parameters with data read from SFDP tables. */
-       nor->addr_width = 0;
-       nor->mtd.erasesize = 0;

this is good because nor is allocated with _kzalloc by all it's callers. Should
we add a comment when declaring spi_nor structure or it's widely known that it
should be initialized with zeros?

[cut]
-               if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
-                       nor->addr_width = 0;

removal of nor->addr_width = 0; is bad, and must be reintroduced because
nor->addr_width is modified inside spi_nor_parse_sfdp()

-                       nor->mtd.erasesize = 0;
this removal is good, because we don't overwrite nor->mtd.erasesize in
spi_nor_parse_sfdp()

I should have sent this changes in a separate patch, sorry.

Thanks!
ta

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
> 
