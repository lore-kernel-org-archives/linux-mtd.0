Received: from mo2.mail-out.ovh.net ([178.32.228.2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clNKl-0008Si-C0
 for linux-mtd@lists.infradead.org; Tue, 07 Mar 2017 22:11:58 +0000
Received: from player718.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 4FE465D96C
 for <linux-mtd@lists.infradead.org>; Tue,  7 Mar 2017 23:11:28 +0100 (CET)
Subject: Re: [PATCH v3] mtd: spi-nor: Add support for N25Q256A13
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>,
 linux-mtd@lists.infradead.org
References: <1488422554-7644-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Jagan Teki <jagan@openedev.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <a6888235-c6be-53f3-7787-7fafcb56b8b4@wedev4u.fr>
Date: Tue, 7 Mar 2017 23:11:22 +0100
MIME-Version: 1.0
In-Reply-To: <1488422554-7644-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nobuhiro,

Le 02/03/2017 à 03:42, Nobuhiro Iwamatsu a écrit :
> Add new Micron N25Q256A (N25Q256A13) 256Mbit NOR Flash in the list
                            ^
You mean N25Q256A11, don't you? Otherwise it's not consistent with the
actual patch!

> of supported devices. This chip has the same structure as the N25Q256A
> but ID and voltage (1V8) to use is different. Therefore, this adds
> N25Q256A13 as n25q256ax1.

  ^
N25Q256A11 as n25q256ax1

> 
> In the future, for new Micron memories we could use the patterns
> "n25q*ax1" for 1V8 and "n25q*ax3" for 3V3 memories.
> 

Sound like a good idea :)
Marek, do you agree with that?

Best regards,

Cyrille

> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
> CC: Jagan Teki <jagan@openedev.com>
> CC: Marek Vasut <marek.vasut@gmail.com>
> CC: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 1ae872bfc3ba..2e02991d93aa 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1031,6 +1031,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
> +	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
> 
