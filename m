Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLjzC-0004Ev-Le
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 07:16:47 +0000
Date: Sun, 11 Nov 2018 08:16:32 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3 v3] mtd: partitions: Add OF support to RedBoot
 partitions
Message-ID: <20181111081632.56f1b2fe@bbrezillon>
In-Reply-To: <20181110211413.15707-1-linus.walleij@linaro.org>
References: <20181110211413.15707-1-linus.walleij@linaro.org>
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

Hi Linus,

On Sat, 10 Nov 2018 22:14:13 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> This adds device tree support for RedBoot partitioning. We
> read out the FIS directory block information from the device
> tree and then parse the partition table from there.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Fix copy/paste bug identified by the build robot.
> ChangeLog v1->v2:
> - Rebased on linux-mtd-next for v4.21

Looks like the comments I made on v1 have not been taken into account,
or replied to.

> ---
>  drivers/mtd/parsers/redboot.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
> index 7623ac5fc586..cc04a36c8251 100644
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

nit: can you add a blank line here

> +	ret = of_property_read_u32(np, "fis-index-block", &dirblock);
> +	if (ret)
> +		return;

and here.

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

I keep thinking having one parse_redboot_of() for CONFIG_OF and a dummy
one for !CONFIG_OF is overkill given the size of the function. But if
you insist on keeping this #ifdef CONFIG_OF section, can we also put
mtd_parser_redboot_of_match_table in there (and use of_match_ptr() when
referencing it)?

> +
>  static int parse_redboot_partitions(struct mtd_info *master,
>  				    const struct mtd_partition **pparts,
>  				    struct mtd_part_parser_data *data)
> @@ -75,6 +100,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
>  #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
>  	static char nullstring[] = "unallocated";
>  #endif

Can you add a blank line here as well?

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
> +MODULE_DEVICE_TABLE(of, mtd_parser_redboot_of_match_table);
> +
>  static struct mtd_part_parser redboot_parser = {
>  	.parse_fn = parse_redboot_partitions,
>  	.name = "RedBoot",
> +	.of_match_table = mtd_parser_redboot_of_match_table,
>  };
>  module_mtd_part_parser(redboot_parser);
>  

Those are all minor things I can fix when applying the patch. Let me
know if you're okay with the changes I suggest, and I'll take care of
that.

Regards,

Boris
