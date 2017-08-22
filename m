Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkBpX-0001ZG-86
 for linux-mtd@lists.infradead.org; Tue, 22 Aug 2017 16:15:08 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: add support for Microchip sst26vf064b
 QSPI memory
To: Claudiu Beznea <claudiu.beznea@microchip.com>, marek.vasut@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com
References: <1503395476-18730-1-git-send-email-claudiu.beznea@microchip.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <c0b4ff19-b9b9-13bf-72da-f6f747bc6003@wedev4u.fr>
Date: Tue, 22 Aug 2017 18:14:31 +0200
MIME-Version: 1.0
In-Reply-To: <1503395476-18730-1-git-send-email-claudiu.beznea@microchip.com>
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

Le 22/08/2017 à 11:51, Claudiu Beznea a écrit :
> Add support for Microchip sst26vf064b QSPI memory.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
> ---
> Changes since v1:
> - use 64K sector size; changing the sector size the number of sectors
> was changed to 128
> 
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 196b52f..09515be 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1081,6 +1081,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
>  	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
>  	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
> +	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  
>  	/* ST Microelectronics -- newer production may have feature updates */
>  	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
> 
