Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1xmu-0004OR-2W
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 16:53:50 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: add support for Gigadevice GD25LQ32
To: Klaus Goger <klaus.goger@theobroma-systems.com>,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
References: <20170913082535.64261-1-klaus.goger@theobroma-systems.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <1c699a55-bf30-757e-cc34-9cdd92cad7d5@wedev4u.fr>
Date: Tue, 10 Oct 2017 18:53:23 +0200
MIME-Version: 1.0
In-Reply-To: <20170913082535.64261-1-klaus.goger@theobroma-systems.com>
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

Le 13/09/2017 à 10:25, Klaus Goger a écrit :
> Tested against GD25LQ32D but the GD25LQ32C datasheet seems to be
> identically feature-wise. Therefore dropping the suffix as it's
> probably only indicating the die revision.
> 
> Signed-off-by: Klaus Goger <klaus.goger@theobroma-systems.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
> 
> ---
> 
> Changes in v2:
> - noticed a typo in the actual patch after hitting send
> 
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index cf1d4a15e10a..e5416374d9d6 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -983,6 +983,11 @@ static const struct flash_info spi_nor_ids[] = {
>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  	},
>  	{
> +		"gd25lq32", INFO(0xc86016, 0, 64 * 1024, 64,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +	},
> +	{
>  		"gd25q64", INFO(0xc84017, 0, 64 * 1024, 128,
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> 
