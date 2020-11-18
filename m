Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB4FC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 09:33:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73AB20855
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 09:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g0HoATRc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fFTiyRf+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D73AB20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wGgDTZ6Sg+TLBM+Hz48frfnpq+W8C0rfmljxEYvBQwA=; b=g0HoATRci+4rj0GK7Z9a26Otz
	nRRMOiAgWcmnpqzPvKf2gfzcjgU05KQYH4datDPa/3FEPIsVw5dN1bdQnDv4Z+YesYozHGm1Kf8rZ
	gYxnYJhJf7yu9OVJY0UR9JubcuWT59nnoBwrLBZ9gYTBukNaNVXwNfC8G9qAWkY5qj3Cn+qsXFZBs
	RIAp+QG6m010dQKggIEhqMtVDaLybYOQZivM93PIaozaYNA4PbMMa/B6a62w5F6Sb1sICrIBcglWr
	m4CeddLhHYlhocgorVSwtdBlxcCUqDnR0ZaVunZTyiJrzyHP1HNk/0pNB9vboJipNqBXbdLlcyw1+
	77LMtKlRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJp5-0003oU-K8; Wed, 18 Nov 2020 09:32:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJp3-0003o7-GX
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 09:32:18 +0000
Received: from localhost (unknown [89.205.136.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 651A320855;
 Wed, 18 Nov 2020 09:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1605691936;
 bh=z9AARqxEifx27ZSfSqyQtp5/QTEI/AENwIGCm/wc71c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fFTiyRf+lNKL9ST4txcSeaDrCIqy8sGZqtdcsNAnsGly1+5GYCQkd5b0dJtsVNXW7
 Ty+UOKz4POaIjvZvW72SkGo52lChY2pkhIjug9dEhWmDqtz52fKjvNwDSvPQKw5/EX
 XjQbNqUIRf7iTd7GfCLBQpWa8uhdec/9xDR/QuiU=
Date: Wed, 18 Nov 2020 10:32:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: merge struct block_device and struct hd_struct
Message-ID: <X7TqHNotTX6W/bmT@kroah.com>
References: <20201118084800.2339180-1-hch@lst.de>
 <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
 <20201118085804.GA20384@lst.de>
 <1ded2079-f1be-6d5d-01df-65754447df78@suse.com>
 <X7Tky/6dDN8+DrU7@kroah.com>
 <61044f85-cd41-87b5-3f41-36e3dffb6f2a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61044f85-cd41-87b5-3f41-36e3dffb6f2a@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_043217_769211_1616C469 
X-CRM114-Status: GOOD (  27.57  )
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
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 Christoph Hellwig <hch@lst.de>
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

Again, trying to figure out what subsystem does, and does not, want
stuff like this does not scale either.  Remember, we had 4000 developers
last year, how are you going to tell all of them what the special rules
are for your subsystem and how they differ from any other subsystem?

And why does it matter?  We are all working on the same project, why
wouldn't you want to see core block device handling patches?  What
hurts with that, someone might notice something in one of them that a
different developer did not.

> While it may seem small, it's also a waste of resources to have mails
> sent to hundreds of even thousands of people. So while from a
> technical content perspective I surely agree with you saying 'kernel
> patches are never "spam"', they still are from the perspective of
> what "spam mail" originally means: Mail the recipients did not want
> to receive.

Anyone on a kernel subsystem mailing list should expect to see kernel
patches, that's part of the process, and always has been.

Kernel subsystems are not silos, people on them should be aware of what
else is going on in order to stay informed.  And again, if it's a huge
problem, one click/keystroke and they are gone, no waste.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
