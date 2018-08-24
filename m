Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ftBdd-0005g4-Tq
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2018 12:59:09 +0000
Date: Fri, 24 Aug 2018 14:55:19 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: rawnand: denali: do not pass zero maxchips to
 nand_scan()
Message-ID: <20180824145519.330133a4@bbrezillon>
In-Reply-To: <1534839799-14112-1-git-send-email-yamada.masahiro@socionext.com>
References: <1534839799-14112-1-git-send-email-yamada.masahiro@socionext.com>
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

Hi Masahiro,

On Tue, 21 Aug 2018 17:23:19 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Commit 49aa76b16676 ("mtd: rawnand: do not execute nand_scan_ident()
> if maxchips is zero") gave a new meaning for calling nand_scan_ident()
> with maxchips=0.
> 
> It is a special usage for some drivers such as docg4, but in fact
> the Denali driver may pass maxchips=0 to nand_scan() when the driver
> is enabled but no NAND chip is found on the board for some reasons.
> 
> If nand_scan_with_ids() is called with maxchips=0, nand_scan_ident()
> is skipped, i.e. nand_set_defaults() is skipped.  Therefore, the
> driver must have set chip->controller beforehand.  Otherwise,
> nand_attach() causes NULL pointer dereference.
> 
> In fact, the Denali controller knows the number of connected chips
> before calling nand_scan_ident(); if DEVICE_RESET fails, there is no
> chip in that chip select.  Then, denali_reset_banks() sets the maxchips
> to the number of detected chips.  If no chip is found, it is zero.
> 
> The reason of this trick was, as commit f486287d2372 ("mtd: nand:
> denali: fix bank reset function to detect the number of chips")
> explained, nand_scan_ident() issued Set Features (0xEF) command
> to all CS lines, some of which may not be connected with a chip.
> Then, the driver would wait until R/B# response, which never happens.
> 
> This problem was solved by commit 107b7d6a7ad4 ("mtd: rawnand: avoid
> setting again the timings to mode 0 after a reset").  In the current
> code, nand_setup_data_interface() is called from nand_scan_tail(),
> which is after the chip detection is done.
> 
> Remove the code that is causing NULL pointer dereference.  Now, the
> maxchips passed to nand_scan() is the maximum number of chip selects
> supported by the IP (typically 4 or 8).  Leave all the chip detection
> process to nand_scan_ident().
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/raw/denali.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index ca18612..3e4b8e1 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -1086,7 +1086,6 @@ static void denali_reset_banks(struct denali_nand_info *denali)
>  	}
>  
>  	dev_dbg(denali->dev, "%d chips connected\n", i);
> -	denali->max_banks = i;

Shouldn't we instead avoid calling nand_scan() when
denali->max_banks=0? I mean, what's the point of calling this function
if you know for sure it will fail.

Last question: do we still need this denali_reset_banks()? If it's only
about resetting the chip to detect how many are actually present,
that's already done by nand_scan().

>  }
>  
>  static void denali_hw_init(struct denali_nand_info *denali)
