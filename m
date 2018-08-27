Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuErE-0007T7-K5
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 10:34:54 +0000
Received: by mail-wm0-x243.google.com with SMTP id c14-v6so7589555wmb.4
 for <linux-mtd@lists.infradead.org>; Mon, 27 Aug 2018 03:34:41 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Alexander Amelkin <a.amelkin@yadro.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
Date: Mon, 27 Aug 2018 12:33:21 +0200
MIME-Version: 1.0
In-Reply-To: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
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

On 08/20/2018 12:26 PM, Alexander Amelkin wrote:
> Currently in spi-nor driver there is a line for mx66l51235l.
> According to Macronix site, there is no such part number. The chip
> detected as such is actually mx66l51235f. Hence, this commit renames
> the chip.

I wonder if this could pose a problem, since this might interfere with
the DT being an ABI. But I guess fixing the name is OK.

> According to the datasheet for mx66l51235f, "The device default is in
> 24-bit address mode" (section 9-10). Having option SPI_NOR_4B_OPCODES
> makes the code act as if the device was already in 4B mode and didn't
> need the EN4B command. That prevents this chip from functioning on
> systems where the boot loader left the chip in 3B mode (e.g. if the
> chip wasn't used during the boot process).
> 
> Hence, this commit removes the SPI_NOR_4B_OPCODES option for
> mx66l51235f (added previously by commit d342b6a973af).

Could it be there are two variants of the chip, one which supports the
4B opcodes and one which does not ? Wouldn't be the first time I saw
this. If this chip supports the SFDP tables, you can check those.

> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: <linux-mtd@lists.infradead.org>
> Cc: <openbmc@lists.ozlabs.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Fixes: d342b6a973af ("mtd: spi-nor: enable 4B opcodes for mx66l51235l")
> Signed-off-by: Alexander Amelkin <a.amelkin@yadro.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index f028277..c5ef85e 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1091,7 +1091,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> -	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
> 


-- 
Best regards,
Marek Vasut
