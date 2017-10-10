Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1xcX-0007v6-06
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 16:43:06 +0000
Subject: Re: [PATCH v7 2/2] mtd: spi-nor: add support for GD25Q256
To: Andy Yan <andy.yan@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, computersforpeace@gmail.com, richard@nod.at,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
References: <1503885646-25401-1-git-send-email-andy.yan@rock-chips.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <bb2fa4c2-2dd0-17ce-0084-ba9eab3c161e@wedev4u.fr>
Date: Tue, 10 Oct 2017 18:42:42 +0200
MIME-Version: 1.0
In-Reply-To: <1503885646-25401-1-git-send-email-andy.yan@rock-chips.com>
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

Le 28/08/2017 à 04:00, Andy Yan a écrit :
> Add support for GD25Q256, a 32MiB SPI Nor flash
> from GigaDevice.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
> ---
> 
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/mtd/spi-nor/spi-nor.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 3b94308..dc89ef2 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -872,6 +872,8 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	return ret;
>  }
>  
> +static int macronix_quad_enable(struct spi_nor *nor);
> +
>  /* Used when the "_ext_id" is two bytes at most */
>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
>  		.id = {							\
> @@ -999,6 +1001,12 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  	},
> +	{
> +		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +			.quad_enable = macronix_quad_enable,
> +	},
>  
>  	/* Intel/Numonyx -- xxxs33b */
>  	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
> 
