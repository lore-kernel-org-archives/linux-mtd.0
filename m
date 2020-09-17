Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FDFC433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 10:36:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CAD62072E
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 10:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S6gzvqhj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CAD62072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9yvF/qqffapgRbsNGJlQZpUN2LfPcfHc6f4+PMZIj1Y=; b=S6gzvqhjYfF26ArXL1tmBOrur
	uSZHxpw1XPNuKi/D+IouxSa9/xezp+XaRa9h7ILkdZNESaBjPcpHopV/CT/omxdqXZBOZ9k7jO7+k
	Dv9ZGVflNcvA+YeeTBRFFhQTNisnjJ/b3AntdKQTrFz7ClTSMawA+jEgu7jtIjyve3JlrdnLMIVvx
	WQtEp1plqclcx37nDre+fh+APV/j3d259gU737zswq4pb19u0JqR7iZTZIjxohJtqpR7t6DdD1jwn
	5Nkc0AkrM1nI7MJSD/YAsgQRlkuikcke4sGPq0t4sKuNxkKFfJvvflCU4A1F3PGOGo/OsMstCN8XQ
	1c8HR9z2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIrGV-0007xt-DK; Thu, 17 Sep 2020 10:35:47 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIrGS-0007wU-5w
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 10:35:45 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F193AF74;
 Thu, 17 Sep 2020 10:36:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E12DF1E12E1; Thu, 17 Sep 2020 12:35:40 +0200 (CEST)
Date: Thu, 17 Sep 2020 12:35:40 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/12] block: lift setting the readahead size into the
 block layer
Message-ID: <20200917103540.GL7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-7-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_063544_479343_E0810AB9 
X-CRM114-Status: GOOD (  30.66  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 10-09-20 16:48:26, Christoph Hellwig wrote:
> Drivers shouldn't really mess with the readahead size, as that is a VM
> concept.  Instead set it based on the optimal I/O size by lifting the
> algorithm from the md driver when registering the disk.  Also set
> bdi->io_pages there as well by applying the same scheme based on
> max_sectors.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-settings.c         |  5 ++---
>  block/blk-sysfs.c            | 10 +++++++++-
>  block/genhd.c                |  5 +++--
>  drivers/block/aoe/aoeblk.c   |  2 --
>  drivers/block/drbd/drbd_nl.c | 12 +-----------
>  drivers/md/bcache/super.c    |  4 ----
>  drivers/md/dm-table.c        |  3 ---
>  drivers/md/raid0.c           | 16 ----------------
>  drivers/md/raid10.c          | 24 +-----------------------
>  drivers/md/raid5.c           | 13 +------------
>  10 files changed, 17 insertions(+), 77 deletions(-)
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 76a7e03bcd6cac..01049e9b998f1d 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -452,6 +452,8 @@ EXPORT_SYMBOL(blk_limits_io_opt);
>  void blk_queue_io_opt(struct request_queue *q, unsigned int opt)
>  {
>  	blk_limits_io_opt(&q->limits, opt);
> +	q->backing_dev_info->ra_pages =
> +		max(queue_io_opt(q) * 2 / PAGE_SIZE, VM_READAHEAD_PAGES);
>  }
>  EXPORT_SYMBOL(blk_queue_io_opt);
>  
> @@ -628,9 +630,6 @@ void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
>  		printk(KERN_NOTICE "%s: Warning: Device %s is misaligned\n",
>  		       top, bottom);
>  	}
> -
> -	t->backing_dev_info->io_pages =
> -		t->limits.max_sectors >> (PAGE_SHIFT - 9);
>  }
>  EXPORT_SYMBOL(disk_stack_limits);
>  
> diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
> index 81722cdcf0cb21..95eb35324e1a61 100644
> --- a/block/blk-sysfs.c
> +++ b/block/blk-sysfs.c
> @@ -245,7 +245,6 @@ queue_max_sectors_store(struct request_queue *q, const char *page, size_t count)
>  
>  	spin_lock_irq(&q->queue_lock);
>  	q->limits.max_sectors = max_sectors_kb << 1;
> -	q->backing_dev_info->io_pages = max_sectors_kb >> (PAGE_SHIFT - 10);
>  	spin_unlock_irq(&q->queue_lock);

So do I get it right that readahead won't now be limited if you store lower
value to max_sectors? Why? I'd consider io_pages a "cached value" of
max_sectors and thus expect it to change together with max_sectors...

> @@ -854,6 +853,15 @@ int blk_register_queue(struct gendisk *disk)
>  		percpu_ref_switch_to_percpu(&q->q_usage_counter);
>  	}
>  
> +	/*
> +	 * For read-ahead of large files to be effective, we need to read ahead
> +	 * at least twice the optimal I/O size.
> +	 */
> +	q->backing_dev_info->ra_pages =
> +		max(queue_io_opt(q) * 2 / PAGE_SIZE, VM_READAHEAD_PAGES);
> +	q->backing_dev_info->io_pages =
> +		queue_max_sectors(q) >> (PAGE_SHIFT - 9);
> +
>  	ret = blk_trace_init_sysfs(dev);
>  	if (ret)
>  		return ret;
> diff --git a/block/genhd.c b/block/genhd.c
> index 081f1039d9367f..db311a14ddc71a 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -772,6 +772,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
>  			      const struct attribute_group **groups,
>  			      bool register_queue)
>  {
> +	struct request_queue *q = disk->queue;
>  	dev_t devt;
>  	int retval;
>  
> @@ -782,7 +783,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
>  	 * registration.
>  	 */
>  	if (register_queue)
> -		elevator_init_mq(disk->queue);
> +		elevator_init_mq(q);
>  
>  	/* minors == 0 indicates to use ext devt from part0 and should
>  	 * be accompanied with EXT_DEVT flag.  Make sure all
> @@ -812,7 +813,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
>  		disk->flags |= GENHD_FL_SUPPRESS_PARTITION_INFO;
>  		disk->flags |= GENHD_FL_NO_PART_SCAN;
>  	} else {
> -		struct backing_dev_info *bdi = disk->queue->backing_dev_info;
> +		struct backing_dev_info *bdi = q->backing_dev_info;
>  		struct device *dev = disk_to_dev(disk);
>  		int ret;

Not sure how/why these changes got here... Not that I care too much :)

>  
> diff --git a/drivers/block/aoe/aoeblk.c b/drivers/block/aoe/aoeblk.c
> index 5ca7216e9e01f3..89b33b402b4e52 100644
> --- a/drivers/block/aoe/aoeblk.c
> +++ b/drivers/block/aoe/aoeblk.c
> @@ -347,7 +347,6 @@ aoeblk_gdalloc(void *vp)
>  	mempool_t *mp;
>  	struct request_queue *q;
>  	struct blk_mq_tag_set *set;
> -	enum { KB = 1024, MB = KB * KB, READ_AHEAD = 2 * MB, };
>  	ulong flags;
>  	int late = 0;
>  	int err;
> @@ -407,7 +406,6 @@ aoeblk_gdalloc(void *vp)
>  	WARN_ON(d->gd);
>  	WARN_ON(d->flags & DEVFL_UP);
>  	blk_queue_max_hw_sectors(q, BLK_DEF_MAX_SECTORS);
> -	q->backing_dev_info->ra_pages = READ_AHEAD / PAGE_SIZE;
>  	d->bufpool = mp;
>  	d->blkq = gd->queue = q;
>  	q->queuedata = d;

Shouldn't AOE set 2MB optimal IO size so that readahead is equivalent to
previous behavior?

> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index 1bbdc410ee3c51..ff2101d56cd7f1 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -1427,10 +1427,6 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
>  	if (ret)
>  		return ret;
>  
> -	dc->disk.disk->queue->backing_dev_info->ra_pages =
> -		max(dc->disk.disk->queue->backing_dev_info->ra_pages,
> -		    q->backing_dev_info->ra_pages);
> -

So bcache is basically stacking readahead here on top of underlying cache
device. I don't see this being replicated by your patch so it is lost now?
Probably this should be replaced by properly inheriting optimal IO size?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
