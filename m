Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2355EC43464
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 07:32:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C984521582
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 07:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KPpXb9iU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C984521582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w+vwb3t6CBsWyt87/diJl4xp1ZqfcGFjaNqFz5WTnGs=; b=KPpXb9iUAhKw1mLOsbpFrtLFh
	qxSAzYlUDRyl497Q4Z+5DEtmOoz7/78B0PUpZCA/xRxET8HhbmBFCMruFBHrBkcdmxWbDq7IZ1Rrk
	ymVRuVKFoZNLjHzc91YA5bEl2uj9S8wW6p/LnWeVTYETF8m9gQQ9GcyfEq/u0YTPmkHJCKXdbTKNK
	hEZDlTZAgrk2C60FAMmssWI152KoqrTvKY0KxEGdjw83x2OmErj0EJfWNpkFXesun+IA++b9pLOIL
	E88Mm6u+QQcYQTBqmtJoizb05pfOX1o27cQmXVdThYnhU0N8Ynpi67y5WRijlbBgW6y+Jf3fy1U1o
	nzgWc4azw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJXLa-0004QT-Cu; Sat, 19 Sep 2020 07:31:50 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJXLX-0004Q9-Vy
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 07:31:48 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 544E068BEB; Sat, 19 Sep 2020 09:31:45 +0200 (CEST)
Date: Sat, 19 Sep 2020 09:31:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 06/12] block: lift setting the readahead size into the
 block layer
Message-ID: <20200919073145.GA8514@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-7-hch@lst.de> <20200917103540.GL7347@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917103540.GL7347@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_033148_149319_E72E03DE 
X-CRM114-Status: GOOD (  23.55  )
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
 linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 12:35:40PM +0200, Jan Kara wrote:
> > diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
> > index 81722cdcf0cb21..95eb35324e1a61 100644
> > --- a/block/blk-sysfs.c
> > +++ b/block/blk-sysfs.c
> > @@ -245,7 +245,6 @@ queue_max_sectors_store(struct request_queue *q, const char *page, size_t count)
> >  
> >  	spin_lock_irq(&q->queue_lock);
> >  	q->limits.max_sectors = max_sectors_kb << 1;
> > -	q->backing_dev_info->io_pages = max_sectors_kb >> (PAGE_SHIFT - 10);
> >  	spin_unlock_irq(&q->queue_lock);
> 
> So do I get it right that readahead won't now be limited if you store lower
> value to max_sectors? Why? I'd consider io_pages a "cached value" of
> max_sectors and thus expect it to change together with max_sectors...

Most to start untangling the bdi from the queue.  But I had to peddle
back on that in the follow on series anyway, so I can add this back.

> > @@ -812,7 +813,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
> >  		disk->flags |= GENHD_FL_SUPPRESS_PARTITION_INFO;
> >  		disk->flags |= GENHD_FL_NO_PART_SCAN;
> >  	} else {
> > -		struct backing_dev_info *bdi = disk->queue->backing_dev_info;
> > +		struct backing_dev_info *bdi = q->backing_dev_info;
> >  		struct device *dev = disk_to_dev(disk);
> >  		int ret;
> 
> Not sure how/why these changes got here... Not that I care too much :)

Because more changes in this area in earlier versions of the patches.
But yes, this shouldn't be here, so I'll drop it.

> > @@ -407,7 +406,6 @@ aoeblk_gdalloc(void *vp)
> >  	WARN_ON(d->gd);
> >  	WARN_ON(d->flags & DEVFL_UP);
> >  	blk_queue_max_hw_sectors(q, BLK_DEF_MAX_SECTORS);
> > -	q->backing_dev_info->ra_pages = READ_AHEAD / PAGE_SIZE;
> >  	d->bufpool = mp;
> >  	d->blkq = gd->queue = q;
> >  	q->queuedata = d;
> 
> Shouldn't AOE set 2MB optimal IO size so that readahead is equivalent to
> previous behavior?

Sure, I'll add a separate patch just for that.

> > diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> > index 1bbdc410ee3c51..ff2101d56cd7f1 100644
> > --- a/drivers/md/bcache/super.c
> > +++ b/drivers/md/bcache/super.c
> > @@ -1427,10 +1427,6 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
> >  	if (ret)
> >  		return ret;
> >  
> > -	dc->disk.disk->queue->backing_dev_info->ra_pages =
> > -		max(dc->disk.disk->queue->backing_dev_info->ra_pages,
> > -		    q->backing_dev_info->ra_pages);
> > -
> 
> So bcache is basically stacking readahead here on top of underlying cache
> device. I don't see this being replicated by your patch so it is lost now?
> Probably this should be replaced by properly inheriting optimal IO size?

Yes, I'll add another patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
