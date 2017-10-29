Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e8sQx-00037v-IR
 for linux-mtd@lists.infradead.org; Sun, 29 Oct 2017 18:35:45 +0000
Subject: Re: [PATCH 2/2] mtd: spi-nor: add GigaDevice gd25q512
To: Roman Yeryomin <leroi.lists@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <1505685289-5042-1-git-send-email-roman@advem.lv>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <41abf0de-724d-db43-a470-ea86044ba029@wedev4u.fr>
Date: Sun, 29 Oct 2017 19:35:17 +0100
MIME-Version: 1.0
In-Reply-To: <1505685289-5042-1-git-send-email-roman@advem.lv>
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

Hi Roman,

+ Marek

please add spi-nor maintainers in CC when submitting spi-nor patches.

Le 17/09/2017 à 23:54, Roman Yeryomin a écrit :
> Signed-off-by: Roman Yeryomin <roman@advem.lv>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 1d0e114..a6e56f4 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -984,6 +984,11 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  	},
> +	{
> +		"gd25q512", INFO(0xc84020, 0, 64 * 1024, 1024,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4B_OPCODES)
> +	},

According to the datasheet found of the Gigadevice web site for GD25Q512
(JEDEC ID C84020), the Quad Enable (QE) bit of this memory part is
BIT(6) of the Status Register 1 hence you must set .quad_enable =
macronix_quad_enable otherwise spansion_quad_enable() would be called
instead but this latest function is suited only when the QE bit is
BIT(1) of the Status Register 2, like for older Gigadevice memory parts.

Please have a look at the gd25q256 entry as an example.

Best regards,

Cyrille

>  	/* Intel/Numonyx -- xxxs33b */
>  	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
> 
