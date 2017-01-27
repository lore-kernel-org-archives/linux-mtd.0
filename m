Received: from mail-wm0-f66.google.com ([74.125.82.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWyWE-0007g2-Q8
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2017 04:52:16 +0000
Received: by mail-wm0-f66.google.com with SMTP id r126so55337451wmr.3
 for <linux-mtd@lists.infradead.org>; Thu, 26 Jan 2017 20:51:53 -0800 (PST)
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for N25Q256A13 as N25Q256A
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>,
 linux-mtd@lists.infradead.org
References: <1485481897-6368-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
Cc: Jagan Teki <jagan@openedev.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <51bf7fc6-cddb-3f3b-007d-17154082104d@gmail.com>
Date: Fri, 27 Jan 2017 05:49:59 +0100
MIME-Version: 1.0
In-Reply-To: <1485481897-6368-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/27/2017 02:51 AM, Nobuhiro Iwamatsu wrote:
> Add new Micron N25Q256A (N25Q256A13) 256Mbit NOR Flash in the list
> of supported devices. This chip has the same structure as the N25Q256A
> but ID is different. And this fixes N25Q256A to N25Q256 to fit chip
> name to other n25q chip names.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
> CC: Jagan Teki <jagan@openedev.com>
> CC: Marek Vasut <marek.vasut@gmail.com>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index da7cd69d4857..a2a6922e356f 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -887,7 +887,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
> -	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
> +	{ "n25q256",     INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
> +	{ "n25q256a",    INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
> 


-- 
Best regards,
Marek Vasut
