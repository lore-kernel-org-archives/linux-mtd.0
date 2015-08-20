Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSXn3-0004Ys-Lu
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 21:54:30 +0000
Received: by pacdd16 with SMTP id dd16so28403528pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 20 Aug 2015 14:54:08 -0700 (PDT)
Date: Thu, 20 Aug 2015 14:54:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 03/18] mtd: dataflash: Export OF module alias information
Message-ID: <20150820215404.GA81844@google.com>
References: <1440054451-1223-1-git-send-email-javier@osg.samsung.com>
 <1440054451-1223-4-git-send-email-javier@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440054451-1223-4-git-send-email-javier@osg.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 20, 2015 at 09:07:16AM +0200, Javier Martinez Canillas wrote:
> The SPI core always reports the MODALIAS uevent as "spi:<modalias>"
> regardless of the mechanism that was used to register the device
> (i.e: OF or board code) and the table that is used later to match
> the driver with the device (i.e: SPI id table or OF match table).
> 
> So drivers needs to export the SPI id table and this be built into
> the module or udev won't have the necessary information to autoload
> the needed driver module when the device is added.
> 
> But this means that OF-only drivers needs to have both OF and SPI id
> tables that have to be kept in sync and also the dev node compatible
> manufacturer prefix is stripped when reporting the MODALIAS. Which can
> lead to issues if two vendors use the same SPI device name for example.
> 
> To avoid the above, the SPI core behavior may be changed in the future
> to not require an SPI device table for OF-only drivers and report the
> OF module alias. So, it's better to also export the OF table even when
> is unused now to prevent breaking module loading when the core changes.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

I appreciate the context for the whole problem here, but this commit
subject mostly doesn't apply to this driver, and it deson't seem to
match the problem this is solving. As I see it, the patch description
for this patch should be more like:

  "The OF ID table is used for auto-probing the device, but it is not
  exported to the module device table. That means this driver won't
  autoload when built as a module.

  Export the OF ID table to fix that.

  (insert some reference to the larger issue here)"

Do you want to rewrite the message, shall I just prepend my
modifications, or am I off-base?

> ---
> 
>  drivers/mtd/devices/mtd_dataflash.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
> index 0099aba72a8b..df6f61137376 100644
> --- a/drivers/mtd/devices/mtd_dataflash.c
> +++ b/drivers/mtd/devices/mtd_dataflash.c
> @@ -102,6 +102,7 @@ static const struct of_device_id dataflash_dt_ids[] = {
>  	{ .compatible = "atmel,dataflash", },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, dataflash_dt_ids);
>  #endif
>  
>  /* ......................................................................... */

For the patch:

Reviewed-by: Brian Norris <computersforpeace@gmail.com>
