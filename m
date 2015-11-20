Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzv4b-0002A2-5w
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 23:26:33 +0000
Received: by padhx2 with SMTP id hx2so130071585pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 15:26:12 -0800 (PST)
Date: Fri, 20 Nov 2015 15:26:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: handle controller driver limitations in
 spi_nor_read
Message-ID: <20151120232610.GB64635@google.com>
References: <5614182B.7060304@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5614182B.7060304@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Oct 06, 2015 at 08:51:23PM +0200, Heiner Kallweit wrote:
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

As we discussed elsewhere, I don't think it's good to ignore all errors
here.

> +		pos += bytes_read;
> +	} while (pos < len && bytes_read);
>  
>  	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
> +
> +	*retlen = pos;
>  	return ret;
>  }
>  

Brian
