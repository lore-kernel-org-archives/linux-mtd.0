Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B635EC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Oct 2023 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JLXCnc5WpTo0FlyYctyCYyGAWkKq4rUYWwvyyb9+b2A=; b=sZRgy8KBUKeX85
	Ox2zCJc3+6JUYi25/HGTCKvjUXZ2oSTv4U63X/qk6Doq94/xMrswSoIS0V/+/F3F5cwrbX3ZwTrnu
	+kk+vO69q/4nQI6P/6W8ER+sl4szQsPXRc5IUW1pNM35wUpDiMZTLqfY9YRFGQZpbNkqZB0+6jeYC
	tlwNTLYTmN14uDDZFJUm2mToB71rRBxEjdg8CsFuzW3bZ6crq8C0aAtIcE+dr997/rgzLE4qePSY5
	S+OBrFTh0u9GrGVZ5q94mw2I1w3666AeGqVsUu7DY+eT/jAra6MrAnMXfU2ntZUexu6g9fsM5JBB5
	kexChShMyJJKOpPnONSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxStg-003SZP-2x;
	Mon, 30 Oct 2023 14:05:40 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSte-003SY3-0a
	for linux-mtd@lists.infradead.org;
	Mon, 30 Oct 2023 14:05:39 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1qxStJ-0006QX-0b;
	Mon, 30 Oct 2023 14:05:17 +0000
Date: Mon, 30 Oct 2023 14:05:14 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Christoph Hellwig <hch@lst.de>
Cc: axboe@kernel.dk, richard@nod.at, miquel.raynal@bootlin.com,
	vigneshr@ti.com, linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org, zhongjinghua@huawei.com,
	yukuai1@huaweicloud.com
Subject: Re: [PATCH 1/2] ubi: block: don't use gendisk->first_minor for the
 idr_alloc return value
Message-ID: <ZT-4GlwthnOgEhqc@makrotopia.org>
References: <20231030140106.1393384-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231030140106.1393384-1-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_070538_218714_5FC89DD9 
X-CRM114-Status: GOOD (  18.20  )
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

On Mon, Oct 30, 2023 at 03:01:05PM +0100, Christoph Hellwig wrote:
> idr_alloc returns an int that is either a negative errno, or the
> identifier actually allocated.  Use signed integer ret variable to
> catch the return value and only assign it to gd->first_minor to prepare
> for marking the first_minor field in the gendisk structure as unsigned.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/mtd/ubi/block.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index 437c5b83ffe513..51d00b518d3197 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -402,13 +402,14 @@ int ubiblock_create(struct ubi_volume_info *vi)
>  	gd->fops = &ubiblock_ops;
>  	gd->major = ubiblock_major;
>  	gd->minors = 1;
> -	gd->first_minor = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
> -	if (gd->first_minor < 0) {
> +	ret = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
> +	if (ret < 0) {
>  		dev_err(disk_to_dev(gd),
>  			"block: dynamic minor allocation failed");
>  		ret = -ENODEV;
>  		goto out_cleanup_disk;
>  	}
> +	gd->first_minor  = ret;
>  	gd->flags |= GENHD_FL_NO_PART;
>  	gd->private_data = dev;
>  	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
> -- 
> 2.39.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
