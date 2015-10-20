Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zoas7-0005el-5C
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2015 17:38:51 +0000
Received: by wicfx6 with SMTP id fx6so56754756wic.1
 for <linux-mtd@lists.infradead.org>; Tue, 20 Oct 2015 10:38:29 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: handle controller driver limitations in
 spi_nor_read
To: Brian Norris <computersforpeace@gmail.com>
References: <5614182B.7060304@gmail.com>
Cc: linux-mtd@lists.infradead.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <56267C0D.1020906@gmail.com>
Date: Tue, 20 Oct 2015 19:38:21 +0200
MIME-Version: 1.0
In-Reply-To: <5614182B.7060304@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Any feedback on this patch and the two others I sent on Oct 6th/7th?

Thanks

Am 06.10.2015 um 20:51 schrieb Heiner Kallweit:
> Back in May there was a discussion on how to handle controller driver
> limitations like max message size (e.g. spi-fsl-espi supports
> message sizes up to 64Kb only).
> According to Brian extending the API might not be needed and a better
> handling of the returned actual_length of the message should be
> sufficient.
> 
> Following the suggestion this patch supports reading chunks.
> As long as something was read also errors (like -EMSGSIZE) are ignored.
> 
> Afterwards related hacks can be removed from affected controller drivers,
> making them work with any protocol driver.
> Currently e.g. spi-fsl-espi implicitely assumes that longer reads come
> from m25p80 protocol driver (if second transfer in message is a read and
> first transfer is a send then bytes 2-4 of the send are assumed to be a
> 3 byte address of a flash read).
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 4be41fb..17b5239 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -761,6 +761,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
>  			size_t *retlen, u_char *buf)
>  {
>  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +	size_t bytes_read, pos = 0;
>  	int ret;
>  
>  	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
> @@ -769,9 +770,21 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	if (ret)
>  		return ret;
>  
> -	ret = nor->read(nor, from, len, retlen, buf);
> +	/* Consider the case that a controller driver is not able
> +	 * to read all requested bytes at once. It might return
> +	 * an error and the number of bytes read.
> +	 * Therefore ignore errors as long as something was read.
> +	 */
> +	do {
> +		bytes_read = 0;
> +		ret = nor->read(nor, from + pos, len - pos,
> +				&bytes_read, buf + pos);
> +		pos += bytes_read;
> +	} while (pos < len && bytes_read);
>  
>  	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
> +
> +	*retlen = pos;
>  	return ret;
>  }
>  
> 
