Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F585C56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 18:01:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 400F5204FD
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 18:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dJrrm6di"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 400F5204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rm/VQXimRff51sH+cWfWIfY1YuZc+uQQUrHqut/HlPg=; b=dJrrm6diyK56TtRVEQypgV1nx
	Sr7XCZf9uTvHKZeQQt9s9jNxVeGErO0TFNUaLfmdiylwUCSp2Mtw4yS1R3PLWG4pps5n/eB+UImqa
	GeQ9dGqtFogfM0k5Be1yiBp8P1MqWs5cTSHNV1twsbRSGguqRx0NMN5tgn6+NovtJr24Iy/NJOgNK
	1Oc6RPKWEEThn740cnJ6ICKoL/HAWA/eNyxtQ3EE2CJdvBUlAe17chzgbkaHnSmC5e1AF/tzwQ6Qo
	0kB5nVqlHV+0Ns0GGK/Ii7STjgYABEsg2w+h7MkcgHIaH2QUlEgk5r9vZY0L90HoSG5Ujc+0dX18u
	UfVP+GKLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiLZd-00059N-0R; Thu, 26 Nov 2020 18:00:53 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiLZa-00058Y-LA
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 18:00:51 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52B7BABD2;
 Thu, 26 Nov 2020 18:00:49 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id BB5021E10D0; Thu, 26 Nov 2020 19:00:48 +0100 (CET)
Date: Thu, 26 Nov 2020 19:00:48 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 36/44] block: allocate struct hd_struct as part of struct
 bdev_inode
Message-ID: <20201126180048.GA422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-37-hch@lst.de>
 <20201126173518.GV422@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126173518.GV422@quack2.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_130050_867453_5EBBF58D 
X-CRM114-Status: GOOD (  21.97  )
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

On Thu 26-11-20 18:35:18, Jan Kara wrote:
> On Thu 26-11-20 14:04:14, Christoph Hellwig wrote:
> > Allocate hd_struct together with struct block_device to pre-load
> > the lifetime rule changes in preparation of merging the two structures.
> > 
> > Note that part0 was previously embedded into struct gendisk, but is
> > a separate allocation now, and already points to the block_device instead
> > of the hd_struct.  The lifetime of struct gendisk is still controlled by
> > the struct device embedded in the part0 hd_struct.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Just one comment below. With that fixed feel free to add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> 
> > diff --git a/block/partitions/core.c b/block/partitions/core.c
> > index f397ec9922bd6e..9c7e6730fa6098 100644
> > --- a/block/partitions/core.c
> > +++ b/block/partitions/core.c
> > @@ -265,9 +265,9 @@ static const struct attribute_group *part_attr_groups[] = {
> >  static void part_release(struct device *dev)
> >  {
> >  	struct hd_struct *p = dev_to_part(dev);
> > +
> >  	blk_free_devt(dev->devt);
> > -	hd_free_part(p);
> > -	kfree(p);
> > +	bdput(p->bdev);
> >  }
> 
> I don't think hd_struct holds a reference to block_device, does it?
> bdev_alloc() now just assigns bdev->bd_part->bdev = bdev...

Now I understood this is probably correct - each partition (including
gendisk as 0 partition) holds the initial bdev reference and only when
corresponding kobject is getting destroyed we stop holding onto that
reference. Right?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
