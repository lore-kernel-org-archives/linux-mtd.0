Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45B7C5519F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 11:22:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B7912222F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 11:22:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NpSVnV1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B7912222F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Upy4VsVvcJ2SR36u0IgmJuoLhyBGh744lb0LvVeDC1Q=; b=NpSVnV1E+XWExlinukZmHljNt
	pLrJv80277Ll/oV/GSk/Lzvi8CgX0/zqff05wrc06fP/ZldVv/Ix+TnAYVghpJkkTuJJCsXBckI/V
	Stkgz3X9OI3pawga0/d8MRHLIsuX9vPOP8Lu+/iGexVVlkOruHlrhGNAYyOKtPnmsc5jKTAbWUHcr
	lTPbIgijQCqfz1cD4VvAh4qyB+lOHdq3YalnOu77nPqcV0K6/U+tPYX2+5bPxwCEYyGejzcG/2l3l
	EHsE+HThHTC8DLF5kGWMDOydM1dwcc47dfg33ETZRlgBOIT9ElZF6B14Bdi2XtY11Hvt/2Fg2kp9F
	FckRKtgtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg4Tl-00084p-Tm; Fri, 20 Nov 2020 11:21:25 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg4Tj-000841-6u
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 11:21:24 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4C79AED9;
 Fri, 20 Nov 2020 11:21:21 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 2825E1E130B; Fri, 20 Nov 2020 12:21:21 +0100 (CET)
Date: Fri, 20 Nov 2020 12:21:21 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/20] block: remove the nr_sects field in struct hd_struct
Message-ID: <20201120112121.GB15537@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-15-hch@lst.de>
 <20201119120525.GW1981@quack2.suse.cz>
 <20201120090820.GD21715@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120090820.GD21715@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_062123_543507_9F4B213E 
X-CRM114-Status: GOOD (  33.24  )
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
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri 20-11-20 10:08:20, Christoph Hellwig wrote:
> On Thu, Nov 19, 2020 at 01:05:25PM +0100, Jan Kara wrote:
> > > @@ -613,7 +613,7 @@ void guard_bio_eod(struct bio *bio)
> > >  	rcu_read_lock();
> > >  	part = __disk_get_part(bio->bi_disk, bio->bi_partno);
> > >  	if (part)
> > > -		maxsector = part_nr_sects_read(part);
> > > +		maxsector = bdev_nr_sectors(part->bdev);
> > >  	else
> > >  		maxsector = get_capacity(bio->bi_disk);
> > 
> > I have to say that after these changes I find it a bit confusing that we
> > have get/set_capacity() and bdev_nr_sectors() / bdev_set_nr_sectors() and
> > they are all the same thing (i_size of the bdev). Is there a reason for the
> > distinction?
> 
> get_capacity/set_capacity are the existing unchanged interfaces that
> work on struct gendisk, and unchanged from what we had before.  They also
> have lots of users which makes them kinda awkward to touch.
> 
> bdev_nr_sectors is the public interface to query the size for any
> kind of struct block device, to be used by consumers of the block
> device interface.
> 
> bdev_set_nr_sectors is a private helper for the partitions core that
> avoids duplicating a bit of code, and works on partitions.

OK, I guess I'll get used to this...

> > > @@ -38,6 +38,16 @@ static void disk_add_events(struct gendisk *disk);
> > >  static void disk_del_events(struct gendisk *disk);
> > >  static void disk_release_events(struct gendisk *disk);
> > >  
> > > +void set_capacity(struct gendisk *disk, sector_t sectors)
> > > +{
> > > +	struct block_device *bdev = disk->part0.bdev;
> > > +
> > > +	spin_lock(&bdev->bd_size_lock);
> > > +	i_size_write(bdev->bd_inode, (loff_t)sectors << SECTOR_SHIFT);
> > > +	spin_unlock(&bdev->bd_size_lock);
> > 
> > AFAICT bd_size_lock is pointless after these changes so we can just remove
> > it?
> 
> I don't think it is, as reuqiring bd_mutex for size updates leads to
> rather awkward lock ordering problems.

OK, let me ask differently: What is bd_size_lock protecting now? Ah, I see,
on 32-bit it is needed to prevent torn writes to i_size, right?

> > >  	if (capacity != size && capacity != 0 && size != 0) {
> > >  		char *envp[] = { "RESIZE=1", NULL };
> > >  
> > > +		pr_info("%s: detected capacity change from %lld to %lld\n",
> > > +		       disk->disk_name, size, capacity);
> > 
> > So we are now missing above message for transitions from / to 0 capacity?
> > Is there any other notification in the kernel log when e.g. media is
> > inserted into a CD-ROM drive? I remember using these messages for detecting
> > that...
> 
> True, I guess we should keep the messages for that case at least under
> some circumstances.  Let me take a closer look at what could make sense.
> 
> > Also what about GENHD_FL_HIDDEN devices? Are we sure we never set capacity
> > for them?
> 
> We absolutely set the capacity for them, as we have to.  And even use
> this interface.  But yes, I think we should skip sending the uevent for
> them.

Also previously we were not printing any messages for hidden devices and
now we do. I'm not sure whether that's intended or not.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
