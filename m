Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XG1Da-00025t-I2
 for linux-mtd@lists.infradead.org; Sat, 09 Aug 2014 07:37:34 +0000
Received: by mail-pd0-f176.google.com with SMTP id y10so8102367pdj.7
 for <linux-mtd@lists.infradead.org>; Sat, 09 Aug 2014 00:37:13 -0700 (PDT)
Date: Sat, 9 Aug 2014 15:37:06 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/8] mtd: spi-nor: handle timeout errors in spi_nor_write()
Message-ID: <20140809073704.GB31092@localhost.localdomain>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-3-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407374222-8448-3-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 zajec5@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 06, 2014 at 06:16:56PM -0700, Brian Norris wrote:
> The error label was unused here. It looks like we're missing at least
> one case that should be doing 'goto write_err'.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 5825b8a12cee..d77c93232b76 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -809,7 +809,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  			if (page_size > nor->page_size)
>  				page_size = nor->page_size;
>  
> -			wait_till_ready(nor);
> +			ret = wait_till_ready(nor);
> +			if (ret)
> +				goto write_err;
> +
>  			write_enable(nor);
>  
>  			nor->write(nor, to + i, page_size, retlen, buf + i);
> @@ -818,7 +821,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  
>  write_err:
>  	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
> -	return 0;
> +	return ret;
>  }
>  
>  static int macronix_quad_enable(struct spi_nor *nor)
> -- 
> 1.9.1
Acked-by: Huang Shijie <shijie8@gmail.com>

Huang Shijie
