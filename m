Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKh4F-0006Rt-0f
 for linux-mtd@lists.infradead.org; Fri, 01 Dec 2017 08:53:09 +0000
Subject: Re: [PATCH 1/2] mtd: spi-nor: add a API to restore the addressing mode
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at
References: <20171124100848.1828-1-Zhiqiang.Hou@nxp.com>
 <20171124100848.1828-2-Zhiqiang.Hou@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <4b25f639-e386-21b6-0d66-fda0b3093064@wedev4u.fr>
Date: Fri, 1 Dec 2017 09:52:37 +0100
MIME-Version: 1.0
In-Reply-To: <20171124100848.1828-2-Zhiqiang.Hou@nxp.com>
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

Le 24/11/2017 à 11:08, Zhiqiang Hou a écrit :
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> It's better to restore the addressing mode of the SPI flash
> whenever remove the driver or reboot the system.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 8 ++++++++
>  include/linux/mtd/spi-nor.h   | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index bc266f70a15b..801cbe99b059 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2713,6 +2713,14 @@ static void spi_nor_resume(struct mtd_info *mtd)
>  		dev_err(dev, "resume() failed\n");
>  }
>  
> +void spi_nor_restore_addr_mode(struct spi_nor *nor)
> +{
> +	if ((nor->addr_width == 4) &&
> +	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
> +	    !(nor->info->flags & SPI_NOR_4B_OPCODES))
> +		set_4byte(nor, nor->info, 0);
> +}
+ EXPORT_SYMBOL_GPL(spi_nor_restore_addr_mode);

Like for spi_nor_scan(), you would need to export the symbol for modules.

> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps)
>  {
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index d0c66a0975cf..fe9357da2049 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -398,5 +398,6 @@ struct spi_nor_hwcaps {
>   */
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps);
> +void spi_nor_restore_addr_mode(struct spi_nor *nor);
>
Please add the relevant kernel doc.

Best regards,

Cyrille

>  #endif
> 
