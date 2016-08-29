Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1beJM8-0006kC-LN
 for linux-mtd@lists.infradead.org; Mon, 29 Aug 2016 09:59:53 +0000
Date: Mon, 29 Aug 2016 11:59:30 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Karl Beldan <kbeldan@baylibre.com>, Brian Norris
 <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Sekhar
 Nori <nsekhar@ti.com>, Kevin Hilman <khilman@baylibre.com>, Karl Beldan
 <karl.beldan+oss@gmail.com>
Subject: Re: [PATCH] mtd: nand: davinci: Reinitialize the HW ECC engine in
 4bit hwctl
Message-ID: <20160829115930.517a133e@bbrezillon>
In-Reply-To: <20160829074550.29247-1-kbeldan@baylibre.com>
References: <20160829074550.29247-1-kbeldan@baylibre.com>
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

On Mon, 29 Aug 2016 07:45:49 +0000
Karl Beldan <kbeldan@baylibre.com> wrote:

> This fixes subpage writes when using 4-bit HW ECC.
> 
> There has been numerous reports about ECC errors with devices using this
> driver for a while.  Also the 4-bit ECC has been reported as broken with
> subpages in [1] and with 16 bits NANDs in the driver and in mach* board
> files both in mainline and in the vendor BSPs.
> 
> What I saw with 4-bit ECC on a 16bits NAND (on an LCDK) which got me to
> try reinitializing the ECC engine:
> - R/W on whole pages properly generates/checks RS code
> - try writing the 1st subpage only of a blank page, the subpage is well
>   written and the RS code properly generated, re-reading the same page
>   the HW detects some ECC error, reading the same page again no ECC
>   error is detected
> 
> Note that the ECC engine is already reinitialized in the 1-bit case.
> 
> Tested on my LCDK with UBI+UBIFS using subpages.
> This could potentially get rid of the issue workarounded in [1].
> 
> [1] 28c015a9daab ("mtd: davinci-nand: disable subpage write for keystone-nand")
> 
> Signed-off-by: Karl Beldan <kbeldan@baylibre.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Brian, can you take this patch directly in your tree. If that's not
possible, let me know, I'll add the Fixes and Cc:stable tags and take
it for 4.9.

Thanks,

Boris

> ---
>  drivers/mtd/nand/davinci_nand.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index cc07ba0..27fa8b8 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -240,6 +240,9 @@ static void nand_davinci_hwctl_4bit(struct mtd_info *mtd, int mode)
>  	unsigned long flags;
>  	u32 val;
>  
> +	/* Reset ECC hardware */
> +	davinci_nand_readl(info, NAND_4BIT_ECC1_OFFSET);
> +
>  	spin_lock_irqsave(&davinci_nand_lock, flags);
>  
>  	/* Start 4-bit ECC calculation for read/write */
