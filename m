Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD200C63697
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:04:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A0172158C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:04:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Izaph8j7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A0172158C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w2bPf3znliDJP5nZUD/WOFru71aG+L+uAxcQBz4dZkw=; b=Izaph8j7WuyMsvM7FUUqTYJEY
	wNk7eLhymtduFlbyzqWmZUR7xCwThRXKfFusfPxnmbwCh/1pDB+ocwFFAYboQi0YuXMIRZkT4SfYo
	t6Z3dQalFmUJ4RoAk/9z/jfKeOT9UQGDeJLeFAecdI5GTvBcXVpwI3HJCAoKHFUgLz56SYQ676yKh
	EqarAAnKVw5DclMb/Lzm6Roiws457gKHLqQ6XKX4dpow3hYH3p0ryVyIdTvCZz/lfcSsv/dqsE4ST
	IZqvkaKPZWDaysPTpAFHPZ5AibH0yV71qysv5BegRLb+p8/Bp4VD7Y4xMVvvtanDOVGeY1MBt5i9S
	u1/66Qc5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiKfw-0005Io-VS; Thu, 26 Nov 2020 17:03:21 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiKfu-0005Hd-NP
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 17:03:19 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDDFCACC4;
 Thu, 26 Nov 2020 17:03:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 30EB01E10D0; Thu, 26 Nov 2020 18:03:15 +0100 (CET)
Date: Thu, 26 Nov 2020 18:03:15 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 35/44] block: move the policy field to struct block_device
Message-ID: <20201126170315.GU422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-36-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-36-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_120319_070254_4B5E53C0 
X-CRM114-Status: GOOD (  27.97  )
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

On Thu 26-11-20 14:04:13, Christoph Hellwig wrote:
> Move the policy field to struct block_device and rename it to the
> more descriptive bd_read_only.  Also turn the field into a bool as it
> is used as such.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/blk-core.c          | 2 +-
>  block/genhd.c             | 8 ++++----
>  block/ioctl.c             | 2 +-
>  block/partitions/core.c   | 4 ++--
>  include/linux/blk_types.h | 1 +
>  include/linux/genhd.h     | 4 ++--
>  6 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 9121390be97a76..d64ffcb6f9ae5d 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -696,7 +696,7 @@ static inline bool bio_check_ro(struct bio *bio, struct hd_struct *part)
>  {
>  	const int op = bio_op(bio);
>  
> -	if (part->policy && op_is_write(op)) {
> +	if (part->bdev->bd_read_only && op_is_write(op)) {
>  		char b[BDEVNAME_SIZE];
>  
>  		if (op_is_flush(bio->bi_opf) && !bio_sectors(bio))
> diff --git a/block/genhd.c b/block/genhd.c
> index 0371558ccde14c..ae312ccc6dd7c0 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -1679,14 +1679,14 @@ void set_disk_ro(struct gendisk *disk, int flag)
>  	struct disk_part_iter piter;
>  	struct hd_struct *part;
>  
> -	if (disk->part0.policy != flag) {
> +	if (disk->part0.bdev->bd_read_only != flag) {
>  		set_disk_ro_uevent(disk, flag);
> -		disk->part0.policy = flag;
> +		disk->part0.bdev->bd_read_only = flag;
>  	}
>  
>  	disk_part_iter_init(&piter, disk, DISK_PITER_INCL_EMPTY);
>  	while ((part = disk_part_iter_next(&piter)))
> -		part->policy = flag;
> +		part->bdev->bd_read_only = flag;
>  	disk_part_iter_exit(&piter);
>  }
>  
> @@ -1696,7 +1696,7 @@ int bdev_read_only(struct block_device *bdev)
>  {
>  	if (!bdev)
>  		return 0;
> -	return bdev->bd_part->policy;
> +	return bdev->bd_read_only;
>  }
>  
>  EXPORT_SYMBOL(bdev_read_only);
> diff --git a/block/ioctl.c b/block/ioctl.c
> index a6d8171221c7dc..d61d652078f41c 100644
> --- a/block/ioctl.c
> +++ b/block/ioctl.c
> @@ -345,7 +345,7 @@ static int blkdev_roset(struct block_device *bdev, fmode_t mode,
>  		if (ret)
>  			return ret;
>  	}
> -	bdev->bd_part->policy = n;
> +	bdev->bd_read_only = n;
>  	return 0;
>  }
>  
> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index d1093adf2570e2..f397ec9922bd6e 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -199,7 +199,7 @@ static ssize_t part_ro_show(struct device *dev,
>  			    struct device_attribute *attr, char *buf)
>  {
>  	struct hd_struct *p = dev_to_part(dev);
> -	return sprintf(buf, "%d\n", p->policy ? 1 : 0);
> +	return sprintf(buf, "%d\n", p->bdev->bd_read_only);
>  }
>  
>  static ssize_t part_alignment_offset_show(struct device *dev,
> @@ -420,7 +420,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
>  	bdev->bd_start_sect = start;
>  	bdev_set_nr_sectors(bdev, len);
>  	p->partno = partno;
> -	p->policy = get_disk_ro(disk);
> +	bdev->bd_read_only = get_disk_ro(disk);
>  
>  	if (info) {
>  		err = -ENOMEM;
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index b237f1e4081405..758cf71c9aa2a6 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -23,6 +23,7 @@ struct block_device {
>  	sector_t		bd_start_sect;
>  	struct disk_stats __percpu *bd_stats;
>  	unsigned long		bd_stamp;
> +	bool			bd_read_only;	/* read-only policy */
>  	dev_t			bd_dev;
>  	int			bd_openers;
>  	struct inode *		bd_inode;	/* will die */
> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index 349cf6403ccddc..dcbf9ef7610ea6 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -55,7 +55,7 @@ struct hd_struct {
>  
>  	struct block_device *bdev;
>  	struct device __dev;
> -	int policy, partno;
> +	int partno;
>  	struct rcu_work rcu_work;
>  };
>  
> @@ -278,7 +278,7 @@ extern void set_disk_ro(struct gendisk *disk, int flag);
>  
>  static inline int get_disk_ro(struct gendisk *disk)
>  {
> -	return disk->part0.policy;
> +	return disk->part0.bdev->bd_read_only;
>  }
>  
>  extern void disk_block_events(struct gendisk *disk);
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
