Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTU5m-0004Za-Fz
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 07:19:19 +0000
Received: by wwb39 with SMTP id 39so2726893wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 00:19:16 -0700 (PDT)
Subject: Re: [PATCH 006/104] mtdpart: default to cmdlinepart, NULL
	partitions probing
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-4-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
	<1307026293-8535-4-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 10:14:59 +0300
Message-ID: <1307344499.3135.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
> Lots of MTD devices default to cmdlinepart, NULL as partition parsing
> order. Make it a default.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  drivers/mtd/mtdpart.c |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 630be3e..3477e16 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -712,12 +712,17 @@ int deregister_mtd_parser(struct mtd_part_parser *p)
>  }
>  EXPORT_SYMBOL_GPL(deregister_mtd_parser);
>  
> +static const char *default_mtd_part_types[] = {"cmdlinepart", NULL};
> +
>  int parse_mtd_partitions(struct mtd_info *master, const char **types,
>  			 struct mtd_partition **pparts, unsigned long origin)
>  {
>  	struct mtd_part_parser *parser;
>  	int ret = 0;
>  
> +	if (!types)
> +		types = default_mtd_part_types;
> +
>  	for ( ; ret <= 0 && *types; types++) {
>  		parser = get_partition_parser(*types);
>  		if (!parser && !request_module("%s", *types))

Pushed patches 4 and 5 to l2-mtd-2.6.git. Going to push this one as
well, but I would be nice go put a piece of descriptive comment above
'parse_mtd_partitions()', preferably a nice kerneldoc comment. As a
separate patch.

Anyway, pushing this one to the l2 tree as well.

P.S. Also added an "mtd:" prefix.
