Date: Thu, 7 Nov 2013 00:39:32 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: fix bug driver will in a dead lock if
 no nand detected
Message-ID: <20131107083932.GJ3805@norris.computersforpeace.net>
References: <1383645547-21813-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383645547-21813-1-git-send-email-josh.wu@atmel.com>
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Josh,

On Tue, Nov 05, 2013 at 05:59:07PM +0800, Josh Wu wrote:
> In the atmel driver probe function, the code shows like following:
>   atmel_nand_probe(...) {
>         ...
> 
>   err_nand_ioremap:
>         platform_driver_unregister(&atmel_nand_nfc_driver);
>         return res;
>   }
> 
> If no nand flash detected, the driver probe function will goto
> err_nand_ioremap label.
> Then platform_driver_unregister() will be called. It will get the
> lock of atmel_nand device since it is parent of nfc_device. The
> problem is the lock is already hold by atmel_nand_probe itself.
> So system will be in a dead lock.
> 
> This patch just simply removed to platform_driver_unregister() call.
> When atmel_nand driver is quit the platform_driver_unregister() will
> be called in atmel_nand_remove().

The real key, here, is that the platform-driver probe() has no business
un-registering another driver, right? Shouldn't both drivers just be
registered/unregistered in the module init/exit, and not in probe()?

Also, should this be marked for -stable?

> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> ---
>  drivers/mtd/nand/atmel_nand.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index ef9c9f5..469d4e2 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -2142,7 +2142,6 @@ err_no_card:
>  	if (host->dma_chan)
>  		dma_release_channel(host->dma_chan);
>  err_nand_ioremap:
> -	platform_driver_unregister(&atmel_nand_nfc_driver);
>  	return res;
>  }
>  

Brian
