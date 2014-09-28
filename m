Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYNim-0001VC-Hm
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 23:17:41 +0000
Received: by mail-pd0-f178.google.com with SMTP id y10so1500458pdj.37
 for <linux-mtd@lists.infradead.org>; Sun, 28 Sep 2014 16:17:18 -0700 (PDT)
Date: Sun, 28 Sep 2014 16:17:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V3] mtd: move support for struct flash_platform_data into
 m25p80
Message-ID: <20140928231714.GD3248@norris-Latitude-E6410>
References: <1408194788-10434-1-git-send-email-zajec5@gmail.com>
 <1411936614-28886-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1411936614-28886-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Ben Hutchings <ben@decadent.org.uk>,
 linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rafal,

On Sun, Sep 28, 2014 at 10:36:54PM +0200, Rafał Miłecki wrote:
> This "type" seems to be an extra hint for m25p80 about the flash. Some
> archs register flash_platform_data with "name" set to "m25p80" and then
> with a real flash name set in "type". It seems to be a trick specific
> to the m25p80 so let's move it out of spi-nor.
> Btw switch to the spi_nor_match_id instead of iterating spi_nor_ids.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> V2: Comment usage of data->type
>     Set mtd.name in m25p80
> V3: Fix "respect" spelling in the comment
> 
> Brian: do you think this comment about "name" and "type" is clear
> enough now? If so, could you pick this patch, please?

I think the comments and patch look good now.

Unfortunately, I've delayed this a bit long, and in the meantime, we
have another issue cropping up here that may cause conflicts:

  http://lists.infradead.org/pipermail/linux-mtd/2014-September/055323.html

But anyway, I think his patch set is not quite ready, and this patch may
get us in a better position to resolve his, so:

Applied to l2-mtd.git.

Ben, please base your work on l2-mtd.git/master. If we need to get your
patch #1 into stable, then we can mark this patch as a dependency, I
think.

Brian

> ---
>  drivers/mtd/devices/m25p80.c  | 22 ++++++++++++++++++++--
>  drivers/mtd/spi-nor/spi-nor.c | 28 +---------------------------
>  2 files changed, 21 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index ed7e0a1b..dcda628 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -193,11 +193,14 @@ static int m25p_probe(struct spi_device *spi)
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
> @@ -223,11 +226,26 @@ static int m25p_probe(struct spi_device *spi)
>  		mode = SPI_NOR_QUAD;
>  	else if (spi->mode & SPI_RX_DUAL)
>  		mode = SPI_NOR_DUAL;
> -	ret = spi_nor_scan(nor, spi_get_device_id(spi), mode);
> +
> +	if (data && data->name)
> +		flash->mtd.name = data->name;
> +
> +	/* For some (historical?) reason many platforms provide two different
> +	 * names in flash_platform_data: "name" and "type". Quite often name is
> +	 * set to "m25p80" and then "type" provides a real chip name.
> +	 * If that's the case, respect "type" and ignore a "name".
> +	 */
> +	if (data && data->type)
> +		id = spi_nor_match_id(data->type);
> +
> +	/* If we didn't get name from platform, simply use "modalias". */
> +	if (!id)
> +		id = spi_get_device_id(spi);
> +
> +	ret = spi_nor_scan(nor, id, mode);
>  	if (ret)
>  		return ret;
>  
> -	data = dev_get_platdata(&spi->dev);
>  	ppdata.of_node = spi->dev.of_node;
>  
>  	return mtd_device_parse_register(&flash->mtd, NULL, &ppdata,
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 11459f6..ae16aa2 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -915,7 +915,6 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
>  			enum read_mode mode)
>  {
>  	struct flash_info		*info;
> -	struct flash_platform_data	*data;
>  	struct device *dev = nor->dev;
>  	struct mtd_info *mtd = nor->mtd;
>  	struct device_node *np = dev->of_node;
> @@ -926,28 +925,6 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
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
> @@ -985,11 +962,8 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
>  		write_sr(nor, 0);
>  	}
>  
> -	if (data && data->name)
> -		mtd->name = data->name;
> -	else
> +	if (!mtd->name)
>  		mtd->name = dev_name(dev);
> -
>  	mtd->type = MTD_NORFLASH;
>  	mtd->writesize = 1;
>  	mtd->flags = MTD_CAP_NORFLASH;
