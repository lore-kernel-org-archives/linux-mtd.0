Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYq0W-0002WN-UO
 for linux-mtd@lists.infradead.org; Sat, 12 Apr 2014 04:57:37 +0000
Received: by mail-pa0-f41.google.com with SMTP id fa1so6252569pad.28
 for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2014 21:57:13 -0700 (PDT)
Date: Sat, 12 Apr 2014 12:57:03 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 11/11] mtd: fsl-quadspi: fix __iomem annotations,
 accessors
Message-ID: <20140412045700.GA1545@localhost.localdomain>
References: <1397242806-7575-1-git-send-email-computersforpeace@gmail.com>
 <1397242806-7575-12-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397242806-7575-12-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Lee Jones <lee.jones@linaro.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 11, 2014 at 12:00:06PM -0700, Brian Norris wrote:
> This corrects some sparse warnings:
> 
>    drivers/mtd/spi-nor/fsl-quadspi.c:281:31: warning: incorrect type in initializer (different address spaces) [sparse]
>    drivers/mtd/spi-nor/fsl-quadspi.c:281:31:    expected void *[noderef] <asn:2>base [sparse]
>    drivers/mtd/spi-nor/fsl-quadspi.c:281:31:    got void [noderef] <asn:2>*iobase [sparse]
>    (etc.)
> 
> and
> 
>    drivers/mtd/spi-nor/fsl-quadspi.c:733:53: warning: incorrect type in argument 2 (different address spaces)
>    drivers/mtd/spi-nor/fsl-quadspi.c:733:53:    expected void const *<noident>
>    drivers/mtd/spi-nor/fsl-quadspi.c:733:53:    got void [noderef] <asn:2>*
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> new in v3
> 
>  drivers/mtd/spi-nor/fsl-quadspi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index b41bbbc531ff..e85046e734e4 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -278,7 +278,7 @@ static irqreturn_t fsl_qspi_irq_handler(int irq, void *dev_id)
>  
>  static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  {
> -	void *__iomem base = q->iobase;
> +	void __iomem *base = q->iobase;
>  	int rxfifo = q->devtype_data->rxfifo;
>  	u32 lut_base;
>  	u8 cmd, addrlen, dummy;
> @@ -422,7 +422,7 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
>  static int
>  fsl_qspi_runcmd(struct fsl_qspi *q, u8 cmd, unsigned int addr, int len)
>  {
> -	void *__iomem base = q->iobase;
> +	void __iomem *base = q->iobase;
thanks for pointing this.

>  	int seqid;
>  	u32 reg, reg2;
>  	int err;
> @@ -730,7 +730,7 @@ static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
>  		return ret;
>  
>  	/* Read out the data directly from the AHB buffer.*/
> -	memcpy(buf, q->ahb_base + q->chip_base_addr + from, len);
> +	memcpy_fromio(buf, q->ahb_base + q->chip_base_addr + from, len);
ARM does some optimazation to the memcpy, please see arch/arm/lib/memcpy.S.

But the memcpy_fromio does not do optimazation, please see _memcpy_fromio.

Someone ever sent a patch to fix the issue, but Russell did not merge it.

please see:
http://lists.infradead.org/pipermail/linux-arm-kernel/2009-November/003860.html

So we'd better do not change to use memcpy_fromio.

BTW: i am okay with other patches about the spi-nor.

thanks
Huang Shijie
