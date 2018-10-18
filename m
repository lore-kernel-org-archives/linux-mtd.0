Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDAPM-0005Tc-Fl
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 15:41:54 +0000
Date: Thu, 18 Oct 2018 17:40:09 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Use 4B opcodes when the NOR
 advertises both 3B and 4B
Message-ID: <20181018154009.GG17341@piout.net>
References: <20181018115512.15131-1-boris.brezillon@bootlin.com>
 <20181018115512.15131-2-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181018115512.15131-2-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18/10/2018 13:55:12+0200, Boris Brezillon wrote:
> When the NOR supports 4 bytes opcodes we should use those instead of
> switching the flash in 4-bytes mode. This way, we don't have to restore
> the addressing mode when resetting the board.
> 
> Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
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
> -- 
> 2.14.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
