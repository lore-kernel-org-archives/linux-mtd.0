Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2F9C63697
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 15:06:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53C7C20B80
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 15:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X4LrD2s8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53C7C20B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TSqO04RUABc/YZsjzmnALQ7/6eN0zPaTI2O/mtMwPtY=; b=X4LrD2s8UoxSh4o4+aH+zosDs
	YwbchEplMjMLaZ3PblTURXvjumvpkE/AjJPEV2/9+ufYouG1VHSl49ndVLfQjo5wg6hzYuxxVy1ne
	IrBhL1cah0Yw5+k/hkD0GsO6LbZg50icgpjhxDzBF2S+n8rDQGGYzp2mblgxnOCXs4TmjIF0xF9O6
	eP/1hicBN2YfZzV7ZpE0hrywiBAs5bQWtMdgyfc4SEoIcOB1WSthABJZ0oop7t9OuKdPYfysiNIA/
	TiLyB/mGXCARa4lUqZHURIjXbovO/Q442jIfnBe9JjRNB2SdWFRj4Om0ikqUixOJf2DhcAlll3HDo
	lZmgxfFfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiIq6-0000Oq-AG; Thu, 26 Nov 2020 15:05:42 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiIq2-0000Nx-To
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 15:05:39 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A9DEACE0;
 Thu, 26 Nov 2020 15:05:37 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id C51F51E10D0; Thu, 26 Nov 2020 16:05:36 +0100 (CET)
Date: Thu, 26 Nov 2020 16:05:36 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 21/44] block: move bdput() to the callers of __blkdev_get
Message-ID: <20201126150536.GH422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-22-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-22-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_100539_163619_6A534005 
X-CRM114-Status: GOOD (  20.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 linux-bcache@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 26-11-20 14:03:59, Christoph Hellwig wrote:
> This will allow for a more symmetric calling convention going forward.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/block_dev.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 86a61a2141f642..d0783c55a0ce65 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -1458,6 +1458,7 @@ static int __blkdev_get(struct block_device *bdev, struct gendisk *disk,
>  			if (!(disk->flags & GENHD_FL_UP) ||
>  			    !bdev->bd_part || !bdev->bd_part->nr_sects) {
>  				__blkdev_put(whole, mode, 1);
> +				bdput(whole);
>  				ret = -ENXIO;
>  				goto out_clear;
>  			}
> @@ -1740,9 +1741,10 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
>  			disk->fops->release(disk, mode);
>  	}
>  	mutex_unlock(&bdev->bd_mutex);
> -	bdput(bdev);
> -	if (victim)
> +	if (victim) {
>  		__blkdev_put(victim, mode, 1);
> +		bdput(victim);
> +	}
>  }
>  
>  void blkdev_put(struct block_device *bdev, fmode_t mode)
> @@ -1792,6 +1794,7 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
>  	mutex_unlock(&bdev->bd_mutex);
>  
>  	__blkdev_put(bdev, mode, 0);
> +	bdput(bdev);
>  	put_disk_and_module(disk);
>  }
>  EXPORT_SYMBOL(blkdev_put);
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
