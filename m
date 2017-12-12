Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOkTV-0008FR-KC
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 13:19:59 +0000
Subject: Re: [PATCHv3 2/2] mtd: m25p80: restore the status of SPI flash when
 exiting
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at
References: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
 <20171206025342.7266-3-Zhiqiang.Hou@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <f5eb3dfe-0b3e-4224-8bf2-9567918d30cc@wedev4u.fr>
Date: Tue, 12 Dec 2017 14:19:31 +0100
MIME-Version: 1.0
In-Reply-To: <20171206025342.7266-3-Zhiqiang.Hou@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 06/12/2017 à 03:53, Zhiqiang Hou a écrit :
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Restore the status to be compatible with legacy devices.
> Take Freescale eSPI boot for example, it copies (in 3 Byte
> addressing mode) the RCW and bootloader images from SPI flash
> without firing a reset signal previously, so the reboot command
> will fail without reseting the addressing mode of SPI flash.
resetting

> This patch implement .shutdown function to restore the status
implements
> in reboot process, and add the same operation to the .remove
> function.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!

(corrected few mistakes in the commit message)
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
> 
