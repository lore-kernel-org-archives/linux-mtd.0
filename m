Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKh9H-0000AJ-DO
 for linux-mtd@lists.infradead.org; Fri, 01 Dec 2017 08:58:20 +0000
Subject: Re: [PATCH 2/2] mtd: m25p80: restore the addressing mode when stop
 using the flash
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at
References: <20171124100848.1828-1-Zhiqiang.Hou@nxp.com>
 <20171124100848.1828-3-Zhiqiang.Hou@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <b21e0615-9a64-7dc5-cbb2-f391a640273d@wedev4u.fr>
Date: Fri, 1 Dec 2017 09:57:44 +0100
MIME-Version: 1.0
In-Reply-To: <20171124100848.1828-3-Zhiqiang.Hou@nxp.com>
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

Hi Hou,

Le 24/11/2017 à 11:08, Zhiqiang Hou a écrit :
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Add .shutdown function to restore the addressing mode in reboot
> process, and add the same operation to the .remove function.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
>  drivers/mtd/devices/m25p80.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index dbe6a1de2bb8..867bd2d5a267 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -307,10 +307,17 @@ static int m25p_remove(struct spi_device *spi)
>  {
>  	struct m25p	*flash = spi_get_drvdata(spi);
>  
> +	spi_nor_restore_addr_mode(&flash->spi_nor);

maybe add a new line here.

Otherwise, this looks good :)

Best regards,

Cyrille

>  	/* Clean up MTD stuff. */
>  	return mtd_device_unregister(&flash->spi_nor.mtd);
>  }
>  
> +static void m25p_shutdown(struct spi_device *spi)
> +{
> +	struct m25p *flash = spi_get_drvdata(spi);
> +
> +	spi_nor_restore_addr_mode(&flash->spi_nor);
> +}
>  /*
>   * Do NOT add to this array without reading the following:
>   *
> @@ -386,6 +393,7 @@ static struct spi_driver m25p80_driver = {
>  	.id_table	= m25p_ids,
>  	.probe	= m25p_probe,
>  	.remove	= m25p_remove,
> +	.shutdown	= m25p_shutdown,
>  
>  	/* REVISIT: many of these chips have deep power-down modes, which
>  	 * should clearly be entered on suspend() to minimize power use.
> 
