Date: Wed, 12 Feb 2014 12:42:00 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] MTD: atmel_nand: POI fall back is not an issue: change
 log level
Message-ID: <20140212114200.GA11498@piout.net>
References: <1392204414-20700-1-git-send-email-nicolas.ferre@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1392204414-20700-1-git-send-email-nicolas.ferre@atmel.com>
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Josh Wu <josh.wu@atmel.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Small nitpick, subject should read PIO, not POI.

On 12/02/2014 at 12:26:54 +0100, Nicolas Ferre wrote :
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---
>  drivers/mtd/nand/atmel_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index c36e9b84487c..8d210f8a072d 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -430,7 +430,7 @@ err_dma:
>  	dma_unmap_single(dma_dev->dev, phys_addr, len, dir);
>  err_buf:
>  	if (err != 0)
> -		dev_warn(host->dev, "Fall back to CPU I/O\n");
> +		dev_dbg(host->dev, "Fall back to CPU I/O\n");
>  	return err;
>  }
>  
> -- 
> 1.8.2.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
