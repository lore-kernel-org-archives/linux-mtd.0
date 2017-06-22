Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dO2AE-0005lG-3p
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 13:28:52 +0000
Subject: Re: [PATCH] mtd: spi-nor: Add support for Spansion S25FL064L
To: Harry Chou <harryyc.chou@gmail.com>, <cyrille.pitchen@wedev4u.fr>
CC: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>, <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>
References: <1498135998-17788-1-git-send-email-HarryYC.Chou@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Message-ID: <10af97e9-345f-ebc6-1dd9-7d556a366cfa@microchip.com>
Date: Thu, 22 Jun 2017 15:28:26 +0200
MIME-Version: 1.0
In-Reply-To: <1498135998-17788-1-git-send-email-HarryYC.Chou@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Harry,

Le 22/06/2017 à 14:53, Harry Chou a écrit :
> It's an 8 MiB flash with 4 KiB erase sectors.
> 
> Signed-off-by: Harry Chou <HarryYC.Chou@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index dea8c9c..1f84765 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1076,6 +1076,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
>  	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ) },
> +	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128, SECT_4K) },
>

According to the Cypress datasheet, this memory part number supports
Fast Read:
- Dual Output (SPI 1-1-2)
- Dual I/O (SPI 1-2-2)
- Quad Output (SPI 1-1-4)
- Quad I/O (SPI 1-4-4)

http://www.cypress.com/file/316661/download


So you should also add the 2 flags SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ
in addition to SECT_4K and also the flag SPI_NOR_4B_OPCODES since
this part number also supports the 4-byte address instruction set.

Best regards,

Cyrille


>  	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
>  	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
> 
