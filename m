Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YM2M8-0007E4-VF
 for linux-mtd@lists.infradead.org; Thu, 12 Feb 2015 22:35:34 +0000
Message-ID: <54DD2A95.3090702@nod.at>
Date: Thu, 12 Feb 2015 23:35:01 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [patch] UBI: block: checking for NULL instead of IS_ERR()
References: <20150205073819.GB27855@mwanda>
In-Reply-To: <20150205073819.GB27855@mwanda>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.02.2015 um 08:38 schrieb Dan Carpenter:
> We recently switched from allocating ->rq using blk_init_queue() to
> use blk_mq_init_queue() so we need to update the error handling to
> check for IS_ERR() instead of NULL.
> 
> Fixes: ff1f48ee3bb3 ('UBI: Block: Add blk-mq support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index 995e61c..d0a9349 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -409,9 +409,9 @@ int ubiblock_create(struct ubi_volume_info *vi)
>  	}
>  
>  	dev->rq = blk_mq_init_queue(&dev->tag_set);
> -	if (!dev->rq) {
> +	if (IS_ERR(dev->rq)) {
>  		dev_err(disk_to_dev(gd), "blk_mq_init_queue failed");
> -		ret = -ENODEV;
> +		ret = PTR_ERR(dev->rq);
>  		goto out_free_tags;
>  	}
>  	blk_queue_max_segments(dev->rq, UBI_MAX_SG_COUNT);

Applied. Thanks Dan!
