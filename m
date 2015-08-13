Message-ID: <55CC44CC.4060707@ti.com>
Date: Thu, 13 Aug 2015 10:18:36 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: <tony@atomide.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <ezequiel@vanguardiasur.com.ar>, <javier@dowhile0.org>,
 <fcooper@ti.com>, <nsekhar@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/22] mtd: nand: omap2: Switch to using GPMC-NAND
 ops for writebuffer empty check
References: <1438938752-31010-1-git-send-email-rogerq@ti.com>
 <1438938752-31010-7-git-send-email-rogerq@ti.com>
In-Reply-To: <1438938752-31010-7-git-send-email-rogerq@ti.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 07/08/15 12:12, Roger Quadros wrote:
> Instead of accessing the gpmc_status register directly start
> using the gpmc_nand_ops->nand_writebuffer_empty() helper
> to check write buffer empty status.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  drivers/mtd/nand/omap2.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index f214fe2..5c2f6df 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -289,15 +289,11 @@ static void omap_write_buf8(struct mtd_info *mtd, const u_char *buf, int len)
>  	struct omap_nand_info *info = container_of(mtd,
>  						struct omap_nand_info, mtd);
>  	u_char *p = (u_char *)buf;
> -	u32	status = 0;
>  
>  	while (len--) {
>  		iowrite8(*p++, info->nand.IO_ADDR_W);
>  		/* wait until buffer is available for write */
> -		do {
> -			status = readl(info->reg.gpmc_status) &
> -					STATUS_BUFF_EMPTY;
> -		} while (!status);
> +		while (info->ops->nand_writebuffer_empty());

This should be
		while (!info->ops->nand_writebuffer_empty());

>  	}
>  }
>  
> @@ -325,17 +321,13 @@ static void omap_write_buf16(struct mtd_info *mtd, const u_char * buf, int len)
>  	struct omap_nand_info *info = container_of(mtd,
>  						struct omap_nand_info, mtd);
>  	u16 *p = (u16 *) buf;
> -	u32	status = 0;
>  	/* FIXME try bursts of writesw() or DMA ... */
>  	len >>= 1;
>  
>  	while (len--) {
>  		iowrite16(*p++, info->nand.IO_ADDR_W);
>  		/* wait until buffer is available for write */
> -		do {
> -			status = readl(info->reg.gpmc_status) &
> -					STATUS_BUFF_EMPTY;
> -		} while (!status);
> +		while (info->ops->nand_writebuffer_empty());

here as well.

>  	}
>  }
>  
> 

cheers,
-roger
