Received: from 10.mo173.mail-out.ovh.net ([46.105.74.148])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDPcf-0002ue-Az
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 07:55:06 +0000
Received: from player732.ha.ovh.net (unknown [10.109.160.244])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 064F5DC938
 for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2018 09:54:42 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Use 4B opcodes when the NOR
 advertises both 3B and 4B
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <20181018115512.15131-1-boris.brezillon@bootlin.com>
 <20181018115512.15131-2-boris.brezillon@bootlin.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <60bca262-2cde-ef96-4a54-72b6c30b6de0@wedev4u.fr>
Date: Fri, 19 Oct 2018 09:54:30 +0200
MIME-Version: 1.0
In-Reply-To: <20181018115512.15131-2-boris.brezillon@bootlin.com>
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



Le 18/10/2018 à 13:55, Boris Brezillon a écrit :
> When the NOR supports 4 bytes opcodes we should use those instead of
> switching the flash in 4-bytes mode. This way, we don't have to restore
> the addressing mode when resetting the board.
> 
> Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Reviewed-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v2:
> - None
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 9155d3b9c37b..72536a5dfe05 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2643,6 +2643,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		break;
>  
>  	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
> +	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
>  		nor->flags |= SNOR_F_4B_OPCODES;
>  		nor->addr_width = 4;
>  		break;
> 
