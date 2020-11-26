Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C88C56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:48:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DAD52053B
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MfJJemxs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DAD52053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZEkap6czkJMRj+CACzQgJq8LzDH4ie9t87+y3xP1zmY=; b=MfJJemxsDLS3KVKUIK/T5aZ3s
	btfOwp5Ujmv7HaaF91Eq71NVONlMHVOOzcLFEZQiIZFnbgcba3Rkx/wLJ0/O+bViI980fYVinxbwp
	4NgyL40hgDdh08jhv1k0Sv7jPC01L98vL6AN/sHOMj/wvky2QtP/1L6GovnbIrYHsULqyDXvCx0/Z
	aDBlXH69UbUZ6FA2KuiYmX4wox4ZdTE/VG1NY5k3PbEEEvNz+PzeHtannEuvxr4XkWvhG58lFJy4S
	7fZXgDeC/4SJoSFaZCjKipHFRiNsfNUs6i2fBwhp9Sxi5UwTOyzCfmtI08GxILy+51uNnL7TKQtUz
	3l0o0JIvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiLN9-0002WP-5X; Thu, 26 Nov 2020 17:47:59 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiLN6-0002V5-6H
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 17:47:57 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14588ACA9;
 Thu, 26 Nov 2020 17:47:55 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id AC5821E10D0; Thu, 26 Nov 2020 18:47:54 +0100 (CET)
Date: Thu, 26 Nov 2020 18:47:54 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 39/44] block: pass a block_device to blk_alloc_devt
Message-ID: <20201126174754.GY422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-40-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-40-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_124756_506389_042B1747 
X-CRM114-Status: GOOD (  24.60  )
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

On Thu 26-11-20 14:04:17, Christoph Hellwig wrote:
> Pass the block_device actually needed instead of the hd_struct.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/blk.h             |  2 +-
>  block/genhd.c           | 14 +++++++-------
>  block/partitions/core.c |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/block/blk.h b/block/blk.h
> index d5bf8f3a078186..9657c6da7c770c 100644
> --- a/block/blk.h
> +++ b/block/blk.h
> @@ -350,7 +350,7 @@ static inline void blk_queue_free_zone_bitmaps(struct request_queue *q) {}
>  
>  struct block_device *disk_map_sector_rcu(struct gendisk *disk, sector_t sector);
>  
> -int blk_alloc_devt(struct hd_struct *part, dev_t *devt);
> +int blk_alloc_devt(struct block_device *part, dev_t *devt);
>  void blk_free_devt(dev_t devt);
>  char *disk_name(struct gendisk *hd, int partno, char *buf);
>  #define ADDPART_FLAG_NONE	0
> diff --git a/block/genhd.c b/block/genhd.c
> index a85ffd7385718d..89cd0ba8e3b84a 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -559,8 +559,8 @@ static int blk_mangle_minor(int minor)
>  }
>  
>  /**
> - * blk_alloc_devt - allocate a dev_t for a partition
> - * @part: partition to allocate dev_t for
> + * blk_alloc_devt - allocate a dev_t for a block device
> + * @bdev: block device to allocate dev_t for
>   * @devt: out parameter for resulting dev_t
>   *
>   * Allocate a dev_t for block device.
> @@ -572,14 +572,14 @@ static int blk_mangle_minor(int minor)
>   * CONTEXT:
>   * Might sleep.
>   */
> -int blk_alloc_devt(struct hd_struct *part, dev_t *devt)
> +int blk_alloc_devt(struct block_device *bdev, dev_t *devt)
>  {
> -	struct gendisk *disk = part_to_disk(part);
> +	struct gendisk *disk = bdev->bd_disk;
>  	int idx;
>  
>  	/* in consecutive minor range? */
> -	if (part->bdev->bd_partno < disk->minors) {
> -		*devt = MKDEV(disk->major, disk->first_minor + part->bdev->bd_partno);
> +	if (bdev->bd_partno < disk->minors) {
> +		*devt = MKDEV(disk->major, disk->first_minor + bdev->bd_partno);
>  		return 0;
>  	}
>  
> @@ -735,7 +735,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
>  
>  	disk->flags |= GENHD_FL_UP;
>  
> -	retval = blk_alloc_devt(disk->part0->bd_part, &devt);
> +	retval = blk_alloc_devt(disk->part0, &devt);
>  	if (retval) {
>  		WARN_ON(1);
>  		return;
> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index ecc3228a086956..4f823c4c733518 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -392,7 +392,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
>  	pdev->type = &part_type;
>  	pdev->parent = ddev;
>  
> -	err = blk_alloc_devt(p, &devt);
> +	err = blk_alloc_devt(bdev, &devt);
>  	if (err)
>  		goto out_bdput;
>  	pdev->devt = devt;
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
