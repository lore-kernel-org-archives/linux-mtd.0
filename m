Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8mFC-0005JS-Cl
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 08:45:34 +0000
Received: by mail-pa0-f52.google.com with SMTP id eu11so3457683pac.11
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 00:45:13 -0800 (PST)
Date: Wed, 7 Jan 2015 00:45:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150107084510.GK7112@brian-ubuntu>
References: <1420599927-32385-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420599927-32385-1-git-send-email-festevam@gmail.com>
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

On Wed, Jan 07, 2015 at 01:05:27AM -0200, Fabio Estevam wrote:
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 39763b9..8cdd73f 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
...
> @@ -661,7 +661,7 @@ MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
>  
>  static void fsl_qspi_set_base_addr(struct fsl_qspi *q, struct spi_nor *nor)
>  {
> -	q->chip_base_addr = q->nor_size * (nor - q->nor);
> +	q->chip_base_addr += (q->nor_size * 2);

This doesn't look right to me...

Recall there is one struct fsl_qspi that maps to several struct spi_nor.
This function gets called several times, so it'll be incrementing this
every time. It probably just happens to work once for you.

>  }
>  
>  static int fsl_qspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)

Brian
