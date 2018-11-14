Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMva4-0001L9-MT
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2018 13:51:46 +0000
Date: Wed, 14 Nov 2018 14:51:29 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Liu Xiang <liu.xiang6@zte.com.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 richard@nod.at, liuxiang_1999@126.com, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Return error when nor->addr_width not
 match the device size
Message-ID: <20181114145129.568e4bb3@bbrezillon>
In-Reply-To: <1542200165-3073-1-git-send-email-liu.xiang6@zte.com.cn>
References: <1542200165-3073-1-git-send-email-liu.xiang6@zte.com.cn>
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

On Wed, 14 Nov 2018 20:56:05 +0800
Liu Xiang <liu.xiang6@zte.com.cn> wrote:

> In is25lp256, the DWORD1 of JEDEC Basic Flash Parameter Header
> is 0xfff920e5. So the DWORD1[18:17] Address Bytes bits are 0b00,
> means that 3-Byte only addressing.

According to your other patch this NOR supports 4B opcode, which means
the SFDP table is wrong.

> But the device size is larger
> than 16MB, nor->addr_width must be 4 to access the whole address.
> An error should be returned when nor->addr_width not match

						   ^does not

> the device size in spi_nor_parse_sfdp().
> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 3eba13a..77eaf22 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2669,6 +2669,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	}
>  	params->size >>= 3; /* Convert to bytes. */
>  
> +	/*if the device exceeds 16MiB, addr_width must be 4*/

Please add a white space after '/*' and before '*/':

	/* If the device exceeds 16MiB, ->addr_width must be 4. */

> +	if ((params->size > 0x1000000) && (nor->addr_width == 3))

Parens are not needed around sub-conditions:

	if (params->size > 0x1000000 && nor->addr_width == 3)

> +		return -EINVAL;
> +

I'm not sure this is correct. Looks like some NORs only support 3B
opcodes but have a "4-byte addressing" mode (see set_4byte() [1]).
Don't know what's reported by the BFPT section in this case though
(BFPT_DWORD1_ADDRESS_BYTES_3_ONLY or BFPT_DWORD1_ADDRESS_BYTES_3_OR_4).

Anyway, I think this check should be moved here [2] to cover the
non-SFDP case.

>  	/* Fast Read settings. */
>  	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_reads); i++) {
>  		const struct sfdp_bfpt_read *rd = &sfdp_bfpt_reads[i];

[1]https://elixir.bootlin.com/linux/v4.20-rc2/source/drivers/mtd/spi-nor/spi-nor.c#L278
[2]https://elixir.bootlin.com/linux/v4.20-rc2/source/drivers/mtd/spi-nor/spi-nor.c#L3758
