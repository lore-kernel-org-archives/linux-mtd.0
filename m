Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHWGC-0001ZH-Sl
 for linux-mtd@lists.infradead.org; Sat, 12 May 2018 15:16:38 +0000
Date: Sat, 12 May 2018 17:16:24 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: Fix comparison in map_word_andequal()
Message-ID: <20180512171624.763ee6b3@bbrezillon>
In-Reply-To: <20180510182053.GM8564@decadent.org.uk>
References: <20180510182053.GM8564@decadent.org.uk>
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

On Thu, 10 May 2018 19:20:54 +0100
Ben Hutchings <ben@decadent.org.uk> wrote:

> Commit 9e343e87d2c4 ("mtd: cfi: convert inline functions to macros")
> changed map_word_andequal() into a macro, but also changed the right
> hand side of the comparison from val3 to val2.  Change it back to use
> val3 on the right hand side.
> 
> Thankfully this did not cause a regression because all callers
> currently pass the same argument for val2 and val3.
> 
> Fixes: 9e343e87d2c4 ("mtd: cfi: convert inline functions to macros")
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>

Applied.

Thanks,

Boris

> ---
>  include/linux/mtd/map.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
> index b5b43f94f311..01b990e4b228 100644
> --- a/include/linux/mtd/map.h
> +++ b/include/linux/mtd/map.h
> @@ -312,7 +312,7 @@ void map_destroy(struct mtd_info *mtd);
>  ({									\
>  	int i, ret = 1;							\
>  	for (i = 0; i < map_words(map); i++) {				\
> -		if (((val1).x[i] & (val2).x[i]) != (val2).x[i]) {	\
> +		if (((val1).x[i] & (val2).x[i]) != (val3).x[i]) {	\
>  			ret = 0;					\
>  			break;						\
>  		}							\
