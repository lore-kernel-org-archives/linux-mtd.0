Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a50H3-0004A8-Cj
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 00:00:26 +0000
Date: Sat, 5 Dec 2015 01:00:02 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Linus Walleij
 <linus.walleij@linaro.org>, Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH v2 3/6] mtd: partitions: rename MTD parser get/put
Message-ID: <20151205010002.51a1bd57@bbrezillon>
In-Reply-To: <1449271518-118900-4-git-send-email-computersforpeace@gmail.com>
References: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
 <1449271518-118900-4-git-send-email-computersforpeace@gmail.com>
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

On Fri,  4 Dec 2015 15:25:15 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> We're going to reuse put_partition_parser(), so let's fix up the prefix
> naming a bit, to hopefully be more consistent. Also make convert to a
> true C function instead of a macro.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> v2: keep mtd_part_parser_put() in the *.c file instead of the header, since
>     we'll only use it in a wrapper now instead of exporting it directly

Don't know if you forgot my R-b tag or if you dropped it on purpose
because of this change, but it still applies here.

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> 
>  drivers/mtd/mtdpart.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 1fa3ca95d9c1..c6fd4b24c822 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -684,7 +684,7 @@ int add_mtd_partitions(struct mtd_info *master,
>  static DEFINE_SPINLOCK(part_parser_lock);
>  static LIST_HEAD(part_parsers);
>  
> -static struct mtd_part_parser *get_partition_parser(const char *name)
> +static struct mtd_part_parser *mtd_part_parser_get(const char *name)
>  {
>  	struct mtd_part_parser *p, *ret = NULL;
>  
> @@ -701,7 +701,10 @@ static struct mtd_part_parser *get_partition_parser(const char *name)
>  	return ret;
>  }
>  
> -#define put_partition_parser(p) do { module_put((p)->owner); } while (0)
> +static inline void mtd_part_parser_put(const struct mtd_part_parser *p)
> +{
> +	module_put(p->owner);
> +}
>  
>  int __register_mtd_parser(struct mtd_part_parser *p, struct module *owner)
>  {
> @@ -765,9 +768,9 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>  
>  	for ( ; *types; types++) {
>  		pr_debug("%s: parsing partitions %s\n", master->name, *types);
> -		parser = get_partition_parser(*types);
> +		parser = mtd_part_parser_get(*types);
>  		if (!parser && !request_module("%s", *types))
> -			parser = get_partition_parser(*types);
> +			parser = mtd_part_parser_get(*types);
>  		pr_debug("%s: got parser %s\n", master->name,
>  			 parser ? parser->name : NULL);
>  		if (!parser)
> @@ -775,7 +778,7 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>  		ret = (*parser->parse_fn)(master, pparts, data);
>  		pr_debug("%s: parser %s: %i\n",
>  			 master->name, parser->name, ret);
> -		put_partition_parser(parser);
> +		mtd_part_parser_put(parser);
>  		if (ret > 0) {
>  			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
>  			       ret, parser->name, master->name);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
