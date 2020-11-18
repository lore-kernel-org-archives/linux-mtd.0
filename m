Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0D6C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 12:51:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3C4B24180
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 12:51:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oxtf8amm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mpIozshx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3C4B24180
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jLEaI++LaxcZrxHkZDBlXigXDOVtmCr6lMYpNt+tcMY=; b=oxtf8ammrooZ7mTPXEIkA2tAL
	YbyhrWS47GhMBgSbXfXnO48lb8ZPw9zBGiclitTGsknHgazIJTydFEheigbY7jUXlX2K0pyyOcV4L
	IhuTi/JxbjeMVowTDzmfCgZfoq+gJSVRhBgJHOtwYAevuJhVZKxFfwwvpEvluLQuHU4T7lt/lEUSZ
	oG6+bLnYHIoPifJpEhytCfTj7wFSdId3pDawq6gn04s6AGyRogSd+CvRVAldCXwgHF4yq7UsQM2oe
	qVvO7AdiRBiYcjZ29mmDAXzeR13x/ppApmK6wzUefBxGPiun/OBPAAfi8m8LlE/Sxo6lX52WRxg9L
	rCCw1w1OA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfMv8-0003Lr-Eu; Wed, 18 Nov 2020 12:50:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfMv2-0003Ll-5Q
 for linux-mtd@merlin.infradead.org; Wed, 18 Nov 2020 12:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HSUzUyKTU/QS1kBHnPfjuFObEMrIAG6LjkrRvHzZF6g=; b=mpIozshx6aJo2QoKkj03Sj4lqv
 eATDwM5+pyAtrhOHDUVD77b65789cHxYoWQANXOTIXt7qV/KGnbJ83izmUrP2MQ/2l3mBwDw4mdoW
 Y5kbGddaa/QKi7M9RwOUo9SSjzPgbiiV1208faqzs+g6W2VUCPYuQiOn803XJb/o/nettEMMrZhNr
 200kJLaXlHseKJHdT2eZ+hl3ThDl9guSn9OMId2L1GwrdkO42exGupejK69RQO+t1ajwPpeevqxwt
 f3XgZhPQ7s2PLOBKSeN45qsCk6Fy+tmNaH6Rrigl3ju4Z9SvL4rjgUhEPeklvtVToHeHs9jg6H9jx
 JzIvniVg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kfMuz-0006LA-DU; Wed, 18 Nov 2020 12:50:37 +0000
Date: Wed, 18 Nov 2020 12:50:37 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: merge struct block_device and struct hd_struct
Message-ID: <20201118125037.GE29991@casper.infradead.org>
References: <20201118084800.2339180-1-hch@lst.de>
 <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
 <20201118085804.GA20384@lst.de>
 <1ded2079-f1be-6d5d-01df-65754447df78@suse.com>
 <X7Tky/6dDN8+DrU7@kroah.com>
 <61044f85-cd41-87b5-3f41-36e3dffb6f2a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61044f85-cd41-87b5-3f41-36e3dffb6f2a@suse.com>
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
Cc: linux-bcache@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 Richard Weinberger <richard@nod.at>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 10:23:51AM +0100, Jan Beulich wrote:
> On 18.11.2020 10:09, Greg KH wrote:
> > On Wed, Nov 18, 2020 at 10:04:04AM +0100, Jan Beulich wrote:
> >> On 18.11.2020 09:58, Christoph Hellwig wrote:
> >>> On Wed, Nov 18, 2020 at 09:56:11AM +0100, Jan Beulich wrote:
> >>>> since this isn't the first series from you recently spamming
> >>>> xen-devel, may I ask that you don't Cc entire series to lists
> >>>> which are involved with perhaps just one out of the many patches?
> >>>> IMO Cc lists should be compiled on a per-patch basis; the cover
> >>>> letter may of course be sent to the union of all of them.
> >>>
> >>> No way.  Individual CCs are completely broken as they don't provide
> >>> the reviewer a context.
> >>
> >> That's the view of some people, but not all. Context can be easily
> >> established by those who care going to one of the many archives on
> >> which the entire series lands. Getting spammed, however, can't be
> >> avoided by the dozens or hundreds of list subscribers.
> > 
> > kernel patches are never "spam", sorry, but for developers to try to
> > determine which lists/maintainers want to see the whole series and which
> > do not is impossible.
> > 
> > Patches in a series are easily deleted from sane mail clients with a
> > single click/keystroke all at once, they aren't a problem that needs to
> > be reduced in volume.
> 
> This doesn't scale, neither in the dimension of recipients nor in
> the dimension of possible sources of such series.
> 
> While it may seem small, it's also a waste of resources to have mails
> sent to hundreds of even thousands of people. So while from a
> technical content perspective I surely agree with you saying 'kernel
> patches are never "spam"', they still are from the perspective of
> what "spam mail" originally means: Mail the recipients did not want
> to receive.

What doesn't scale is developers who only care about their tiny
sliver of Linux and don't stick their heads up from time to time and
look around.  This is an opportunity for people to become more involved
in the development of Linux as a whole, instead of just worrying about
their bit.  You're not "a Xen developer".  You're a Linux developer
whose current focus is on Xen.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
