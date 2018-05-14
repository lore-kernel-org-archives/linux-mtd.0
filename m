Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIBZz-00031I-MV
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 11:23:49 +0000
Date: Mon, 14 May 2018 13:23:24 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-m68k@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Fix return type of __DIVIDE() when called
 with 32-bit
Message-ID: <20180514132324.595b63eb@bbrezillon>
In-Reply-To: <1526294977-32303-1-git-send-email-geert@linux-m68k.org>
References: <1526294977-32303-1-git-send-email-geert@linux-m68k.org>
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

On Mon, 14 May 2018 12:49:37 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> The __DIVIDE() macro checks whether it is called with a 32-bit or 64-bit
> dividend, to select the appropriate divide-and-round-up routine.
> As the check uses the ternary operator, the result will always be
> promoted to a type that can hold both results, i.e. unsigned long long.
> 
> When using this result in a division on a 32-bit system, this may lead
> to link errors like:
> 
>     ERROR: "__udivdi3" [drivers/mtd/nand/raw/nand.ko] undefined!
> 
> Fix this by casting the result of the 64-bit division to the type of the
> dividend.
> 
> Fixes: 8878b126df769831 ("mtd: nand: add ->exec_op() implementation")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> This fixes the root cause of the link failure seen with
> m68k/allmodconfig since commit 3057fcef385348fe ("mtd: rawnand: Make
> sure we wait tWB before polling the STATUS reg").
> 
> An alternative mitigation was posted as "[PATCH] m68k: Implement
> ndelay() as an inline function to force type checking/casting"
> (https://lkml.org/lkml/2018/5/13/102).
> ---
>  include/linux/mtd/rawnand.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 5dad59b312440a9c..d06dc428ea0102ae 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -871,7 +871,7 @@ struct nand_op_instr {
>  #define __DIVIDE(dividend, divisor) ({					\
>  	sizeof(dividend) == sizeof(u32) ?				\
>  		DIV_ROUND_UP(dividend, divisor) :			\
> -		DIV_ROUND_UP_ULL(dividend, divisor);			\
> +		(__typeof__(dividend))DIV_ROUND_UP_ULL(dividend, divisor); \

Hm, it's a bit hard to follow when you place the cast here. One could
wonder why a cast to (__typeof__(dividend)) is needed since
DIV_ROUND_UP_ULL() already returns a (__typeof__(dividend)) type.

How about:

	/*
	 * Cast to type of dividend is needed here to guarantee that the
	 * result won't be an unsigned long long when the dividend is an
	 * unsigned long, which is what the compiler does when it sees a
	 * ternary operator with 2 different return types.
	 */
	(__typeof__(dividend))(sizeof(dividend) == sizeof(u32) ?	\
			       DIV_ROUND_UP(dividend, divisor) :	\
			       DIV_ROUND_UP_ULL(dividend, divisor));

Actually, I'm not even sure we care about the truncation that could
happen on an unsigned long long -> unsigned long cast because the
delays we express here will anyway be hundreds of nanosecs/millisecs,
so nothing close to the billions of nanosecs/millisecs you can express
with an unsigned long.

So, maybe we should just do:

	(unsigned long)(sizeof(dividend) == sizeof(u32) ?		\
			DIV_ROUND_UP(dividend, divisor) :		\
			DIV_ROUND_UP_ULL(dividend, divisor));

to make things more readable.

>  		})
>  #define PSEC_TO_NSEC(x) __DIVIDE(x, 1000)
>  #define PSEC_TO_MSEC(x) __DIVIDE(x, 1000000000)
