Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8897DC63697
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 16:38:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F53B20B80
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 16:38:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+CfiwCB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F53B20B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0RF2jWQVcF26s6Bur8V8C60G48ICggUWsc+zlX3hBrk=; b=G+CfiwCByDg9lS1muEZsiWT+W
	m0dDy40lIPgpmhhRsUM3xmVHNioUEUVx2jVZ3iLBG/6ukhtVbiaGumfHUG1ZCVPb3tdVqbPfqg4au
	NGpeLG0QTPlUzxV47xfOljfEyeUThd9+7Zu68VAiUtH+lULZOnpIsoHs4JXM6v+J+SHswxuAU85/x
	KfR7lWazh/taAkakykTWmV5sBwxX79KW9P/5j4humRqsrClGQJQ7deLpDyRVXMEpvDoF8vE3INGna
	jJsg2/PlXeIBIndiq+nMxhaqSxO1i6vlnmskIOdyiXNcoWgHCze+K+E0k1yfxEjMt9SDvhz+afnVr
	4x956NgDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiKHJ-0001By-WE; Thu, 26 Nov 2020 16:37:54 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiKHH-0001Az-Ln
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 16:37:52 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9A353ACC4;
 Thu, 26 Nov 2020 16:37:50 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 730531E10D0; Thu, 26 Nov 2020 17:37:50 +0100 (CET)
Date: Thu, 26 Nov 2020 17:37:50 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 28/44] block: initialize struct block_device in bdev_alloc
Message-ID: <20201126163750.GN422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-29-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-29-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_113751_843668_E34F33AE 
X-CRM114-Status: GOOD (  20.81  )
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

On Thu 26-11-20 14:04:06, Christoph Hellwig wrote:
> Don't play tricks with slab constructors as bdev structures tends to not
> get reused very much, and this makes the code a lot less error prone.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Tejun Heo <tj@kernel.org>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/block_dev.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index f180ac0e87844f..58e8532d8580a1 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -784,20 +784,11 @@ static void bdev_free_inode(struct inode *inode)
>  	kmem_cache_free(bdev_cachep, BDEV_I(inode));
>  }
>  
> -static void init_once(void *foo)
> +static void init_once(void *data)
>  {
> -	struct bdev_inode *ei = (struct bdev_inode *) foo;
> -	struct block_device *bdev = &ei->bdev;
> +	struct bdev_inode *ei = data;
>  
> -	memset(bdev, 0, sizeof(*bdev));
> -	mutex_init(&bdev->bd_mutex);
> -#ifdef CONFIG_SYSFS
> -	INIT_LIST_HEAD(&bdev->bd_holder_disks);
> -#endif
> -	bdev->bd_bdi = &noop_backing_dev_info;
>  	inode_init_once(&ei->vfs_inode);
> -	/* Initialize mutex for freeze. */
> -	mutex_init(&bdev->bd_fsfreeze_mutex);
>  }
>  
>  static void bdev_evict_inode(struct inode *inode)
> @@ -873,12 +864,17 @@ struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
>  	mapping_set_gfp_mask(&inode->i_data, GFP_USER);
>  
>  	bdev = I_BDEV(inode);
> +	memset(bdev, 0, sizeof(*bdev));
> +	mutex_init(&bdev->bd_mutex);
> +	mutex_init(&bdev->bd_fsfreeze_mutex);
>  	spin_lock_init(&bdev->bd_size_lock);
>  	bdev->bd_disk = disk;
>  	bdev->bd_partno = partno;
> -	bdev->bd_super = NULL;
>  	bdev->bd_inode = inode;
> -	bdev->bd_part_count = 0;
> +	bdev->bd_bdi = &noop_backing_dev_info;
> +#ifdef CONFIG_SYSFS
> +	INIT_LIST_HEAD(&bdev->bd_holder_disks);
> +#endif
>  	return bdev;
>  }
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
