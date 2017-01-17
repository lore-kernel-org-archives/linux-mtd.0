Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTRVy-0006VJ-Tg
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 11:01:25 +0000
Received: by mail-lf0-x244.google.com with SMTP id h65so15676381lfi.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2017 03:01:02 -0800 (PST)
Subject: Re: [PATCH V2] mtd: bcm47xxsflash: support reading flash out of
 mapping window
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20170116220916.2603-1-zajec5@gmail.com>
 <20170117105110.26328-1-zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <31ca1f51-887d-fce4-400c-cc0f97353eb8@gmail.com>
Date: Tue, 17 Jan 2017 12:00:59 +0100
MIME-Version: 1.0
In-Reply-To: <20170117105110.26328-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/17/2017 11:51 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> For reading flash content we use MMIO but it's possible to read only
> first 16 MiB this way. It's simply an arch design/limitation.
> To support flash sizes bigger than 16 MiB implement indirect access
> using ChipCommon registers.
> This has been tested using MX25L25635F.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Simplify line writing to buf
>     Add some trivial comment for OPCODE_ST_READ4B
>     Both requested by Marek
> ---
>  drivers/mtd/devices/bcm47xxsflash.c | 12 +++++++++++-
>  drivers/mtd/devices/bcm47xxsflash.h |  3 +++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
> index 4decd8c..8d4c1db 100644
> --- a/drivers/mtd/devices/bcm47xxsflash.c
> +++ b/drivers/mtd/devices/bcm47xxsflash.c
> @@ -110,7 +110,17 @@ static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	if ((from + len) > mtd->size)
>  		return -EINVAL;
>  
> -	memcpy_fromio(buf, b47s->window + from, len);
> +	if (from + len <= BCM47XXSFLASH_WINDOW_SIZE) {
> +		memcpy_fromio(buf, b47s->window + from, len);

One last nit, what if the read starts < 16 MiB and ends > 16 MiB ?
Shouldn't that use partly the windowed mode and partly the other mode?

> +	} else {
> +		size_t i;
> +
> +		for (i = 0; i < len; i++) {
> +			b47s->cc_write(b47s, BCMA_CC_FLASHADDR, from++);
> +			bcm47xxsflash_cmd(b47s, OPCODE_ST_READ4B);
> +			*buf++ = b47s->cc_read(b47s, BCMA_CC_FLASHDATA);
> +		}
> +	}
>  	*retlen = len;
>  
>  	return len;
> diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/bcm47xxsflash.h
> index 1564b62..6b478af 100644
> --- a/drivers/mtd/devices/bcm47xxsflash.h
> +++ b/drivers/mtd/devices/bcm47xxsflash.h
> @@ -3,6 +3,8 @@
>  
>  #include <linux/mtd/mtd.h>
>  
> +#define BCM47XXSFLASH_WINDOW_SIZE		SZ_16M
> +
>  /* Used for ST flashes only. */
>  #define OPCODE_ST_WREN		0x0006		/* Write Enable */
>  #define OPCODE_ST_WRDIS		0x0004		/* Write Disable */
> @@ -16,6 +18,7 @@
>  #define OPCODE_ST_RES		0x03ab		/* Read Electronic Signature */
>  #define OPCODE_ST_CSA		0x1000		/* Keep chip select asserted */
>  #define OPCODE_ST_SSE		0x0220		/* Sub-sector Erase */
> +#define OPCODE_ST_READ4B	0x6313		/* Read Data Bytes in 4Byte address */
>  
>  /* Used for Atmel flashes only. */
>  #define OPCODE_AT_READ				0x07e8
> 


-- 
Best regards,
Marek Vasut
