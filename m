Received: from 7.mo179.mail-out.ovh.net ([46.105.61.94])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPbGg-0007xO-Hg
 for linux-mtd@lists.infradead.org; Mon, 26 Jun 2017 21:10:00 +0000
Received: from player794.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 018A94E2C4
 for <linux-mtd@lists.infradead.org>; Mon, 26 Jun 2017 23:09:33 +0200 (CEST)
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for Spansion S25FL064L
To: Harry Chou <harryyc.chou@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1498161491-22411-1-git-send-email-HarryYC.Chou@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <e04dd4cf-efbf-82c8-d6b0-6d9336f2a603@wedev4u.fr>
Date: Mon, 26 Jun 2017 23:09:26 +0200
MIME-Version: 1.0
In-Reply-To: <1498161491-22411-1-git-send-email-HarryYC.Chou@gmail.com>
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

Le 22/06/2017 à 21:58, Harry Chou a écrit :
> It's an 8 MiB flash with 4 KiB erase sectors.
> 
> Signed-off-by: Harry Chou <HarryYC.Chou@gmail.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!

> ---
> Changes v1 -> v2:
>  - added SPI_NOR_DUAL_READ flag (supports Dual Output and I/O)
>  - added SPI_NOR_QUAD_READ flag (supports Quad Output and I/O)
>  - added SPI_NOR_4B_OPCODES flag (supports the 4-byte address instruction set)
> 
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index dea8c9c..9db5861 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1076,6 +1076,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
>  	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ) },
> +	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  
>  	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
>  	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
> 
