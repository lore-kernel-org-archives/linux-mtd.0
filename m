Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BF6C56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:49:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 957A3207BC
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:49:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2XBHwr8c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 957A3207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nKGiW1OfdYz9nLhExzGZb3DlXJZgqctL4Pv9M7D1AYU=; b=2XBHwr8cFFeTdFwhyPqd+8n/A
	+hBxli2pwa7EG2go4R4RcwKrHgmS7+FWVrIXz1E+5bkazqjPABLsSuruEGwtUnFv/ZUrA6VNY9Yom
	jrRQUgHkBt6AGFN+fmMu1Qzh2gDmmGy+zDPjE7w4Fq3v2JZNQTWLgxPitweG125+5LcQHmxRmkvkp
	qFJrP2+ekh0Lju4RaFptoMDR7RqK5ECZ7qU9hivEmwjNs7Rl/aWFnOFp8Dk+4UZdq76UTZ89+vliu
	zkFgxxWVgeITOpGKuSSYoMPpjwfShKSKYxo8XZyhq2UX527lN70YZ++MiBY43PLDq/AcYeJNm8jRV
	uqtE8KXtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiLOC-0002jO-Iz; Thu, 26 Nov 2020 17:49:04 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiLO9-0002i8-MU
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 17:49:02 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D7F9ACA9;
 Thu, 26 Nov 2020 17:49:00 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 402A71E10D0; Thu, 26 Nov 2020 18:49:00 +0100 (CET)
Date: Thu, 26 Nov 2020 18:49:00 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 40/44] block: pass a block_device to invalidate_partition
Message-ID: <20201126174900.GZ422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-41-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-41-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_124901_867449_7DF244A2 
X-CRM114-Status: GOOD (  20.80  )
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

On Thu 26-11-20 14:04:18, Christoph Hellwig wrote:
> Pass the block_device actually needed instead of looking it up using
> bdget_disk.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/genhd.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/block/genhd.c b/block/genhd.c
> index 89cd0ba8e3b84a..28299b24173be1 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -792,14 +792,8 @@ void device_add_disk_no_queue_reg(struct device *parent, struct gendisk *disk)
>  }
>  EXPORT_SYMBOL(device_add_disk_no_queue_reg);
>  
> -static void invalidate_partition(struct gendisk *disk, int partno)
> +static void invalidate_partition(struct block_device *bdev)
>  {
> -	struct block_device *bdev;
> -
> -	bdev = bdget_disk(disk, partno);
> -	if (!bdev)
> -		return;
> -
>  	fsync_bdev(bdev);
>  	__invalidate_device(bdev, true);
>  
> @@ -808,7 +802,6 @@ static void invalidate_partition(struct gendisk *disk, int partno)
>  	 * up any more even if openers still hold references to it.
>  	 */
>  	remove_inode_hash(bdev->bd_inode);
> -	bdput(bdev);
>  }
>  
>  /**
> @@ -853,12 +846,12 @@ void del_gendisk(struct gendisk *disk)
>  	disk_part_iter_init(&piter, disk,
>  			     DISK_PITER_INCL_EMPTY | DISK_PITER_REVERSE);
>  	while ((part = disk_part_iter_next(&piter))) {
> -		invalidate_partition(disk, part->bdev->bd_partno);
> +		invalidate_partition(part->bdev);
>  		delete_partition(part);
>  	}
>  	disk_part_iter_exit(&piter);
>  
> -	invalidate_partition(disk, 0);
> +	invalidate_partition(disk->part0);
>  	set_capacity(disk, 0);
>  	disk->flags &= ~GENHD_FL_UP;
>  	up_write(&bdev_lookup_sem);
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
