Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eRgJF-0007I8-8R
 for linux-mtd@lists.infradead.org; Wed, 20 Dec 2017 15:29:31 +0000
Subject: Re: [PATCHv3 1/2] mtd: spi-nor: add support for is25lq040b
To: Sean Nyekjaer <sean.nyekjaer@prevas.dk>, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com
References: <20171215073332.10965-1-sean.nyekjaer@prevas.dk>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <87f9273d-3eb3-fcf6-b2f0-a2b674e6a283@wedev4u.fr>
Date: Wed, 20 Dec 2017 16:29:15 +0100
MIME-Version: 1.0
In-Reply-To: <20171215073332.10965-1-sean.nyekjaer@prevas.dk>
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

Le 15/12/2017 à 08:33, Sean Nyekjaer a écrit :
> Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>

Applied to the spi-nor/next branch of linux-mtd

Thanks!

> ---
> v3:
>  - this spi-nor is 4Mbit or 512KB
>  - readded SECT_4K as per Cyrille comments
>  - spi-nor supports fast read dual and quad
> 
> v2:
>  - removed SECT_4K as the chip are supporting 32K and bulk erase
> 
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 9178139a39d0..f7676aa50ce6 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1046,6 +1046,8 @@ static const struct flash_info spi_nor_ids[] = {
>  
>  	/* ISSI */
>  	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
> +	{ "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,  8,
> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25lp128", INFO(0x9d6018, 0, 64 * 1024, 256,
>  			SECT_4K | SPI_NOR_DUAL_READ) },
>  
> 
