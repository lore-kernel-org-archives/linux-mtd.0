Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PN3f5-0005dy-OF
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 13:20:57 +0000
Date: Mon, 29 Nov 2010 14:20:34 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Linus Walleij <linus.walleij@stericsson.com>
Subject: Re: [PATCH 3/3] mtd: FSMC NAND fix obvious speling errors
Message-ID: <20101129132033.GE20449@pengutronix.de>
References: <1291035147-17840-1-git-send-email-linus.walleij@stericsson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1291035147-17840-1-git-send-email-linus.walleij@stericsson.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

$SUBJECT ~= s/speling/spelling/ :-)

Uwe

On Mon, Nov 29, 2010 at 01:52:27PM +0100, Linus Walleij wrote:
> Fix spelling in the interface file.
> 
> Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>
> ---
>  include/linux/mtd/fsmc.h |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
> index f589f29..8a2b75e 100644
> --- a/include/linux/mtd/fsmc.h
> +++ b/include/linux/mtd/fsmc.h
> @@ -27,7 +27,7 @@
>  
>  /*
>   * The placement of the Command Latch Enable (CLE) and
> - * Address Latch Enable (ALE) is twised around in the
> + * Address Latch Enable (ALE) is twisted around in the
>   * SPEAR310 implementation.
>   */
>  #if defined(CONFIG_MACH_SPEAR310)
> @@ -62,7 +62,7 @@ struct fsmc_nor_bank_regs {
>  
>  /* ctrl_tim register definitions */
>  
> -struct fsms_nand_bank_regs {
> +struct fsmc_nand_bank_regs {
>  	uint32_t pc;
>  	uint32_t sts;
>  	uint32_t comm;
> @@ -78,7 +78,7 @@ struct fsms_nand_bank_regs {
>  struct fsmc_regs {
>  	struct fsmc_nor_bank_regs nor_bank_regs[FSMC_MAX_NOR_BANKS];
>  	uint8_t reserved_1[0x40 - 0x20];
> -	struct fsms_nand_bank_regs bank_regs[FSMC_MAX_NAND_BANKS];
> +	struct fsmc_nand_bank_regs bank_regs[FSMC_MAX_NAND_BANKS];
>  	uint8_t reserved_2[0xfe0 - 0xc0];
>  	uint32_t peripid0;			/* 0xfe0 */
>  	uint32_t peripid1;			/* 0xfe4 */
> -- 
> 1.7.3.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
