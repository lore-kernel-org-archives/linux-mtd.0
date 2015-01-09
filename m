Received: from mail-qa0-x22f.google.com ([2607:f8b0:400d:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9g9Q-0003dh-5u
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 20:27:20 +0000
Received: by mail-qa0-f47.google.com with SMTP id f12so3608370qad.6
 for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2015 12:26:58 -0800 (PST)
Date: Fri, 9 Jan 2015 12:26:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: fsl-quadspi: Call fsl_qspi_set_base_addr
 after nor_size is set
Message-ID: <20150109202654.GX9759@ld-irv-0074>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420626727-6929-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 shijie8@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 07, 2015 at 08:32:06AM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> fsl_qspi_set_base_addr() uses nor_size information, but it is called prior to
> the initialization of nor_size.
> 
> Fix it by calling fsl_qspi_set_base_addr() after nor_size is configured.

This patch doesn't look correct either. But then, the original driver
seems confusing too.

Huang, is this driver assuming that all flashes on this controller will
be the same size? Or maybe I'm not understanding your MMIO layout. But I
notice that 'nor_size' is shared between all NOR instances on this
controller. And for that matter, I don't see any locking. Are you sure
this driver is safe for multiple flash instances?

> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
> Changes since v2:
> - Newly introduced in this version
> 
>  drivers/mtd/spi-nor/fsl-quadspi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 39763b9..20cffd2 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -897,9 +897,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  		if (ret < 0)
>  			goto map_failed;
>  
> -		/* set the chip address for READID */
> -		fsl_qspi_set_base_addr(q, nor);
> -
>  		ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
>  		if (ret)
>  			goto map_failed;
> @@ -917,6 +914,9 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  			fsl_qspi_set_map_addr(q);
>  		}
>  
> +		/* set the chip address for READID */

OK, so this is to get READID correct... but you're doing this after
READID. So is this for configuring the *next* flash? I'm confused.

> +		fsl_qspi_set_base_addr(q, nor);
> +
>  		/*
>  		 * The TX FIFO is 64 bytes in the Vybrid, but the Page Program
>  		 * may writes 265 bytes per time. The write is working in the

I don't think I want to take any of these patches until I get a clearer
picture of who/what/how you're testing these, and I get an ack from
Huang (or someone else who is going to be the de factor / official
maintianer of this driver, since I note that Huang is no longer with
Freescale).

BTW, do we want a MAINTAINERS entry for this driver?

Brian
