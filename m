Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N373A-0002xY-ML
	for linux-mtd@lists.infradead.org; Wed, 28 Oct 2009 11:50:53 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n9SBoB0w002614
	for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2009 06:50:45 -0500
Subject: Re: [PATCH] MTD OneNAND OMAP2/3: allow giving partition layout as
	module parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
In-Reply-To: <1251976558-13463-1-git-send-email-ext-mika.2.korhonen@nokia.com>
References: <1251976558-13463-1-git-send-email-ext-mika.2.korhonen@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Oct 2009 13:50:27 +0200
Message-Id: <1256730627.29885.782.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-09-03 at 14:15 +0300, Mika Korhonen wrote:
> Add module parameter "parts" to omap2-onenand driver. Parameter format is
> the same as for cmdlinepart except mtd-id must not be specified - it
> gets prepended by the driver, i.e.: parts=<partdef>[,<partdef>]*
> 
> This allows one to repartition the OneNAND chip and is useful for flashing
> applications that do the partitioning from scratch or want to backup and
> update the partitioning.
> 
> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
> ---
>  drivers/mtd/cmdlinepart.c   |   35 +++++++++++++++++++++++++++++------
>  drivers/mtd/onenand/omap2.c |   29 +++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> index 1479da6..77fa7b7 100644
> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -5,7 +5,7 @@
>   *
>   * The format for the command line is as follows:
>   *
> - * mtdparts=<mtddef>[;<mtddef]
> + * mtdparts=<mtddef>[;<mtddef>]
>   * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
>   *              where <mtd-id> is the name from the "cat /proc/mtd" command
>   * <partdef> := <size>[@offset][<name>][ro][lk]
> @@ -54,7 +54,7 @@ struct cmdline_mtd_partition {
>  /* mtdpart_setup() parses into here */
>  static struct cmdline_mtd_partition *partitions;
>  
> -/* the command line passed to mtdpart_setupd() */
> +/* the command line passed to mtdpart_setup() */
>  static char *cmdline;
>  static int cmdline_parsed = 0;
>  
> @@ -219,9 +219,8 @@ static int mtdpart_setup_real(char *s)
>  {
>  	cmdline_parsed = 1;
>  
> -	for( ; s != NULL; )
> -	{
> -		struct cmdline_mtd_partition *this_mtd;
> +	for ( ; s != NULL; ) {
> +		struct cmdline_mtd_partition *this_mtd, *mtd, *mtd_prev;
>  		struct mtd_partition *parts;
>  	    	int mtd_id_len;
>  		int num_parts;
> @@ -270,6 +269,27 @@ static int mtdpart_setup_real(char *s)
>  		this_mtd->mtd_id = (char*)(this_mtd + 1);
>  		strlcpy(this_mtd->mtd_id, mtd_id, mtd_id_len + 1);
>  
> +		/* remove existing ones with the same id */
> +		mtd_prev = NULL;
> +		for (mtd = partitions; mtd;)	{
> +			if (strcmp(this_mtd->mtd_id, mtd->mtd_id) == 0) {
> +				printk(KERN_INFO "old entry for mtd id %s "
> +					"exists, removing\n", mtd->mtd_id);
> +				if (mtd_prev) {
> +					mtd_prev->next = mtd->next;
> +					kfree(mtd);
> +					mtd = mtd_prev->next;
> +				} else {
> +					partitions = mtd->next;
> +					kfree(mtd);
> +					mtd = partitions;
> +				}
> +			} else {
> +				mtd_prev = mtd;
> +				mtd = mtd->next;
> +			}
> +		}
> +
>  		/* link into chain */
>  		this_mtd->next = partitions;
>  		partitions = this_mtd;
> @@ -354,12 +374,15 @@ static int parse_cmdline_partitions(struct mtd_info *master,
>   *
>   * This function needs to be visible for bootloaders.
>   */
> -static int mtdpart_setup(char *s)
> +int mtdpart_setup(char *s)
>  {
>  	cmdline = s;
> +	cmdline_parsed = 0;
>  	return 1;
>  }

This global flag is not nice. Not sure what would be a better way, but
may be you have an idea how to do this nicer?

> +EXPORT_SYMBOL(mtdpart_setup);
> +
>  __setup("mtdparts=", mtdpart_setup);
>  
>  static struct mtd_part_parser cmdline_parser = {
> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
> index 0108ed4..b216a92 100644
> --- a/drivers/mtd/onenand/omap2.c
> +++ b/drivers/mtd/onenand/omap2.c
> @@ -45,6 +45,7 @@
>  #include <mach/board.h>
>  
>  #define DRIVER_NAME "omap2-onenand"
> +#define DRIVER_NAME_SIZE sizeof(DRIVER_NAME)

No need to '#define' this, this is really an unnecessary complication
for readability.

>  
>  #define ONENAND_IO_SIZE		SZ_128K
>  #define ONENAND_BUFRAM_SIZE	(1024 * 5)
> @@ -64,6 +65,17 @@ struct omap2_onenand {
>  	int (*setup)(void __iomem *base, int freq);
>  };
>  
> +
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> +extern int mtdpart_setup(char *);
> +
> +static const char *part_probes[] = { "cmdlinepart", NULL };
> +static char parts[256] = DRIVER_NAME ":";
> +
> +module_param_string(parts, parts + DRIVER_NAME_SIZE, 256 - DRIVER_NAME_SIZE, 0);
> +#endif

Please, do not make the module parameter to be compiled conditionally.
If you add this parameter, I think it should be there all the time. Just
use 'select' in Kconfig and make sure the parser is always there.

> +
> +
>  static void omap2_onenand_dma_cb(int lch, u16 ch_status, void *data)
>  {
>  	struct omap2_onenand *c = data;
> @@ -709,6 +721,23 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
>  	}
>  
>  #ifdef CONFIG_MTD_PARTITIONS
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> +	printk(KERN_INFO "parts=%s\n", parts);
> +	/* check module parameter */
> +	if (parts[DRIVER_NAME_SIZE] != '\0') {
> +		/* check parts string */
> +		if (strchr(parts, ';') || strchr(parts + DRIVER_NAME_SIZE, ':')) {
> +			printk(KERN_ERR "onenand_probe: invalid partition parameter\n");
> +		} else {
> +			mtdpart_setup(parts);
> +		}

Unnecessary { }
Please, use %s and __func__ instead of hard-coding function names.

> +	}
> +	r = parse_mtd_partitions(&c->mtd, part_probes, &c->parts, 0);
> +	if (r > 0) {
> +		/* module param or kernel command line arg */
> +		r = add_mtd_partitions(&c->mtd, c->parts, r);
> +	} else
> +#endif
>  	if (pdata->parts != NULL)
>  		r = add_mtd_partitions(&c->mtd, pdata->parts,
>  				       pdata->nr_parts);

This #ifdef injecting is bad, but it should go away if you do what I
suggest above.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
