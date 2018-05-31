Received: from mail-eopbgr40063.outbound.protection.outlook.com ([40.107.4.63]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fOJK3-0002e5-TD
 for linux-mtd@lists.infradead.org; Thu, 31 May 2018 08:52:42 +0000
Date: Thu, 31 May 2018 10:52:21 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Kees Cook <keescook@chromium.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Linux mtd <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] lib/bch: Remove VLA usage
Message-ID: <20180531085221.GA29786@parrot.com>
References: <20180530212206.GA36883@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180530212206.GA36883@beast>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 30, 2018 at 02:22:06PM -0700, Kees Cook wrote:
> In the quest to remove all stack VLA usage from the kernel[1], this
> allocates a fixed size stack array to cover the range needed for
> bch. This was done instead of a preallocation on the SLAB due to
> performance reasons, shown by Ivan Djelic:
> 
>  little-endian, type sizes: int=4 long=8 longlong=8
>  cpu: Intel(R) Core(TM) i5 CPU         650  @ 3.20GHz
>  calibration: iter=4.9143µs niter=2034 nsamples=200 m=13 t=4
> 
>    Buffer allocation |  Encoding throughput (Mbit/s)
>  ---------------------------------------------------
>   on-stack, VLA      |   3988
>   on-stack, fixed    |   4494
>   kmalloc            |   1967
> 
> So this change actually improves performance too, it seems.
> 
> The resulting stack allocation can get rather large; without
> CONFIG_BCH_CONST_PARAMS, it will allocate 4096 bytes, which
> trips the stack size checking:
> 
> lib/bch.c: In function ‘encode_bch’:
> lib/bch.c:261:1: warning: the frame size of 4432 bytes is larger than 2048 bytes [-Wframe-larger-than=]
> 
> Even the default case for "allmodconfig" (with CONFIG_BCH_CONST_M=14 and
> CONFIG_BCH_CONST_T=4) would have started throwing a warning:
> 
> lib/bch.c: In function ‘encode_bch’:
> lib/bch.c:261:1: warning: the frame size of 2288 bytes is larger than 2048 bytes [-Wframe-larger-than=]
> 
> But this is how large it's always been; it was just hidden from
> the checker because it was a VLA. So the Makefile has been adjusted to
> silence this warning for anything smaller than 4500 bytes, which should
> provide room for normal cases, but still low enough to catch any future
> pathological situations.
> 
> [1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=qPXydAacU1RqZWA@mail.gmail.com
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2: switch to fixed-size stack array
> ---

(...)

>  #define BCH_ECC_WORDS(_p)      DIV_ROUND_UP(GF_M(_p)*GF_T(_p), 32)
>  #define BCH_ECC_BYTES(_p)      DIV_ROUND_UP(GF_M(_p)*GF_T(_p), 8)
>  
> +#define BCH_ECC_MAX_WORDS      DIV_ROUND_UP(BCH_MAX_M * BCH_MAX_T, 32)
> +#define BCH_ECC_MAX_BYTES      DIV_ROUND_UP(BCH_MAX_M * BCH_MAX_T, 8)
> +
>  #ifndef dbg
>  #define dbg(_fmt, args...)     do {} while (0)
>  #endif
> @@ -187,7 +194,8 @@ void encode_bch(struct bch_control *bch, const uint8_t *data,
>  	const unsigned int l = BCH_ECC_WORDS(bch)-1;
>  	unsigned int i, mlen;
>  	unsigned long m;
> -	uint32_t w, r[l+1];
> +	uint32_t w, r[BCH_ECC_MAX_WORDS];
> +	const size_t r_bytes = BCH_ECC_BYTES(bch);

Here 'r_bytes' is too small, because BCH_ECC_BYTES(bch) != BCH_ECC_WORDS(bch)*sizeof(uint32_t).

It should be:

const size_t r_bytes = BCH_ECC_WORDS(bch)*sizeof(uint32_t);

or an equivalent like:

const size_t r_bytes = (l+1)*sizeof(*bch->ecc_buf);

The rest of the patch seems fine to me.

BR,
--
Ivan
