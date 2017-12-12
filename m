Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOkN0-0005SU-Dr
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 13:13:16 +0000
Subject: Re: [PATCHv3 1/2] mtd: spi-nor: add an API to restore the status of
 SPI flash chip
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at
References: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
 <20171206025342.7266-2-Zhiqiang.Hou@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <8bd50793-6f45-b01c-b230-14d02551be64@wedev4u.fr>
Date: Tue, 12 Dec 2017 14:12:47 +0100
MIME-Version: 1.0
In-Reply-To: <20171206025342.7266-2-Zhiqiang.Hou@nxp.com>
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
> Add this API to restore the status of SPI flash chip to the default
> such as addressing mode, whenever detach the driver from device or
> reboot the system.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!

(Fixed the kernel doc, see below)
> ---
> V3:
>  - no change.
> 
>  Documentation/mtd/spi-nor.txt |  3 +++
>  drivers/mtd/spi-nor/spi-nor.c | 10 ++++++++++
>  include/linux/mtd/spi-nor.h   |  6 ++++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/Documentation/mtd/spi-nor.txt b/Documentation/mtd/spi-nor.txt
> index 548d6306ebca..da1fbff5a24c 100644
> --- a/Documentation/mtd/spi-nor.txt
> +++ b/Documentation/mtd/spi-nor.txt
> @@ -60,3 +60,6 @@ The main API is spi_nor_scan(). Before you call the hook, a driver should
>  initialize the necessary fields for spi_nor{}. Please see
>  drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to fsl-quadspi.c
>  when you want to write a new driver for a SPI NOR controller.
> +Another API is spi_nor_restore(), this is used to restore the status of SPI
> +flash chip such as addressing mode. Call it whenever detach the driver from
> +device or reboot the system.
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index bc266f70a15b..4a925378d434 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2713,6 +2713,16 @@ static void spi_nor_resume(struct mtd_info *mtd)
>  		dev_err(dev, "resume() failed\n");
>  }
>  
> +void spi_nor_restore(struct spi_nor *nor)
> +{
> +	/* restore the addressing mode */
> +	if ((nor->addr_width == 4) &&
> +	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
> +	    !(nor->info->flags & SPI_NOR_4B_OPCODES))
> +		set_4byte(nor, nor->info, 0);
> +}
> +EXPORT_SYMBOL_GPL(spi_nor_restore);
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps)
>  {
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index d0c66a0975cf..0a182c3d0884 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -399,4 +399,10 @@ struct spi_nor_hwcaps {
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps);
>  
> +/*
Should start with /**

;)
> + * spi_nor_restore_addr_mode() - restore the status of SPI NOR
> + * @nor:	the spi_nor structure
> + */
> +void spi_nor_restore(struct spi_nor *nor);
> +
>  #endif
> 
