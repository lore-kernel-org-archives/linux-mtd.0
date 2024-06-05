Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD25C25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDJqHmyohYB4lH+hc5KGsdM4UvIWR29rfcQDeJMtiQs=; b=ibffywzYKWxe0i
	bQWnhlGX8WkdGEycY5mqyWZiX8rOWjXkltlR7TaSFC1hj768X+OEKO96toTsJZkt8Umj5yESLuCgv
	FFdm5p+MM75hmujSAZyMrpkQb2QW2KlB/sBIAo4ulj27KYuA8n3S+nY5z1+UN/3Kz3VXnsDdt/78x
	XWIhdQwUn7naYN7QombC0PadSw6+iTbgGH0l2snPVBo702eXtAF+Eqk9qXDq9fW132A3h/0Jgv2Tn
	tFaae+maf45NFsy2xdyjGCd+JqGDYsxkiiU4KfTfGdAKzArvzakqf9xi9CFN5MtjEBT1nSlN2wP1K
	BLwM2oQrgEyUcPGjt9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpjc-00000005zQe-0yK2;
	Wed, 05 Jun 2024 12:27:20 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpjX-00000005zN5-0it1
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 12:27:18 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sEpjH-000000005ku-0xUu;
	Wed, 05 Jun 2024 12:26:59 +0000
Date: Wed, 5 Jun 2024 13:26:55 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linan666@huaweicloud.com
Cc: richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
	chaitanya.kulkarni@wdc.com, axboe@kernel.dk,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	chengzhihao1@huawei.com, yukuai3@huawei.com, yi.zhang@huawei.com,
	houtao1@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH v3] ubi: block: fix null-pointer-dereference in
 ubiblock_create()
Message-ID: <ZmBZj6wnh_UvuabD@makrotopia.org>
References: <20240522171035.3776026-1-linan666@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240522171035.3776026-1-linan666@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_052715_259846_233E20F0 
X-CRM114-Status: GOOD (  21.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 23, 2024 at 01:10:35AM +0800, linan666@huaweicloud.com wrote:
> From: Li Nan <linan122@huawei.com>
> 
> Similar to commit adbf4c4954e3 ("ubi: block: fix memleak in
> ubiblock_create()"), 'dev->gd' is not assigned but dereferenced if
> blk_mq_alloc_tag_set() fails, and leading to a null-pointer-dereference.
> Fix it by using pr_err() and variable 'dev' to print error log.
> 
> Additionally, the log in the error handle path of idr_alloc() has
> been improved by using pr_err(), too. Before initializing device
> name, using dev_err() will print error log with 'null' instead of
> the actual device name, like this:
>   block (null): ...
>         ~~~~~~
> It is unclear. Using pr_err() can print more details of the device.
> The improved log is:
>   ubiblock0_0: ...
> 
> Fixes: 77567b25ab9f ("ubi: use blk_mq_alloc_disk and blk_cleanup_disk")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Li Nan <linan122@huawei.com>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> ---
> v3: spliting this patch into two in v2 is not a good idea. This version
> is consistent with v1, but only optimizes the commit message.
> 
>  drivers/mtd/ubi/block.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index f82e3423acb9..bf7308e8ec2f 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -390,7 +390,8 @@ int ubiblock_create(struct ubi_volume_info *vi)
>  
>  	ret = blk_mq_alloc_tag_set(&dev->tag_set);
>  	if (ret) {
> -		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
> +		pr_err("ubiblock%d_%d: blk_mq_alloc_tag_set failed\n",
> +			dev->ubi_num, dev->vol_id);
>  		goto out_free_dev;
>  	}
>  
> @@ -407,8 +408,8 @@ int ubiblock_create(struct ubi_volume_info *vi)
>  	gd->minors = 1;
>  	gd->first_minor = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
>  	if (gd->first_minor < 0) {
> -		dev_err(disk_to_dev(gd),
> -			"block: dynamic minor allocation failed");
> +		pr_err("ubiblock%d_%d: block: dynamic minor allocation failed\n",
> +			dev->ubi_num, dev->vol_id);
>  		ret = -ENODEV;
>  		goto out_cleanup_disk;
>  	}
> -- 
> 2.39.2
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
