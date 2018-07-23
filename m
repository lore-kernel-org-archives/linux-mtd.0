Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhfLS-0001T7-4B
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 18:14:07 +0000
Received: by mail-pg1-x542.google.com with SMTP id k3-v6so943332pgq.5
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2018 11:13:55 -0700 (PDT)
Date: Mon, 23 Jul 2018 11:13:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCHv3 2/2] mtd: m25p80: restore the status of SPI flash when
 exiting
Message-ID: <20180723181350.GA58212@ban.mtv.corp.google.com>
References: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
 <20171206025342.7266-3-Zhiqiang.Hou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171206025342.7266-3-Zhiqiang.Hou@nxp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I noticed this got merged, but I wanted to put my 2 cents in here:

On Wed, Dec 06, 2017 at 10:53:42AM +0800, Zhiqiang Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Restore the status to be compatible with legacy devices.
> Take Freescale eSPI boot for example, it copies (in 3 Byte
> addressing mode) the RCW and bootloader images from SPI flash
> without firing a reset signal previously, so the reboot command
> will fail without reseting the addressing mode of SPI flash.
> This patch implement .shutdown function to restore the status
> in reboot process, and add the same operation to the .remove
> function.

We have previously rejected this patch multiple times, because the above
comment demonstrates a broken product. You cannot guarantee that all
reboots will invoke the .shutdown() method -- what about crashes? What
about watchdog resets? IIUC, those will hit the same broken behavior,
and have unexepcted behavior in your bootloader.

I suppose one could argue for doing this in remove(), but AIUI you're
just papering over system bugs by introducing the shutdown() function
here. Thus, I'd prefer we drop the shutdown() method to avoid misleading
other users of this driver.

Brian

> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V3:
>  - Modified the commit to make this patch specific.
> 
>  drivers/mtd/devices/m25p80.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index dbe6a1de2bb8..a4e18f6aaa33 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -307,10 +307,18 @@ static int m25p_remove(struct spi_device *spi)
>  {
>  	struct m25p	*flash = spi_get_drvdata(spi);
>  
> +	spi_nor_restore(&flash->spi_nor);
> +
>  	/* Clean up MTD stuff. */
>  	return mtd_device_unregister(&flash->spi_nor.mtd);
>  }
>  
> +static void m25p_shutdown(struct spi_device *spi)
> +{
> +	struct m25p *flash = spi_get_drvdata(spi);
> +
> +	spi_nor_restore(&flash->spi_nor);
> +}
>  /*
>   * Do NOT add to this array without reading the following:
>   *
> @@ -386,6 +394,7 @@ static struct spi_driver m25p80_driver = {
>  	.id_table	= m25p_ids,
>  	.probe	= m25p_probe,
>  	.remove	= m25p_remove,
> +	.shutdown	= m25p_shutdown,
>  
>  	/* REVISIT: many of these chips have deep power-down modes, which
>  	 * should clearly be entered on suspend() to minimize power use.
> -- 
> 2.14.1
> 
