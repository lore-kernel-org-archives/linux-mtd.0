Received: from mail-lb0-f180.google.com ([209.85.217.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV4Jb-0000Kz-E8
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 20:30:16 +0000
Received: by lbiz12 with SMTP id z12so51062858lbi.5
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 13:29:52 -0700 (PDT)
Message-ID: <54FE02C1.9090803@cogentembedded.com>
Date: Mon, 09 Mar 2015 23:29:53 +0300
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] MTD: cfi: reduce stack size
References: <2376719.UMjvd0rdnO@wuerfel>
In-Reply-To: <2376719.UMjvd0rdnO@wuerfel>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Jingoo Han <jg1.han@samsung.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 3/9/2015 10:34 PM, Arnd Bergmann wrote:

> The cfi_staa_write_buffers function uses a large amount of kernel stack
> whenever CONFIG_MTD_MAP_BANK_WIDTH_32 is set, and that results in a
> warning on ARM allmodconfig builds:

> drivers/mtd/chips/cfi_cmdset_0020.c: In function 'cfi_staa_write_buffers':
> drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]

> It turns out that this is largely a result of a suboptimal implementation
> of map_word_andequal(). Replacing this function with a straightforward
> one reduces the stack size in this function by exactly 200 bytes,
> shrinks the .text segment for this file from 27648 bytes to 26608 bytes,
> and makes the warning go away.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

> diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
> index 5f487d776411..7b5841663d4f 100644
> --- a/include/linux/mtd/map.h
> +++ b/include/linux/mtd/map.h
> @@ -314,7 +314,15 @@ static inline map_word map_word_or(struct map_info *map, map_word val1, map_word
>   	return r;
>   }
>
> -#define map_word_andequal(m, a, b, z) map_word_equal(m, z, map_word_and(m, a, b))
> +static inline int map_word_andequal(struct map_info *map, map_word val1, map_word val2, map_word val3)
> +{
> +	int i;

    I think empty line is needed here.

> +	for (i=0; i < map_words(map); i++) {

    Could you please be consistent and surround all binary operators with 
spaces, like on the line below?

> +		if ((val1.x[i] & val2.x[i]) != val3.x[i])
> +			return 0;
> +	}
> +	return 1;
> +}
[...]

WBR, Sergei
