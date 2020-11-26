Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D0EC56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 14:55:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E54320B80
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 14:55:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Be2HCfbk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E54320B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N44cXrnvka6eL3cOOH2JzT/8bEZiyOoc8XHjj5czStA=; b=Be2HCfbkcj9z2I20cPHVNbwVn
	Nq+yh5GgET8aI+9RXUaQIisIWf9+dcIQla2irpr0cD/g0i7dKrCClsk6hAOMEA7b/UN7OeN3uXqiv
	jojf9XqHQtDN2M+zunkRSw6EIlef7DBhUXmNCpNPd43PExEbpAw/x52uCbjRsFcf+2YEb4eDVgnyL
	SGD3g9fLw88ISNrFi7jw1xRPNs92tT0+Dte3RU5Oz+x/c6R86L1Dowuit8nknnuzE4d0yu2BzY8Pw
	bx1tHukyq8MTxTNUpZ3DPUYwp8/AhChYJN030UTCYIzOSByODOzdEZ1rSvuZC+EvV3pZJgHGDtNMO
	cJ7K4Q8Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiIgA-0006zW-Hx; Thu, 26 Nov 2020 14:55:26 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiIg7-0006yl-OK
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 14:55:24 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75E3FADB3;
 Thu, 26 Nov 2020 14:55:22 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E17411E10D0; Thu, 26 Nov 2020 15:55:21 +0100 (CET)
Date: Thu, 26 Nov 2020 15:55:21 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 20/44] block: refactor blkdev_get
Message-ID: <20201126145521.GG422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-21-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-21-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_095524_111452_71CFA127 
X-CRM114-Status: GOOD (  36.71  )
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

On Thu 26-11-20 14:03:58, Christoph Hellwig wrote:
> Move more code that is only run on the outer open but not the open of
> the underlying whole device when opening a partition into blkdev_get,
> which leads to a much easier to follow structure.
> 
> This allows to simplify the disk and module refcounting so that one
> reference is held for each open, similar to what we do with normal
> file operations.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Tejun Heo <tj@kernel.org>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza


> ---
>  fs/block_dev.c | 185 +++++++++++++++++++++++--------------------------
>  1 file changed, 86 insertions(+), 99 deletions(-)
> 
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 41c50cfba864e2..86a61a2141f642 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -1403,46 +1403,12 @@ EXPORT_SYMBOL_GPL(bdev_disk_changed);
>   *  mutex_lock(part->bd_mutex)
>   *    mutex_lock_nested(whole->bd_mutex, 1)
>   */
> -
> -static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
> -		int for_part)
> +static int __blkdev_get(struct block_device *bdev, struct gendisk *disk,
> +		int partno, fmode_t mode)
>  {
> -	struct block_device *whole = NULL, *claiming = NULL;
> -	struct gendisk *disk;
>  	int ret;
> -	int partno;
> -	bool first_open = false, unblock_events = true, need_restart;
> -
> - restart:
> -	need_restart = false;
> -	ret = -ENXIO;
> -	disk = bdev_get_gendisk(bdev, &partno);
> -	if (!disk)
> -		goto out;
> -
> -	if (partno) {
> -		whole = bdget_disk(disk, 0);
> -		if (!whole) {
> -			ret = -ENOMEM;
> -			goto out_put_disk;
> -		}
> -	}
>  
> -	if (!for_part && (mode & FMODE_EXCL)) {
> -		WARN_ON_ONCE(!holder);
> -		if (whole)
> -			claiming = whole;
> -		else
> -			claiming = bdev;
> -		ret = bd_prepare_to_claim(bdev, claiming, holder);
> -		if (ret)
> -			goto out_put_whole;
> -	}
> -
> -	disk_block_events(disk);
> -	mutex_lock_nested(&bdev->bd_mutex, for_part);
>  	if (!bdev->bd_openers) {
> -		first_open = true;
>  		bdev->bd_disk = disk;
>  		bdev->bd_contains = bdev;
>  		bdev->bd_partno = partno;
> @@ -1454,15 +1420,8 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
>  				goto out_clear;
>  
>  			ret = 0;
> -			if (disk->fops->open) {
> +			if (disk->fops->open)
>  				ret = disk->fops->open(bdev, mode);
> -				/*
> -				 * If we lost a race with 'disk' being deleted,
> -				 * try again.  See md.c
> -				 */
> -				if (ret == -ERESTARTSYS)
> -					need_restart = true;
> -			}
>  
>  			if (!ret) {
>  				bd_set_nr_sectors(bdev, get_capacity(disk));
> @@ -1482,14 +1441,23 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
>  			if (ret)
>  				goto out_clear;
>  		} else {
> -			BUG_ON(for_part);
> -			ret = __blkdev_get(whole, mode, NULL, 1);
> -			if (ret)
> +			struct block_device *whole = bdget_disk(disk, 0);
> +
> +			mutex_lock_nested(&whole->bd_mutex, 1);
> +			ret = __blkdev_get(whole, disk, 0, mode);
> +			if (ret) {
> +				mutex_unlock(&whole->bd_mutex);
> +				bdput(whole);
>  				goto out_clear;
> -			bdev->bd_contains = bdgrab(whole);
> +			}
> +			whole->bd_part_count++;
> +			mutex_unlock(&whole->bd_mutex);
> +
> +			bdev->bd_contains = whole;
>  			bdev->bd_part = disk_get_part(disk, partno);
>  			if (!(disk->flags & GENHD_FL_UP) ||
>  			    !bdev->bd_part || !bdev->bd_part->nr_sects) {
> +				__blkdev_put(whole, mode, 1);
>  				ret = -ENXIO;
>  				goto out_clear;
>  			}
> @@ -1509,58 +1477,17 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
>  			    (!ret || ret == -ENOMEDIUM))
>  				bdev_disk_changed(bdev, ret == -ENOMEDIUM);
>  			if (ret)
> -				goto out_unlock_bdev;
> +				return ret;
>  		}
>  	}
>  	bdev->bd_openers++;
> -	if (for_part)
> -		bdev->bd_part_count++;
> -	if (claiming)
> -		bd_finish_claiming(bdev, claiming, holder);
> -
> -	/*
> -	 * Block event polling for write claims if requested.  Any write holder
> -	 * makes the write_holder state stick until all are released.  This is
> -	 * good enough and tracking individual writeable reference is too
> -	 * fragile given the way @mode is used in blkdev_get/put().
> -	 */
> -	if (claiming && (mode & FMODE_WRITE) && !bdev->bd_write_holder &&
> -	    (disk->flags & GENHD_FL_BLOCK_EVENTS_ON_EXCL_WRITE)) {
> -		bdev->bd_write_holder = true;
> -		unblock_events = false;
> -	}
> -	mutex_unlock(&bdev->bd_mutex);
> -
> -	if (unblock_events)
> -		disk_unblock_events(disk);
> -
> -	/* only one opener holds refs to the module and disk */
> -	if (!first_open)
> -		put_disk_and_module(disk);
> -	if (whole)
> -		bdput(whole);
>  	return 0;
>  
>   out_clear:
>  	disk_put_part(bdev->bd_part);
>  	bdev->bd_disk = NULL;
>  	bdev->bd_part = NULL;
> -	if (bdev != bdev->bd_contains)
> -		__blkdev_put(bdev->bd_contains, mode, 1);
>  	bdev->bd_contains = NULL;
> - out_unlock_bdev:
> -	if (claiming)
> -		bd_abort_claiming(bdev, claiming, holder);
> -	mutex_unlock(&bdev->bd_mutex);
> -	disk_unblock_events(disk);
> - out_put_whole:
> - 	if (whole)
> -		bdput(whole);
> - out_put_disk:
> -	put_disk_and_module(disk);
> -	if (need_restart)
> -		goto restart;
> - out:
>  	return ret;
>  }
>  
> @@ -1585,7 +1512,12 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
>   */
>  static int blkdev_get(struct block_device *bdev, fmode_t mode, void *holder)
>  {
> -	int ret, perm = 0;
> +	struct block_device *claiming;
> +	bool unblock_events = true;
> +	struct gendisk *disk;
> +	int perm = 0;
> +	int partno;
> +	int ret;
>  
>  	if (mode & FMODE_READ)
>  		perm |= MAY_READ;
> @@ -1595,13 +1527,67 @@ static int blkdev_get(struct block_device *bdev, fmode_t mode, void *holder)
>  	if (ret)
>  		goto bdput;
>  
> -	ret =__blkdev_get(bdev, mode, holder, 0);
> -	if (ret)
> +	/*
> +	 * If we lost a race with 'disk' being deleted, try again.  See md.c.
> +	 */
> +retry:
> +	ret = -ENXIO;
> +	disk = bdev_get_gendisk(bdev, &partno);
> +	if (!disk)
>  		goto bdput;
> -	return 0;
>  
> +	if (mode & FMODE_EXCL) {
> +		WARN_ON_ONCE(!holder);
> +	
> +		ret = -ENOMEM;
> +		claiming = bdget_disk(disk, 0);
> +		if (!claiming)
> +			goto put_disk;
> +		ret = bd_prepare_to_claim(bdev, claiming, holder);
> +		if (ret)
> +			goto put_claiming;
> +	}
> +
> +	disk_block_events(disk);
> +
> +	mutex_lock(&bdev->bd_mutex);
> +	ret =__blkdev_get(bdev, disk, partno, mode);
> +	if (!(mode & FMODE_EXCL)) {
> +		; /* nothing to do here */
> +	} else if (ret) {
> +		bd_abort_claiming(bdev, claiming, holder);
> +	} else {
> +		bd_finish_claiming(bdev, claiming, holder);
> +
> +		/*
> +		 * Block event polling for write claims if requested.  Any write
> +		 * holder makes the write_holder state stick until all are
> +		 * released.  This is good enough and tracking individual
> +		 * writeable reference is too fragile given the way @mode is
> +		 * used in blkdev_get/put().
> +		 */
> +		if ((mode & FMODE_WRITE) && !bdev->bd_write_holder &&
> +		    (disk->flags & GENHD_FL_BLOCK_EVENTS_ON_EXCL_WRITE)) {
> +			bdev->bd_write_holder = true;
> +			unblock_events = false;
> +		}
> +	}
> +	mutex_unlock(&bdev->bd_mutex);
> +
> +	if (unblock_events)
> +		disk_unblock_events(disk);
> +
> +put_claiming:
> +	if (mode & FMODE_EXCL)
> +		bdput(claiming);
> +put_disk:
> +	if (ret)
> +		put_disk_and_module(disk);
> +	if (ret == -ERESTARTSYS)
> +		goto retry;
>  bdput:
> -	bdput(bdev);
> +	if (ret)
> +		bdput(bdev);
>  	return ret;
>  }
>  
> @@ -1749,8 +1735,6 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
>  		if (bdev_is_partition(bdev))
>  			victim = bdev->bd_contains;
>  		bdev->bd_contains = NULL;
> -
> -		put_disk_and_module(disk);
>  	} else {
>  		if (!bdev_is_partition(bdev) && disk->fops->release)
>  			disk->fops->release(disk, mode);
> @@ -1763,6 +1747,8 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
>  
>  void blkdev_put(struct block_device *bdev, fmode_t mode)
>  {
> +	struct gendisk *disk = bdev->bd_disk;
> +
>  	mutex_lock(&bdev->bd_mutex);
>  
>  	if (mode & FMODE_EXCL) {
> @@ -1791,7 +1777,7 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
>  		 * unblock evpoll if it was a write holder.
>  		 */
>  		if (bdev_free && bdev->bd_write_holder) {
> -			disk_unblock_events(bdev->bd_disk);
> +			disk_unblock_events(disk);
>  			bdev->bd_write_holder = false;
>  		}
>  	}
> @@ -1801,11 +1787,12 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
>  	 * event.  This is to ensure detection of media removal commanded
>  	 * from userland - e.g. eject(1).
>  	 */
> -	disk_flush_events(bdev->bd_disk, DISK_EVENT_MEDIA_CHANGE);
> +	disk_flush_events(disk, DISK_EVENT_MEDIA_CHANGE);
>  
>  	mutex_unlock(&bdev->bd_mutex);
>  
>  	__blkdev_put(bdev, mode, 0);
> +	put_disk_and_module(disk);
>  }
>  EXPORT_SYMBOL(blkdev_put);
>  
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
