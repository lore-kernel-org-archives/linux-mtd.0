Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcfBB-0005ph-HG
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 21:58:20 +0000
Subject: Re: [PATCH] mtd: spi-nor: add support for Microchip sst26vf064b QSPI
 memory
To: Claudiu Beznea <claudiu.beznea@microchip.com>, marek.vasut@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com
References: <1501234898-13171-1-git-send-email-claudiu.beznea@microchip.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <46bc0f6f-30ad-6367-a960-08cf7262e741@wedev4u.fr>
Date: Tue, 1 Aug 2017 23:57:49 +0200
MIME-Version: 1.0
In-Reply-To: <1501234898-13171-1-git-send-email-claudiu.beznea@microchip.com>
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

Hi Claudiu,

Le 28/07/2017 à 11:41, Claudiu Beznea a écrit :
> Add support for Microchip sst26vf064b QSPI memory.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 196b52f..796aac4 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1081,6 +1081,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
>  	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
>  	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
> +	{ "sst26vf064b", INFO(0xbf2643, 0,  4 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

I don't know what to do in this case; Marek any advice?

The issue is that Microchip SST26 memories are uniform for the 4K erase
sector size but not uniform for other sector sizes (32K, 64K, ...).

Like this, erase operations would work if
CONFIG_MTD_SPI_NOR_USE_4K_SECTOR is defined because then the 20h/21h
opcodes would be used in any case.

However when the former macro is undefined, the D8h/DCh opcodes would be
used instead. Hence erasing sectors in the middle of the memory would
not work as expected because nor->mtd.erasesize == 4 * 1024 but the
actual erase size of middle erase blocks/sectors is bigger: you may
erase more than expected.

Marek, do you think we could take this patch as is, with the known
limitations, and wait for a later patch dealing with non-uniform erase
sector map to fix them?

Also, nor->mtd.erasesize is used by above mtd layer like UBIFS to decide
the size of the Physical and Logical Erase Bloc size. Not sure if this
is still true now but I had troubles the last time I've tried to create
a UBI file-system with a spi-nor memory using a 4K erase sector size

http://lists.infradead.org/pipermail/linux-mtd/2013-July/047665.html

Best regards,

Cyrille


>  
>  	/* ST Microelectronics -- newer production may have feature updates */
>  	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
> 
