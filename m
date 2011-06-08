Received: from mv-drv-hcb004.ocn.ad.jp ([118.23.109.134])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUJ9R-0004fv-Vy
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 13:50:30 +0000
Date: Wed, 08 Jun 2011 22:50:21 +0900 (JST)
Message-Id: <20110608.225021.214244518.anemo@mba.ocn.ne.jp>
To: dbaryshkov@gmail.com
Subject: Re: [PATCH 18/44] mtd: rbtx4939-flash.c: use mtd_device_parse_register
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1307453803-31950-19-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-19-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue,  7 Jun 2011 17:36:17 +0400, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
> @@ -106,18 +102,8 @@ static int rbtx4939_flash_probe(struct platform_device *dev)
>  	info->mtd->owner = THIS_MODULE;
>  	if (err)
>  		goto err_out;
> -	err = parse_mtd_partitions(info->mtd, NULL, &info->parts, 0);
> -	if (err > 0) {
> -		mtd_device_register(info->mtd, info->parts, err);
> -		info->nr_parts = err;
> -		return 0;
> -	}
> -
> -	if (pdata->nr_parts) {
> -		pr_notice("Using rbtx4939 partition information\n");
> -		mtd_device_register(info->mtd, pdata->parts, pdata->nr_parts);
> -		return 0;
> -	}
> +	err = mtd_device_parse_register(info->mtd, NULL, 0,
> +			pdata->parts, pdata->nr_parts);
>  
>  	mtd_device_register(info->mtd, NULL, 0);
>  	return 0;

The last mtd_device_register() call should be removed too?

---
Atsushi Nemoto
