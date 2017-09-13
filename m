Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsCxt-0004WU-77
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 19:04:50 +0000
Date: Wed, 13 Sep 2017 12:04:25 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Arun Nagendran <arunrasppi@gmail.com>
Cc: manonuevo@micron.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Enable the read ECC before program the page
Message-ID: <20170913190425.GA27232@kroah.com>
References: <59b97a4e.cf02b00a.d8b82.a310@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59b97a4e.cf02b00a.d8b82.a310@mx.google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 13, 2017 at 02:34:53PM -0400, Arun Nagendran wrote:
> Current program_page function did following operation:
> 
> 1. read page (with ECC OFF)
> 2. modify the page
> 3. write the page (with ECC ON)
> 
> For some case(buggy flash Chip), while read the page without ECC ON,
> we may read the page with bit flip error and modify that bad page without
> knowing the bit flip error on that page.
> also we re-calculate the hash for bad page and write it.
> This could bring potential in-consistency problem with Flash data.
> 
> Verify this logic with GIGA DEVICE Part(GD5F2GQ4RCFIG):
> we see this in-conststency problem wit Giga Device and fix on
> this patch resovle that issue.
> ---
>  drivers/staging/mt29f_spinand/mt29f_spinand.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
> index a4e3ae8..202d222 100644
> --- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
> +++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
> @@ -496,8 +496,13 @@ static int spinand_program_page(struct spi_device *spi_nand,
>  	if (!wbuf)
>  		return -ENOMEM;
>  
> -	enable_read_hw_ecc = 0;
> -	spinand_read_page(spi_nand, page_id, 0, CACHE_BUF, wbuf);
> +	enable_read_hw_ecc = 1;
> +	retval = spinand_read_page(spi_nand, page_id, 0, CACHE_BUF, wbuf);
> +	if( retval < 0 )
> +	{
> +		dev_err(&spi_nand->dev, "ecc error on read page!!!\n");
> +		return retval;
> +	}

Always use scripts/checkpatch.pl so you don't get grumpy maintainers
telling you to use scripts/checkpatch.pl :(
