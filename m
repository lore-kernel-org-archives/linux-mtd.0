Received: from mail-qc0-x230.google.com ([2607:f8b0:400d:c01::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9g0X-0008OL-RC
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 20:18:11 +0000
Received: by mail-qc0-f176.google.com with SMTP id i17so11013480qcy.7
 for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2015 12:17:47 -0800 (PST)
Date: Fri, 9 Jan 2015 12:17:43 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150109201743.GW9759@ld-irv-0074>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
 <1420626727-6929-2-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420626727-6929-2-git-send-email-festevam@gmail.com>
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

OK, I still don't think you've got things right here.

Are you testing this with a two-flash system? What sort of tests?

On Wed, Jan 07, 2015 at 08:32:07AM -0200, Fabio Estevam wrote:
...
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 20cffd2..ddb955a 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -661,7 +661,7 @@ MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
>  
>  static void fsl_qspi_set_base_addr(struct fsl_qspi *q, struct spi_nor *nor)
>  {
> -	q->chip_base_addr = q->nor_size * (nor - q->nor);
> +	q->chip_base_addr = q->nor_size * q->nor_num;

This function is called from the 'prepare' function, so it may be called
for *different* NOR devices, and it's called for each flash transaction,
not just at boot time. Now, you're making the base address into a fixed
constant for all NOR flashes attached to this controller. That's wrong.

So you need an index associated with each NOR, not just the "total
number of NOR flash" (i.e., q->nor_size). That's currently satisfied by
the pointer subtraction on the ->nor[] array.

>  }
>  
>  static int fsl_qspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
...

Brian
