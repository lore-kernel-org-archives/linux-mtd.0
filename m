Message-ID: <1426012416.18060.22.camel@perches.com>
Subject: Re: [PATCH] mtd: clean up whitespace in linux/mtd/map.h
From: Joe Perches <joe@perches.com>
To: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 Mar 2015 11:33:36 -0700
In-Reply-To: <2220416.D2kDyFWh1C@wuerfel>
References: <2266200.3mx7btcFe5@wuerfel> <2220416.D2kDyFWh1C@wuerfel>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-03-10 at 17:51 +0100, Arnd Bergmann wrote:
> As the only comments I got for the "mtd: cfi: reduce stack size"
> patch were about whitespace changes, it appears necessary to fix
> up the rest of the file as well, which contains the exact same
> mistakes.

trivia:

> diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
[]
> @@ -77,7 +77,7 @@
>  /* ensure we never evaluate anything shorted than an unsigned long
>   * to zero, and ensure we'll never miss the end of an comparison (bjd) */
>  
> -#define map_calc_words(map) ((map_bankwidth(map) + (sizeof(unsigned long)-1))/ sizeof(unsigned long))
> +#define map_calc_words(map) ((map_bankwidth(map) + (sizeof(unsigned long)-1)) / sizeof(unsigned long))

DIV_ROUND_UP?
 
>  #ifdef CONFIG_MTD_MAP_BANK_WIDTH_8
>  # ifdef map_bankwidth
> @@ -181,7 +181,7 @@ static inline int map_bankwidth_supported(int w)
>  	}
>  }
>  
> -#define MAX_MAP_LONGS ( ((MAX_MAP_BANKWIDTH*8) + BITS_PER_LONG - 1) / BITS_PER_LONG )
> +#define MAX_MAP_LONGS (((MAX_MAP_BANKWIDTH * 8) + BITS_PER_LONG - 1) / BITS_PER_LONG)

BITS_TO_LONGS?
