Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDPgr-0001dH-7I
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 08:01:25 +0000
Date: Fri, 19 Oct 2018 09:59:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] mtd: partitions: Add OF support to RedBoot partitions
Message-ID: <20181019095903.5dee8dd4@bbrezillon>
In-Reply-To: <20181019070622.26661-3-linus.walleij@linaro.org>
References: <20181019070622.26661-1-linus.walleij@linaro.org>
 <20181019070622.26661-3-linus.walleij@linaro.org>
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

On Fri, 19 Oct 2018 09:06:22 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> This adds device tree support for RedBoot partitioning. We
> read out the FIS directory block information from the device
> tree and then parse the partition table from there.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mtd/parsers/redboot.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
> index 7623ac5fc586..fb816825aa19 100644
> --- a/drivers/mtd/parsers/redboot.c
> +++ b/drivers/mtd/parsers/redboot.c
> @@ -25,7 +25,7 @@
>  #include <linux/slab.h>
>  #include <linux/init.h>
>  #include <linux/vmalloc.h>
> -
> +#include <linux/of.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/module.h>
> @@ -56,6 +56,31 @@ static inline int redboot_checksum(struct fis_image_desc *img)
>  	return 1;
>  }
>  
> +#ifdef CONFIG_OF
> +static void parse_redboot_of(struct mtd_info *master)
> +{
> +	struct device_node *np;
> +	u32 dirblock;
> +	int ret;
> +
> +	np = mtd_get_of_node(master);
> +	if (!np)
> +		return;
> +	ret = of_property_read_u32(np, "fis-index-block", &dirblock);
> +	if (ret)
> +		return;
> +	/*
> +	 * Assign the block found in the device tree to the local
> +	 * directory block pointer.
> +	 */
> +	directory = dirblock;
> +}
> +#else
> +static void parse_redboot_of(struct mtd_info *master)
> +{
> +}
> +#endif
> +
>  static int parse_redboot_partitions(struct mtd_info *master,
>  				    const struct mtd_partition **pparts,
>  				    struct mtd_part_parser_data *data)
> @@ -75,6 +100,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
>  #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
>  	static char nullstring[] = "unallocated";
>  #endif
> +	parse_redboot_of(master);
>  
>  	if ( directory < 0 ) {
>  		offset = master->size + directory * master->erasesize;
> @@ -289,9 +315,16 @@ static int parse_redboot_partitions(struct mtd_info *master,
>  	return ret;
>  }
>  
> +static const struct of_device_id mtd_parser_redboot_of_match_table[] = {
> +	{ .compatible = "redboot-fis" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtd_parser_trx_of_match_table);

You might want to have this match table definition enclosed in a #ifdef
CONFIG_OF section...

> +
>  static struct mtd_part_parser redboot_parser = {
>  	.parse_fn = parse_redboot_partitions,
>  	.name = "RedBoot",
> +	.of_match_table = mtd_parser_redboot_of_match_table,

... and use of_match_ptr(mtd_parser_redboot_of_match_table) here.

I'm proposing that to make it consistent with the
approach you've taken for the parse_redboot_of() function.

Alternatively, you could just drop the #ifdef CONFIG_OF section around
parse_redboot_of() (there's already a dummy of_property_read_u32()
func returning -ENOSYS when CONFIG_OF is not set, so it should work
just fine).

>  };
>  module_mtd_part_parser(redboot_parser);
>  
