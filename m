Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8T9w-0001MW-Ua
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2018 16:41:17 +0000
Date: Fri, 5 Oct 2018 18:40:48 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 ard.biesheuvel@linaro.org, stable@vger.kernel.org, Coly Li
 <colyli@suse.de>, Matt Redfearn <matt.redfearn@mips.com>, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/bch: fix possible stack overrun
Message-ID: <20181005184048.1ec06dad@bbrezillon>
In-Reply-To: <20181005155723.199954-1-arnd@arndb.de>
References: <20181005155723.199954-1-arnd@arndb.de>
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

On Fri,  5 Oct 2018 17:56:51 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> The previous patch introduced very large kernel stack usage and a Makefile
> change to hide the warning about it.
> 
> From what I can tell, a number of things went wrong here:
> 
> - The BCH_MAX_T constant was set to the maximum value for 'n',
>   not the maximum for 't', which is much smaller.
> 
> - The stack usage is actually larger than the entire kernel stack
>   on some architectures that can use 4KB stacks (m68k, sh, c6x), which
>   leads to an immediate overrun.
> 
> - The justification in the patch description claimed that nothing
>   changed, however that is not the case even without the two points above:
>   the configuration is machine specific, and most boards  never use the
>   maximum BCH_ECC_WORDS() length but instead have something much smaller.
>   That maximum would only apply to machines that use both the maximum
>   block size and the maximum ECC strength.
> 
> The largest value for 't' that I could find is '32', which in turn leads
> to a 60 byte array instead of 2048 bytes. With that changed, the warning
> can be enabled again.
> 
> Fixes: 02361bc77888 ("lib/bch: Remove VLA usage")
> Reported-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Please review carefully to ensure my logic is correct. I spent a
> long time trying to understand what is going on here, but I'm not
> too familiar with this algorithm, and it's possible I still got it
> wrong as well.
> In particular, I'm not 100% sure if '32' is the maximum ECC strength
> we can support, or if a larger one (which?) might be possible.

Well, the ECC strength (T) is dynamically configurable through the
nand-ecc-strength param, so it's theoretically not limited to 32. This
being said, I doubt people are using soft BCH with more strength higher
than 32.

> ---
>  lib/Makefile |  1 -
>  lib/bch.c    | 10 ++++++----
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/Makefile b/lib/Makefile
> index 8c9647fa271a..12c479dd46e0 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -122,7 +122,6 @@ obj-$(CONFIG_ZLIB_INFLATE) += zlib_inflate/
>  obj-$(CONFIG_ZLIB_DEFLATE) += zlib_deflate/
>  obj-$(CONFIG_REED_SOLOMON) += reed_solomon/
>  obj-$(CONFIG_BCH) += bch.o
> -CFLAGS_bch.o := $(call cc-option,-Wframe-larger-than=4500)
>  obj-$(CONFIG_LZO_COMPRESS) += lzo/
>  obj-$(CONFIG_LZO_DECOMPRESS) += lzo/
>  obj-$(CONFIG_LZ4_COMPRESS) += lz4/
> diff --git a/lib/bch.c b/lib/bch.c
> index 7b0f2006698b..3ef1a3467e7b 100644
> --- a/lib/bch.c
> +++ b/lib/bch.c
> @@ -79,20 +79,19 @@
>  #define GF_T(_p)               (CONFIG_BCH_CONST_T)
>  #define GF_N(_p)               ((1 << (CONFIG_BCH_CONST_M))-1)
>  #define BCH_MAX_M              (CONFIG_BCH_CONST_M)
> +#define BCH_MAX_T	       (CONFIG_BCH_CONST_T)
>  #else
>  #define GF_M(_p)               ((_p)->m)
>  #define GF_T(_p)               ((_p)->t)
>  #define GF_N(_p)               ((_p)->n)
> -#define BCH_MAX_M              15
> +#define BCH_MAX_M              15 /* 2KB */
> +#define BCH_MAX_T              32 /* 32 bit correction */

I'd recommend adding a test on t here [1] (t > BCH_MAX_T), so that you
fail at init time if t is too big.

[1]https://elixir.bootlin.com/linux/v4.19-rc6/source/lib/bch.c#L1280 

>  #endif
>  
> -#define BCH_MAX_T              (((1 << BCH_MAX_M) - 1) / BCH_MAX_M)
> -
>  #define BCH_ECC_WORDS(_p)      DIV_ROUND_UP(GF_M(_p)*GF_T(_p), 32)
>  #define BCH_ECC_BYTES(_p)      DIV_ROUND_UP(GF_M(_p)*GF_T(_p), 8)
>  
>  #define BCH_ECC_MAX_WORDS      DIV_ROUND_UP(BCH_MAX_M * BCH_MAX_T, 32)
> -#define BCH_ECC_MAX_BYTES      DIV_ROUND_UP(BCH_MAX_M * BCH_MAX_T, 8)
>  
>  #ifndef dbg
>  #define dbg(_fmt, args...)     do {} while (0)
> @@ -202,6 +201,9 @@ void encode_bch(struct bch_control *bch, const uint8_t *data,
>  	const uint32_t * const tab3 = tab2 + 256*(l+1);
>  	const uint32_t *pdata, *p0, *p1, *p2, *p3;
>  
> +	if (WARN_ON(r_bytes > sizeof(r)))
> +		return;
> +
>  	if (ecc) {
>  		/* load ecc parity bytes into internal 32-bit buffer */
>  		load_ecc8(bch, bch->ecc_buf, ecc);
