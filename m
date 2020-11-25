Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39876C64E7A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 11:41:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1AEE206D9
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 11:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1ImqYfJc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1AEE206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oJIZCQ0U/pkDsQ9bdCiInKFFWoMNW1364s6+LXgU2xo=; b=1ImqYfJcUhiT3U4PC5nsZud0M
	GZE1agSBxyBBQ84T/DvTD8yMZxJLHCRBiC+OIB1qXjKxfGEclF1RdHhagm669X8VLBmCx01p8SiJL
	3knAw2krSGDdee0dIjMLMGOeWuFlxxmSb30Bs4i95WbNvVtJyoqS2zxZDNJZV2uFqBPiQHiYY226x
	+4d4xuJgPR0xndF3VKSTiSB57QO3KkI5lS6JqzlVzLSY0VOCm0YKjM3tGCSDBbfhFF4+yO4KTWYCr
	raZTzIrEUrGWYx2rtyEi7stDbTVBfNzyAzwh41rCmibnaw2kMhSOo7OIvopMzFXnN3Es3bfZCzIz1
	+lJeUVvLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khtAI-0002Q9-OS; Wed, 25 Nov 2020 11:40:50 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khtAF-0002Ot-OF
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 11:40:48 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F6BDAC41;
 Wed, 25 Nov 2020 11:40:45 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id D8B791E130F; Wed, 25 Nov 2020 12:40:44 +0100 (CET)
Date: Wed, 25 Nov 2020 12:40:44 +0100
From: Jan Kara <jack@suse.cz>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 11/20] block: reference struct block_device from struct
 hd_struct
Message-ID: <20201125114044.GC16944@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-12-hch@lst.de>
 <X708BTJ5njtbC2z1@mtj.duckdns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X708BTJ5njtbC2z1@mtj.duckdns.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_064047_919358_3BA60542 
X-CRM114-Status: GOOD (  21.42  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hello!

On Tue 24-11-20 11:59:49, Tejun Heo wrote:
> > diff --git a/block/partitions/core.c b/block/partitions/core.c
> > index a02e224115943d..0ba0bf44b88af3 100644
> > --- a/block/partitions/core.c
> > +++ b/block/partitions/core.c
> > @@ -340,12 +340,11 @@ void delete_partition(struct hd_struct *part)
> >  	device_del(part_to_dev(part));
> >  
> >  	/*
> > -	 * Remove gendisk pointer from idr so that it cannot be looked up
> > -	 * while RCU period before freeing gendisk is running to prevent
> > -	 * use-after-free issues. Note that the device number stays
> > -	 * "in-use" until we really free the gendisk.
> > +	 * Remove the block device from the inode hash, so that it cannot be
> > +	 * looked up while waiting for the RCU grace period.
> >  	 */
> > -	blk_invalidate_devt(part_devt(part));
> > +	remove_inode_hash(part->bdev->bd_inode);
> 
> I don't think this is necessary now that the bdev and inode lifetimes are
> one. Before, punching out the association early was necessary because we
> could be in a situation where we can successfully look up a part from idr
> and then try to pin the associated disk which may already be freed. With the
> new code, the lookup is through the inode whose lifetime is one and the same
> with gendisk, so use-after-free isn't possible and __blkdev_get() will
> reliably reject such open attempts.

I think the remove_inode_hash() call is actually still needed. Consider a
situation when the disk is unplugged, gendisk gets destroyed, bdev still
lives on (e.g. because it is still open). Device gets re-plugged, gendisk
for the same device number gets created. But we really need new bdev for
this because from higher level POV this is completely new device. And the
old bdev needs to live on as long as it is open. So IMO we still need to
just unhash the inode and leave it lingering in the background.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
