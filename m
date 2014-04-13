Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZSUZ-0006fJ-3X
 for linux-mtd@lists.infradead.org; Sun, 13 Apr 2014 22:03:11 +0000
From: Marek Vasut <marex@denx.de>
To: grmoore@altera.com
Subject: Re: [PATCH V2] Add support for flag status register on Micron chips.
Date: Sun, 13 Apr 2014 19:18:45 +0200
References: <1397228593-17996-1-git-send-email-grmoore@altera.com>
In-Reply-To: <1397228593-17996-1-git-send-email-grmoore@altera.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404131918.45753.marex@denx.de>
Cc: ggrahammoore@gmail.com, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org, Insop Song <insop.song@gainspeed.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, April 11, 2014 at 05:03:13 PM, grmoore@altera.com wrote:
[...]
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index ad19139..4cddbc8 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -39,6 +39,7 @@
>  #define	OPCODE_WREN		0x06	/* Write enable */
>  #define	OPCODE_RDSR		0x05	/* Read status register */
>  #define	OPCODE_WRSR		0x01	/* Write status register 1 byte 
*/
> +#define	OPCODE_RDFSR		0x70  /* read flag status register */

I know this is not your fault, but can you please indent this properly with 
tabs?

>  #define	OPCODE_NORM_READ	0x03	/* Read data bytes (low 
frequency) */
>  #define	OPCODE_FAST_READ	0x0b	/* Read data bytes (high 
frequency) */
>  #define	OPCODE_QUAD_READ        0x6b    /* Read data bytes */

And fix this one in a separate patch to use tabs as well please ?

[...]

> @@ -790,7 +847,7 @@ static int m25p80_unlock(struct mtd_info *mtd, loff_t
> ofs, uint64_t len)
> 
>  	mutex_lock(&flash->lock);
>  	/* Wait until finished previous command */
> -	if (wait_till_ready(flash)) {
> +	if (flash->wait_till_ready(flash)) {

I wonder, can't wait_till_ready() be made a wrapper that will check the USE_FSR 
flag and call correct wait-function ? This would avoid adding a new member to 
*flash and also would avoid so many changes throughout the code. What do you 
think?
[...]
Best regards,
Marek Vasut
