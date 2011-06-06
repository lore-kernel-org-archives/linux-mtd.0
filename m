Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTUkz-0005OG-Nw
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 08:01:54 +0000
Received: by fxm14 with SMTP id 14so3318179fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 01:01:50 -0700 (PDT)
Subject: Re: [PATCH 041/104] mtd: prepare to convert
	of_mtd_parse_partitions to partition parser
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-7-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
	<1307026293-8535-7-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 10:57:34 +0300
Message-ID: <1307347054.3135.28.camel@localhost>
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

On Thu, 2011-06-02 at 18:51 +0400, Dmitry Eremin-Solenikov wrote:
> Prepare to convert of_mtd_parse_partitions() to usual partitions parser:
> 1) Register ofpart parser
> 2) Internally don't use passed device for error printing
> 3) Add device_node to mtd_info struct
> 4) Move of_mtd_parse_partitions from __devinit to common text section
> 5) add ofpart to the default list of partition parsers
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Good idea, but 

>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> @@ -446,6 +447,10 @@ int mtd_device_register(struct mtd_info *master,
>  			const struct mtd_partition *parts,
>  			int nr_parts)
>  {
> +#ifdef CONFIG_OF
> +	if (master->node)
> +		of_node_get(master->node);
> +#endif

Could all the OF-specific things be done in the ofpart.c ?

> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -171,6 +171,9 @@ struct mtd_info {
>  	// Kernel-only stuff starts here.
>  	const char *name;
>  	int index;
> +#ifdef CONFIG_OF
> +	struct device_node *node;
> +#endif

And designe-wise this does not look like a good idea to have such fields
in mtd_info ... Who initializes this "node" field?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
