Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkest-0005hs-HZ
 for linux-mtd@lists.infradead.org; Wed, 23 Aug 2017 23:16:29 +0000
Date: Wed, 23 Aug 2017 16:16:11 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Arun Nagendran <arunrasppi@gmail.com>
Cc: kamlakant.patel@broadcom.com, manonuevo@micron.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4.13.0-rc6 1] mt29f_spinand: Fix to Enable the ECC for
 page read on program
Message-ID: <20170823231611.GD5193@kroah.com>
References: <CAMx9D-4=n1iDoJA5sVt3CCOgRjieYJ0rkcKL+c+S53tygs84TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMx9D-4=n1iDoJA5sVt3CCOgRjieYJ0rkcKL+c+S53tygs84TQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 23, 2017 at 05:08:54PM -0400, Arun Nagendran wrote:
> staging:mt29f_spinand: Enable the ECC for page read on program.

Why is this line here?

> 
> we have to enable the ECC during page read in spinand_program_page function,
> because program page is over-writing only the specific data in the read page.
> at same time, if you turn off the ECC and read the page, we may read corrupted
> data with potential bit flips error.
> I verified this logic with GiGa Device part GD5F2GQ4RCYI, found this data
> corruption problem.
> 
> 
> --- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
> +++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
> @@ -496,8 +496,12 @@ static int spinand_program_page(struct spi_device
> *spi_nand,
>         if (!wbuf)
>                 return -ENOMEM;
>  
> -       enable_read_hw_ecc = 0;
> -       spinand_read_page(spi_nand, page_id, 0, CACHE_BUF, wbuf);
> +       enable_read_hw_ecc = 1;
> +       retval = spinand_read_page(spi_nand, page_id, 0, CACHE_BUF, wbuf);
> +       {

Why the { here?

> +               dev_err(&spi_nand->dev, "ecc error on read page!!!\n");
> +               return retval;

So now you always fail no matter what happens?

Please always test your patches :(

> +       }
>  
>         for (i = offset, j = 0; i < len; i++, j++)
>                 wbuf[i] &= buf[j];
> 
> 
> Signed-off-by: Arun Nagendran <arunrasppi@gmail.com>


This has to go up in the changelog area for it to work properly.

thanks,

greg k-h
