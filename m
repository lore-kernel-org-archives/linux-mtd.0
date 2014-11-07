Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmYFH-0004zy-6T
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 01:21:47 +0000
Date: Fri, 7 Nov 2014 09:21:15 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] mtd: spi-nor: prefer more specific entries from chips
 database
Message-ID: <20141107012115.GA28978@shldeISGChi005.sh.intel.com>
References: <1413963223-6365-1-git-send-email-zajec5@gmail.com>
 <1415257333-6488-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1415257333-6488-1-git-send-email-zajec5@gmail.com>
Cc: Bean Huo <beanhuo@micron.com>, Brian Norris <computersforpeace@gmail.com>,
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

On Thu, Nov 06, 2014 at 08:02:13AM +0100, Rafał Miłecki wrote:
> With two entries sharing first ID bytes but one of them having more of
> them, we should prefer the more specific one. Consider following:
> 1) n25q128a11 with ID 0x20bb18
> 2) n25q128a13 with ID 0x20bb181234
> we should prefer entry with the longer ID.
I perfer to make a limit before we add new item to the table:
    Put the longest one in the first place.

By this way, we can avoid the too much "for"s in the following code
which makes the code a little complicated.
 
So It should looks like this in the table.     
  1) n25q128a13 with ID 0x20bb181234
  2) n25q128a11 with ID 0x20bb18

Hi Brian, what's your opinion?
  
thanks
Huang Shijie
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> Cc: Bean Huo <beanhuo@micron.com>
> Cc: Huang Shijie <shijie.huang@intel.com>
> ---
> V2: Rebase on top of Huang patches
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 209e701..80e333f 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -667,6 +667,7 @@ static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
>  	int			tmp;
>  	u8			id[SPI_NOR_MAX_ID_LEN];
>  	struct flash_info	*info;
> +	u8			len;
>  
>  	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
>  	if (tmp < 0) {
> @@ -674,10 +675,15 @@ static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
>  		return ERR_PTR(tmp);
>  	}
>  
> -	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
> -		info = (void *)spi_nor_ids[tmp].driver_data;
> -		if (info->id_len) {
> -			if (!memcmp(info->id, id, info->id_len))
> +	/*
> +	 * Start looking for entries with the longest ID, then go to the less
> +	 * specific ones.
> +	 */
> +	for (len = SPI_NOR_MAX_ID_LEN; len > 0; len--) {
> +		for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
> +			info = (void *)spi_nor_ids[tmp].driver_data;
> +			if (info->id_len == len &&
> +			    !memcmp(info->id, id, info->id_len))
>  				return &spi_nor_ids[tmp];
>  		}
>  	}
> -- 
> 1.8.4.5
> 
