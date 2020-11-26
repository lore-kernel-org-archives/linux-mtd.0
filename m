Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D59C63697
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:43:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2D14207BC
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 17:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1/nL6mVT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2D14207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M7HBswzrapGhkBGIC93IHuqtTSih3Ya16BxRYIN154g=; b=1/nL6mVTk1P2ReTUvIE/2mWhA
	c7QR95Zj9ARjUTVrVC9+k7+QiASYOD7cYNf+UPscvALzcph/wqXDMpIdcxCIw11Grf0R9lMmry5dr
	KA3FYG7ycyQPkWXUpZHrFLKUYGUVgWZwV8UESkn6KoVwBPvICi2m1WRogVUCVVWIq8kwOk02bYCyq
	WL9OgIj2Z+CJoDcJW+94ywzbv6URyV4bzcPpaB7dhw+4DZDJiCB1X6zPdrf9oV42HENPFM/5YoeAz
	Q6cmuCZxWHh5dBt3icyvM2M/Po0mghdty1eZZhDv4glzSaG+8+JFIGZcxwFvwzQvY+SdITBIZp11s
	EvKvC2Ajg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiLI7-0001sN-JT; Thu, 26 Nov 2020 17:42:47 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiLI4-0001rc-9i
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 17:42:45 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 31C9868B05; Thu, 26 Nov 2020 18:42:39 +0100 (CET)
Date: Thu, 26 Nov 2020 18:42:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 24/44] block: simplify bdev/disk lookup in blkdev_get
Message-ID: <20201126174238.GA24098@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-25-hch@lst.de> <20201126163341.GL422@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126163341.GL422@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_124244_621788_F5DA370D 
X-CRM114-Status: GOOD (  13.15  )
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
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 26, 2020 at 05:33:41PM +0100, Jan Kara wrote:
> >  			bdev->bd_contains = whole;
> > -			bdev->bd_part = disk_get_part(disk, partno);
> > -			if (!(disk->flags & GENHD_FL_UP) ||
> > -			    !bdev->bd_part || !bdev->bd_part->nr_sects) {
> > +			bdev->bd_part = disk_get_part(disk, bdev->bd_partno);
> > +			if (!bdev->bd_part || !bdev->bd_part->nr_sects) {
> 
> AFAICT it is still possible that we see !(disk->flags & GENHD_FL_UP) here,
> isn't it? Is it safe to remove because the nr_sects check is already
> equivalent to it? Or something else?

At this point we already have the disk abd bdev reference, so we're not
closing any new race here.  That being said we might as well keep this
check to not bother going ahead when the disk is already torn down.

> I think bdget() above needs to be already under bdev_lookup_sem. Otherwise
> disk_to_dev(bdev->bd_disk)->kobj below is a potential use-after-free.

Yes.  I've fixed this and the other issues.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
