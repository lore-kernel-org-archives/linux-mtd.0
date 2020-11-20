Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD532C63777
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 09:02:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54B312224C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 09:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wIcIFu2+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54B312224C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fl4xbKWFvveTPoG3/66xhYW58wUqTCs9Rak3kS2l4Tc=; b=wIcIFu2+uTeSPDHuhna8h10Hw
	IOOIZpXE0WL7/2yk0lB6RQ1k1dkm7/mkCn91i31D/+k1GRQy3lV9kPpBdh8QatFv4e4YgGcYju7qm
	vwaR4R+s5aY7S+Se9on+vU4Xo4hpvx4WLIo6uaHqodTiwNA9PZpokE570u0xprBNiMKSt02UyHPXi
	gEfK7ywTDw/CDtBwKD21ZMcchicOiIT7F2NYc0H9381zGMAWE4tNHN1den1BPnhipBdPJVWqzRZEf
	z6M8RItfA062GLron5gYd6vlq7U3jNbVyuIoZa938dBYdbMuCZ7+xW4PKMT/otlpwEhdIdlrOhSKO
	QN0NeLN8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg2Id-0003hV-VK; Fri, 20 Nov 2020 09:01:48 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg2Ia-0003gc-OX
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 09:01:45 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4C98067373; Fri, 20 Nov 2020 10:01:42 +0100 (CET)
Date: Fri, 20 Nov 2020 10:01:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 13/20] block: remove ->bd_contains
Message-ID: <20201120090142.GC21715@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-14-hch@lst.de> <20201119103253.GV1981@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119103253.GV1981@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_040144_953541_F2F6B468 
X-CRM114-Status: GOOD (  16.44  )
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

On Thu, Nov 19, 2020 at 11:32:53AM +0100, Jan Kara wrote:
> > @@ -1521,7 +1510,7 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
> >  		if (bdev->bd_bdi == &noop_backing_dev_info)
> >  			bdev->bd_bdi = bdi_get(disk->queue->backing_dev_info);
> >  	} else {
> > -		if (bdev->bd_contains == bdev) {
> > +		if (!bdev->bd_partno) {
> 
> This should be !bdev_is_partition(bdev) for consistency, right?

Yes.  Same for the same check further up for the !bdev->bd_openers
case.

> > +#define bdev_whole(_bdev) \
> > +	((_bdev)->bd_disk->part0.bdev)
> > +
> >  #define bdev_kobj(_bdev) \
> >  	(&part_to_dev((_bdev)->bd_part)->kobj)
> 
> I'd somewhat prefer if these helpers could actually be inline functions and
> not macros. I guess they are macros because hd_struct isn't in blk_types.h.
> But if we moved helpers to blkdev.h, we'd have all definitions we need...
> Is that a problem for some users?

As you pointed out the reason these are macros is that the obvious
placement doesn't work.  My plan was to look into cleaning up the block
headers, which are a complete mess between blk_types.h, bio.h, blkdev.h
and genhd.h after I'm done making sense of the data structures, so for
now I didn't want to move too much around.  Hopefully we'll be able to
convert these helpers to inlines once I'm done.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
