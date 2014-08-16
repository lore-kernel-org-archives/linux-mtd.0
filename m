Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XITEN-0007pN-OK
 for linux-mtd@lists.infradead.org; Sat, 16 Aug 2014 01:56:33 +0000
Received: by mail-pa0-f46.google.com with SMTP id lj1so4387923pab.19
 for <linux-mtd@lists.infradead.org>; Fri, 15 Aug 2014 18:56:10 -0700 (PDT)
Date: Fri, 15 Aug 2014 18:56:06 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: move support for struct flash_platform_data's
 "type" into m25p80
Message-ID: <20140816015606.GK18411@ld-irv-0074>
References: <1407420506-20696-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1407420506-20696-1-git-send-email-zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 07, 2014 at 04:08:26PM +0200, Rafał Miłecki wrote:
> This "type" seems to be an extra hint for m25p80 about the flash. Some
> archs register flash_platform_data with "name" set to "m25p80" and then
> with a real flash name set in "type". It seems to be a trick specific
> to the m25p80 so let's move it out of spi-nor.
> Btw switch to the spi_nor_match_id instead of iterating spi_nor_ids.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> Does this patch make sense to you? It has been compile-tested only.

The patch mostly makes sense, and I really like the idea of killing
struct flash_platform_data from spi-nor.c (it's m25p80-specific,
really). But there's at least one potential hiccup here.

> ---
>  drivers/mtd/devices/m25p80.c  | 10 ++++++++--
>  drivers/mtd/spi-nor/spi-nor.c | 29 +----------------------------
>  2 files changed, 9 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 116d979..e338a31 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -176,11 +176,14 @@ static int m25p_probe(struct spi_device *spi)
>  {
>  	struct mtd_part_parser_data	ppdata;
>  	struct flash_platform_data	*data;
> +	const struct spi_device_id *id = NULL;
>  	struct m25p *flash;
>  	struct spi_nor *nor;
>  	enum read_mode mode = SPI_NOR_NORMAL;
>  	int ret;
>  
> +	data = dev_get_platdata(&spi->dev);
> +
>  	flash = devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
>  	if (!flash)
>  		return -ENOMEM;
> @@ -206,11 +209,14 @@ static int m25p_probe(struct spi_device *spi)
>  		mode = SPI_NOR_QUAD;
>  	else if (spi->mode & SPI_RX_DUAL)
>  		mode = SPI_NOR_DUAL;
> -	ret = spi_nor_scan(nor, spi_get_device_id(spi), mode);
> +	if (data && data->type)
> +		id = spi_nor_match_id(data->type);
> +	if (!id)
> +		id = spi_get_device_id(spi);

This probably deserves a comment as to what each ID scan does.

> +	ret = spi_nor_scan(nor, id, mode);
>  	if (ret)
>  		return ret;
>  
> -	data = dev_get_platdata(&spi->dev);
>  	ppdata.of_node = spi->dev.of_node;
>  
>  	return mtd_device_parse_register(&flash->mtd, NULL, &ppdata,
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index ef45177..d733b16 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -896,7 +896,6 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
>  			enum read_mode mode)
>  {
>  	struct flash_info		*info;
> -	struct flash_platform_data	*data;
>  	struct device *dev = nor->dev;
>  	struct mtd_info *mtd = nor->mtd;
>  	struct device_node *np = dev->of_node;
> @@ -907,28 +906,6 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
>  	if (ret)
>  		return ret;
>  
> -	/* Platform data helps sort out which chip type we have, as
> -	 * well as how this board partitions it.  If we don't have
> -	 * a chip ID, try the JEDEC id commands; they'll work for most
> -	 * newer chips, even if we don't recognize the particular chip.
> -	 */
> -	data = dev_get_platdata(dev);
> -	if (data && data->type) {
> -		const struct spi_device_id *plat_id;
> -
> -		for (i = 0; i < ARRAY_SIZE(spi_nor_ids) - 1; i++) {
> -			plat_id = &spi_nor_ids[i];
> -			if (strcmp(data->type, plat_id->name))
> -				continue;
> -			break;
> -		}
> -
> -		if (i < ARRAY_SIZE(spi_nor_ids) - 1)
> -			id = plat_id;
> -		else
> -			dev_warn(dev, "unrecognized id %s\n", data->type);
> -	}
> -
>  	info = (void *)id->driver_data;
>  
>  	if (info->jedec_id) {
> @@ -966,11 +943,7 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
>  		write_sr(nor, 0);
>  	}
>  
> -	if (data && data->name)
> -		mtd->name = data->name;
> -	else
> -		mtd->name = dev_name(dev);
> -
> +	mtd->name = dev_name(dev);

We have some potential issues here with the selection of mtd->name. It's
nice if we don't change the naming for existing devices (i.e., those
instantiated via flash_platform_data in m25p80). Perhaps you can move
the m25p80 mtd->name assignment back into m25p80.c, and then this code
can be:

	if (!mtd->name)
		mtd->name = dev_name(dev);

>  	mtd->type = MTD_NORFLASH;
>  	mtd->writesize = 1;
>  	mtd->flags = MTD_CAP_NORFLASH;

BTW, this patch has some conflicts with a (later) patch by Huang. Just
FYI. I'll handle the conflicts or ask you to rebase when the time comes.

Thanks,
Brian
