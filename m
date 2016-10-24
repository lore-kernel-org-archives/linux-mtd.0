Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bynZe-0006o6-Fj
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 22:18:31 +0000
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 8/9] mtd: spi-nor: add support to Macronix mx66l1g45g
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
References: <cover.1477325128.git.cyrille.pitchen@atmel.com>
 <4db277dccf52acd48e592d9f285724aab70704d1.1477325128.git.cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-kernel@vger.kernel.org
Message-ID: <b043147d-cc39-9238-c6e7-432af67f684e@denx.de>
Date: Tue, 25 Oct 2016 00:16:59 +0200
MIME-Version: 1.0
In-Reply-To: <4db277dccf52acd48e592d9f285724aab70704d1.1477325128.git.cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/24/2016 06:34 PM, Cyrille Pitchen wrote:
> This patch adds an entry in the spi_nor_ids[] table to add support
> to the Macronix mx66l1g45g.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index db4874d4af79..eb21d3d4e4e6 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -937,6 +937,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>  	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
> +	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>  
>  	/* Micron */
> 
This should be submitted separately as it could be applied right away.

-- 
Best regards,
Marek Vasut
