Date: Tue, 10 Mar 2015 12:41:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] mtd: cfi: reduce stack size
Message-ID: <20150310194126.GC4124@norris-Latitude-E6410>
References: <2266200.3mx7btcFe5@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2266200.3mx7btcFe5@wuerfel>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 10, 2015 at 05:48:37PM +0100, Arnd Bergmann wrote:
> The cfi_staa_write_buffers function uses a large amount of kernel stack
> whenever CONFIG_MTD_MAP_BANK_WIDTH_32 is set, and that results in a
> warning on ARM allmodconfig builds:
> 
> drivers/mtd/chips/cfi_cmdset_0020.c: In function 'cfi_staa_write_buffers':
> drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> It turns out that this is largely a result of a suboptimal implementation
> of map_word_andequal(). Replacing this function with a straightforward
> one reduces the stack size in this function by exactly 200 bytes,
> shrinks the .text segment for this file from 27648 bytes to 26608 bytes,
> and makes the warning go away.

Patch looks OK to me, and those results are nice.

Did you (or anyone else) do any testing?

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v3: more whitespace changes
> v2: whitespace changes
> 
> diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
> index 47c59991491b..29975c73a953 100644
> --- a/include/linux/mtd/map.h
> +++ b/include/linux/mtd/map.h
> @@ -316,7 +316,17 @@ static inline map_word map_word_or(struct map_info *map, map_word val1, map_word
>  	return r;
>  }
>  
> -#define map_word_andequal(m, a, b, z) map_word_equal(m, z, map_word_and(m, a, b))
> +static inline int map_word_andequal(struct map_info *map, map_word val1, map_word val2, map_word val3)
> +{
> +	int i;
> +
> +	for (i = 0; i < map_words(map); i++) {
> +		if ((val1.x[i] & val2.x[i]) != val3.x[i])
> +			return 0;
> +	}
> +
> +	return 1;
> +}
>  
>  static inline int map_word_bitsset(struct map_info *map, map_word val1, map_word val2)
>  {
> 
