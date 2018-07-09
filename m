Received: from mail-eopbgr00123.outbound.protection.outlook.com
 ([40.107.0.123] helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcYk3-0006qe-5A
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 16:10:24 +0000
Received: from fihe3nok0734.emea.nsn-net.net (localhost [127.0.0.1])
 by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id w69G9rgq013404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Mon, 9 Jul 2018 19:09:53 +0300
Received: from [10.151.72.141] ([10.151.72.141])
 by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id w69G9roc013360
 for <linux-mtd@lists.infradead.org>; Mon, 9 Jul 2018 19:09:53 +0300
Subject: Re: [PATCH 1/3] mtd: rawnand: davinci: fix build testing on 64-bit
To: <linux-mtd@lists.infradead.org>
References: <20180709155730.2422841-1-arnd@arndb.de>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <faef5f04-5754-1390-4020-46415da461a0@nokia.com>
Date: Mon, 9 Jul 2018 18:07:38 +0200
MIME-Version: 1.0
In-Reply-To: <20180709155730.2422841-1-arnd@arndb.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Arnd!

On 09/07/18 17:57, Arnd Bergmann wrote:
> Now that we can build this driver everywhere, we run into a couple
> of warnings like:
> 
> drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_correct_4bit':
> drivers/mtd/nand/raw/davinci_nand.c:322:21: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> 
> In all cases, this is harmless and we just need to cast to an uintptr_t
> rather than an unsigned 32-bit integer.
> 
> Fixes: 347af8918e8a ("mtd: rawnand: davinci: Allow selection of this driver when COMPILE_TEST=y")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

> ---
>  drivers/mtd/nand/raw/davinci_nand.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
> index cd12e5abafde..c638bd60eb0b 100644
> --- a/drivers/mtd/nand/raw/davinci_nand.c
> +++ b/drivers/mtd/nand/raw/davinci_nand.c
> @@ -102,7 +102,7 @@ static void nand_davinci_hwcontrol(struct mtd_info *mtd, int cmd,
>  				   unsigned int ctrl)
>  {
>  	struct davinci_nand_info	*info = to_davinci_nand(mtd);
> -	uint32_t			addr = info->current_cs;
> +	uintptr_t			addr = info->current_cs;
>  	struct nand_chip		*nand = mtd_to_nand(mtd);
>  
>  	/* Did the control lines change? */
> @@ -122,7 +122,7 @@ static void nand_davinci_hwcontrol(struct mtd_info *mtd, int cmd,
>  static void nand_davinci_select_chip(struct mtd_info *mtd, int chip)
>  {
>  	struct davinci_nand_info	*info = to_davinci_nand(mtd);
> -	uint32_t			addr = info->ioaddr;
> +	uintptr_t			addr = info->ioaddr;
>  
>  	/* maybe kick in a second chipselect */
>  	if (chip > 0)
> @@ -319,7 +319,7 @@ static int nand_davinci_correct_4bit(struct mtd_info *mtd,
>  	/* Unpack ten bytes into eight 10 bit values.  We know we're
>  	 * little-endian, and use type punning for less shifting/masking.
>  	 */
> -	if (WARN_ON(0x01 & (unsigned) ecc_code))
> +	if (WARN_ON(0x01 & (uintptr_t)ecc_code))
>  		return -EINVAL;
>  	ecc16 = (unsigned short *)ecc_code;
>  
> @@ -441,9 +441,9 @@ static void nand_davinci_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  
> -	if ((0x03 & ((unsigned)buf)) == 0 && (0x03 & len) == 0)
> +	if ((0x03 & ((uintptr_t)buf)) == 0 && (0x03 & len) == 0)
>  		ioread32_rep(chip->IO_ADDR_R, buf, len >> 2);
> -	else if ((0x01 & ((unsigned)buf)) == 0 && (0x01 & len) == 0)
> +	else if ((0x01 & ((uintptr_t)buf)) == 0 && (0x01 & len) == 0)
>  		ioread16_rep(chip->IO_ADDR_R, buf, len >> 1);
>  	else
>  		ioread8_rep(chip->IO_ADDR_R, buf, len);
> @@ -454,9 +454,9 @@ static void nand_davinci_write_buf(struct mtd_info *mtd,
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  
> -	if ((0x03 & ((unsigned)buf)) == 0 && (0x03 & len) == 0)
> +	if ((0x03 & ((uintptr_t)buf)) == 0 && (0x03 & len) == 0)
>  		iowrite32_rep(chip->IO_ADDR_R, buf, len >> 2);
> -	else if ((0x01 & ((unsigned)buf)) == 0 && (0x01 & len) == 0)
> +	else if ((0x01 & ((uintptr_t)buf)) == 0 && (0x01 & len) == 0)
>  		iowrite16_rep(chip->IO_ADDR_R, buf, len >> 1);
>  	else
>  		iowrite8_rep(chip->IO_ADDR_R, buf, len);
> @@ -680,7 +680,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
>  	info->chip.bbt_md	= pdata->bbt_md;
>  	info->timing		= pdata->timing;
>  
> -	info->ioaddr		= (uint32_t __force) vaddr;
> +	info->ioaddr		= (uintptr_t __force) vaddr;
>  
>  	info->current_cs	= info->ioaddr;
>  	info->core_chipsel	= pdata->core_chipsel;

-- 
Best regards,
Alexander Sverdlin.
