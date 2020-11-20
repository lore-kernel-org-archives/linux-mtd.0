Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFE5C5519F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 09:16:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B731A2236F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 09:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CApx9UNQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B731A2236F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K4ZzS5ASwRxv3LDACwFhMYNgisSgM32ARd4B+AY7ptg=; b=CApx9UNQbhMsvpUGmCcWqi3q/
	/eN7D09EkwpSDL6WA0XKrbPdCeGER/lyKz5Oom4MREnU63/yTayUsOZI1zyPma3KXNUiSQVcrbtSP
	p9P8sFDNwCYYsp4DAP3mHXu0Kiz0Pw3DIzKhmfY+EhRnxXssht9mI6UU8GdXzJxLIZi/Zfd/u4wXT
	tpUg3+yrS85FaRReGhRqcrT424dAxqKhSuIANeNDgEXa2kDz9Ol8ZyQYjKy7abIcXNaRdY2Hb/wLz
	/4keQdT/Zx+PT366LUK16jZmHCwfk/NRMg7b2F4mhnhHuc5sVb/ERjJ7D/Te62Ariwe8ABa1qPvE8
	Du7yVS5Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg2WH-00064c-OU; Fri, 20 Nov 2020 09:15:53 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg2WF-000636-Aq
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 09:15:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8D37C67373; Fri, 20 Nov 2020 10:15:47 +0100 (CET)
Date: Fri, 20 Nov 2020 10:15:46 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 15/20] block: merge struct block_device and struct
 hd_struct
Message-ID: <20201120091546.GE21715@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-16-hch@lst.de> <20201119143921.GX1981@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119143921.GX1981@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_041551_540324_BC56EDA6 
X-CRM114-Status: GOOD (  19.38  )
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
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 19, 2020 at 03:39:21PM +0100, Jan Kara wrote:
> This patch is kind of difficult to review due to the size of mostly
> mechanical changes mixed with not completely mechanical changes. Can we
> perhaps split out the mechanical bits? E.g. the rq->part => rq->bdev
> renaming is mechanical and notable part of the patch. Similarly the
> part->foo => part->bd_foo bits...

We'd end with really weird patches that way.  Never mind that I'm not
even sure how we could mechnically do the renaming.

> 
> Also I'm kind of wondering: AFAIU the new lifetime rules, gendisk holds
> bdev reference and bdev is created on gendisk allocation so bdev lifetime is
> strictly larger than gendisk lifetime. But what now keeps bdev->bd_disk
> reference safe in presence device hot unplug? In most cases we are still
> protected by gendisk reference taken in __blkdev_get() but how about
> disk->lookup_sem and disk->flags dereferences before we actually grab the
> reference?

Good question.  I'll need to think about this a bit more.

> Also I find it rather non-obvious (although elegant ;) that bdev->bd_device
> rules the lifetime of gendisk. Can you perhaps explain this in the
> changelog and probably also add somewhere to source a documentation about
> the new lifetime rules?

Yes.

> > -struct hd_struct *__disk_get_part(struct gendisk *disk, int partno);
> > +static inline struct block_device *__bdget_disk(struct gendisk *disk,
> > +		int partno)
> > +{
> > +	struct disk_part_tbl *ptbl = rcu_dereference(disk->part_tbl);
> > +
> > +	if (unlikely(partno < 0 || partno >= ptbl->len))
> > +		return NULL;
> > +	return rcu_dereference(ptbl->part[partno]);
> > +}
> 
> I understand this is lower-level counterpart of bdget_disk() but it is
> confusing to me that this has 'bdget' in the name and returns no bdev
> reference. Can we call it like __bdev_from_disk() or something like that?

Sure.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
