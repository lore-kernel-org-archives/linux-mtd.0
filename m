Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIM9D-00007V-7u
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:36:51 +0000
Received: by eyh6 with SMTP id 6so1114359eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 07:36:49 -0700 (PDT)
Subject: Re: [RFC PATCH 9/9] nand/denali: support MTD partitioning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1304692143-22432-10-git-send-email-jamie@jamieiles.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
	<1304692143-22432-10-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 May 2011 17:33:15 +0300
Message-ID: <1304692395.7222.65.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	chuanxiao.dong@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-06 at 15:29 +0100, Jamie Iles wrote:
> If CONFIG_MTD_PARTITION is enabled then take the partitions from the
> platform data.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> ---
>  drivers/mtd/nand/denali.c            |    8 ++++++++
>  include/linux/platform_data/denali.h |    6 +++++-
>  2 files changed, 13 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index c79009f..ae954de 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -23,6 +23,7 @@
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
>  #include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/denali.h>
>  
> @@ -1563,7 +1564,14 @@ int denali_init(struct denali_nand_info *denali)
>  		goto failed_req_irq;
>  	}
>  
> +#ifdef CONFIG_MTD_PARTITIONS
> +	if (pdata && pdata->parts) {
> +		ret = add_mtd_partitions(&denali->mtd, pdata->parts,
> +					 pdata->nr_parts);
> +	} else
> +#endif /* CONFIG_MTD_PARTITIONS */
>  	ret = add_mtd_device(&denali->mtd);
> +

Oops:
http://www.linux-mtd.infradead.org/doc/general.html#L_partitions_ban

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
