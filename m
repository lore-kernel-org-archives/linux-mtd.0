Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXBBH-0005pW-Se
 for linux-mtd@lists.infradead.org; Sun, 24 Jun 2018 20:00:17 +0000
Date: Sun, 24 Jun 2018 22:00:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <cyrille.pitchen@microchip.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Cristian.Birsan@microchip.com, nicolas.ferre@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: add support to non-uniform SFDP SPI NOR
 flash memories
Message-ID: <20180624220003.5faaae8c@bbrezillon>
In-Reply-To: <20180608134818.21387-2-tudor.ambarus@microchip.com>
References: <20180608134818.21387-1-tudor.ambarus@microchip.com>
 <20180608134818.21387-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tudor,

Just one minor comment, I'll let Marek review the patch in more details.

On Fri, 8 Jun 2018 16:48:18 +0300
Tudor Ambarus <tudor.ambarus@microchip.com> wrote:

>  /*
>   * Erase an address range on the nor chip.  The address range may extend
>   * one or more erase sectors.  Return an error is there is a problem erasing.
> @@ -511,9 +721,11 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
>  			(long long)instr->len);
>  
> -	div_u64_rem(instr->len, mtd->erasesize, &rem);
> -	if (rem)
> -		return -EINVAL;
> +	if (likely(spi_nor_has_uniform_erase(nor))) {

To be honest, I don't think the likely() makes any difference here,
given the time it takes to actually erase the block. Can we just drop
it?

> +		div_u64_rem(instr->len, mtd->erasesize, &rem);
> +		if (rem)
> +			return -EINVAL;
> +	}

Regards,

Boris
