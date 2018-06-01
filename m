Received: from mail-db5eur01on0069.outbound.protection.outlook.com
 ([104.47.2.69] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fOhwC-0004Lr-HM
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2018 11:09:59 +0000
Date: Fri, 1 Jun 2018 13:09:21 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Kees Cook <keescook@chromium.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Linux mtd <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] lib/bch: Remove VLA usage
Message-ID: <20180601110921.GC4695@parrot.com>
References: <20180531184525.GA11068@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180531184525.GA11068@beast>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 31, 2018 at 11:45:25AM -0700, Kees Cook wrote:
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
> v3: fix r_bytes to whole-word size
> v2: switch to fixed-size stack array
> ---
>  lib/Makefile |  1 +
>  lib/bch.c    | 23 +++++++++++++++--------
>  2 files changed, 16 insertions(+), 8 deletions(-)
 

The patch looks good to me. It also passed my regression tests.

Reviewed-by: Ivan Djelic <ivan.djelic@parrot.com>
Tested-by: Ivan Djelic <ivan.djelic@parrot.com>

Thanks,
--
Ivan
