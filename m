Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fc8Qu-0004K7-DP
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 12:04:54 +0000
Date: Sun, 8 Jul 2018 14:04:49 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Sergey Larin <cerg2010cerg2010@mail.ru>
Cc: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: rawnand: docg4: specify bits_per_cell
Message-ID: <20180708140449.31efdc59@bbrezillon>
In-Reply-To: <48cec9b431a42375cd9033b225f3573002574f17.1531045014.git.cerg2010cerg2010@mail.ru>
References: <cover.1531045014.git.cerg2010cerg2010@mail.ru>
 <48cec9b431a42375cd9033b225f3573002574f17.1531045014.git.cerg2010cerg2010@mail.ru>
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

On Sun,  8 Jul 2018 14:29:24 +0300
Sergey Larin <cerg2010cerg2010@mail.ru> wrote:

> This fixes WARN() in nand_is_slc().
> 
> DoC G4 is 2-bit MLC, so set bits_per_cell value according to this.

What you do here implies "no UBI on docg4". To be honest, I'm pretty
sure there's an FTL in there, which clearly does not make it a good
candidate for the raw NAND framework. Not to mention that it's not even
using the same instruction set which forced developers of this driver
to guess what the core was trying to do in the ->cmdfunc()
implementation and convert it to docg4 operations. This approach is
going against the recent evolution of the raw NAND framework
(deprecating ->cmdfunc() in favor of ->exec_op()).

I'd really like to see this driver moved outside of
drivers/mtd/nand/raw/. If it really has NAND constraints, you could
re-use the interface agnostic NAND framework (include/linux/nand.h) and
add a new driver under drivers/mtd/nand/diskonchip/docg4.c.

That's the very reason I asked if you if you had access to this HW. I
can help you with the development part, but I can't test.

> 
> Signed-off-by: Sergey Larin <cerg2010cerg2010@mail.ru>
> ---
>  drivers/mtd/nand/raw/docg4.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/raw/docg4.c b/drivers/mtd/nand/raw/docg4.c
> index bbed8ea7858c..82d97a16e246 100644
> --- a/drivers/mtd/nand/raw/docg4.c
> +++ b/drivers/mtd/nand/raw/docg4.c
> @@ -1250,6 +1250,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
>  	nand->pagemask = 0x3ffff;
>  	nand->badblockpos = NAND_LARGE_BADBLOCK_POS;
>  	nand->badblockbits = 8;
> +	nand->bits_per_cell = 2;
>  	nand->ecc.mode = NAND_ECC_HW_SYNDROME;
>  	nand->ecc.size = DOCG4_PAGE_SIZE;
>  	nand->ecc.prepad = 8;
