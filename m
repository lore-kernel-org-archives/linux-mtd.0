Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D53C56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:36:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E2C206F4
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:36:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bI4kTKg9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E2C206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OrRhwG56quT6F37TQknlEs6f2TZDeaCx7bIFBMbkCbg=; b=bI4kTKg92JB+0ivLGh5vvhHkV
	Vp2sTmQZnbfe+8e01Th9QnIOP/6TBzU7o2O3jXHHwQpcpmXK83lHDEjEVps0zCewCExGKzIhidaNT
	3b/kaD36dCGk+e9ha73jSwcOaP8cEf5j/3CenwIxqUhW2aMcmK6spUvmV941G9X0UaAqkapa6ZFMP
	thXgK8bpAFVe4OZiZplf5O73qI/v9TeXTN8LXMfJy2GqYGUE9+O5+SLbXIMfAySsfptih5AugytM0
	Buo4I01Z+YcWlSIiV5C43EsgLgJNk82wF2XE1djcxxOsGu80RHudRr2ljZZb5vye839tmYYVLH+QB
	zl85M+JJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiLAx-0000rR-M1; Thu, 26 Nov 2020 17:35:23 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiLAu-0000qf-Os
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 17:35:21 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1737ACBD;
 Thu, 26 Nov 2020 17:35:18 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 5BFEB1E10D0; Thu, 26 Nov 2020 18:35:18 +0100 (CET)
Date: Thu, 26 Nov 2020 18:35:18 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 36/44] block: allocate struct hd_struct as part of struct
 bdev_inode
Message-ID: <20201126173518.GV422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-37-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-37-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_123520_949009_9E3174AD 
X-CRM114-Status: GOOD (  19.74  )
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

On Thu 26-11-20 14:04:14, Christoph Hellwig wrote:
> Allocate hd_struct together with struct block_device to pre-load
> the lifetime rule changes in preparation of merging the two structures.
> 
> Note that part0 was previously embedded into struct gendisk, but is
> a separate allocation now, and already points to the block_device instead
> of the hd_struct.  The lifetime of struct gendisk is still controlled by
> the struct device embedded in the part0 hd_struct.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Just one comment below. With that fixed feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index f397ec9922bd6e..9c7e6730fa6098 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -265,9 +265,9 @@ static const struct attribute_group *part_attr_groups[] = {
>  static void part_release(struct device *dev)
>  {
>  	struct hd_struct *p = dev_to_part(dev);
> +
>  	blk_free_devt(dev->devt);
> -	hd_free_part(p);
> -	kfree(p);
> +	bdput(p->bdev);
>  }

I don't think hd_struct holds a reference to block_device, does it?
bdev_alloc() now just assigns bdev->bd_part->bdev = bdev...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
