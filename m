Received: from 18.mo5.mail-out.ovh.net ([178.33.45.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5vDE-0001d9-Eh
 for linux-mtd@lists.infradead.org; Fri, 28 Sep 2018 16:02:00 +0000
Received: from player728.ha.ovh.net (unknown [10.109.143.246])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 9E7061ECEC5
 for <linux-mtd@lists.infradead.org>; Fri, 28 Sep 2018 18:01:33 +0200 (CEST)
Subject: Re: [RFC/RFT PATCH v1 9/9] mtd: spi: Skip reading the Serial Flash
 Discoverable Parameters
To: Lukasz Majewski <lukma@denx.de>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, boris.brezillon@bootlin.com,
 Mark Rutland <mark.rutland@arm.com>
Cc: yogeshnarayan.gaur@nxp.com, richard@nod.at, broonie@kernel.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 linux-spi@vger.kernel.org, albert.aribaud@3adev.fr,
 prabhakar.kushwaha@nxp.com, linux-mtd@lists.infradead.org,
 david.wolfe@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>, han.xu@nxp.com,
 computersforpeace@gmail.com, Fabio Estevam <festevam@gmail.com>,
 dwmw2@infradead.org
References: <20180926220739.620-1-lukma@denx.de>
 <20180926220739.620-10-lukma@denx.de>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <1a85becb-6cb0-ede4-be0a-2608e8532c9e@wedev4u.fr>
Date: Fri, 28 Sep 2018 18:01:06 +0200
MIME-Version: 1.0
In-Reply-To: <20180926220739.620-10-lukma@denx.de>
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

Hi Lukasz,

Le 27/09/2018 à 00:07, Lukasz Majewski a écrit :
> The fsl-quadspi.c driver is not supporting SPINOR_OP_RDSFDP (0x5a)
> read opcode - in the legacy driver we do read some garbage
> data from AHB mapped area and then return on the first check

If your controller reads garbage then spi_nor_parse_sfdp() fails and exists on the
very first check: signature of the SFDP header. Hence everything should already go on
as if the SPI_NOR_SKIP_SFDP flag is set.

So this patch doesn't change anything for your controller but prevents other controller
from using QSPI protocols like SPI 1-4-4.

This patch introduces a regression for other chips.

Best regards,

Cyrille

> (L2376 @ ./mtd/spi-nor/spi-nor.c)
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 442102be174e..c79b8c33aeeb 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1103,7 +1103,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
> -	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> +	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ | SPI_NOR_SKIP_SFDP) },
>  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
> 
