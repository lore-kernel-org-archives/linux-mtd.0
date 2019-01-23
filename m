Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E591CC282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A61F420861
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o+omMQSx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A61F420861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfwSHcGykeuJf4DRy4/4fY7On4Ebx4Hsak0CRCFBaEQ=; b=o+omMQSx8wkAts
	X+c6EOWGhkfJ0befksF3p8rBlKToI2pDOohYlPc0gRG2DtoecFqJuWslLrsJCnKHkAD+JvpfZljLs
	Mj7iwq8gCDIbCGA12aWFkgppDsSZvsILR5NDa1TSFwN6O63Or+5GT/4ZGmbR/jr33b6mcbWhgjdNM
	HyEpZ8uGNLiWS58emcdzMkMNr9/253UFvdqhmHrRsUbq4ELKkFfCsntbBV5WZ13zgz053BpIv7O49
	VmDqHcQI6dRHjvZGmt5bRDsB1/A/60t4JZ4RJAqWQ+Abypp+vhE0H90fOYExv+LsFVuaeo463kP+m
	UwnFVPMqiI16+He+XF8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmF7X-0001GT-53; Wed, 23 Jan 2019 09:46:55 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmF7E-00011p-Rd
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 09:46:53 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 536D6608A380;
 Wed, 23 Jan 2019 10:46:26 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4bhKdh74Aoxu; Wed, 23 Jan 2019 10:46:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B28D4608A398;
 Wed, 23 Jan 2019 10:46:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7Xo4vkH5dF6c; Wed, 23 Jan 2019 10:46:25 +0100 (CET)
Received: from blindfold.localnet (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 4CC76608A380;
 Wed, 23 Jan 2019 10:46:25 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: UBIFS quota support
Date: Wed, 23 Jan 2019 10:46:24 +0100
Message-ID: <3682938.yUD6jHpT9R@blindfold>
In-Reply-To: <20190123094305.7owpfwzgtzz2snat@pengutronix.de>
References: <20190110114448.vcx6w76ibmxwvlh3@pengutronix.de>
 <CAFLxGvyrNaq6ya9TNr-tdEEbV=qsi8qEko6R7oJ-DtkxPJMk0g@mail.gmail.com>
 <20190123094305.7owpfwzgtzz2snat@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_014637_463912_5380F352 
X-CRM114-Status: GOOD (  25.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Jan Kara <jack@suse.cz>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sascha,

Am Mittwoch, 23. Januar 2019, 10:43:05 CET schrieb Sascha Hauer:
> On Wed, Jan 23, 2019 at 12:07:12AM +0100, Richard Weinberger wrote:
> > On Thu, Jan 10, 2019 at 12:45 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > >
> > > Hi all,
> > >
> > > I'm currently working on resurrecting the UBIFS quota patches posted back in
> > > 2015 by Dongsheng Yang, last posted here:
> > >
> > > http://lists.infradead.org/pipermail/linux-mtd/2015-September/061812.html
> > >
> > > First of all I think work stopped there, there is no newer UBIFS quota
> > > support I am missing, right?
> > >
> > > One problem with this series was that the quotactl systemcall expects a
> > > path to a block device. UBIFS doesn't work on a block device but on a
> > > character device instead.
> > > The solution in this series was to pass the path to the cdev in
> > > quotactl.  A struct cdev * member was added to struct super_block which
> > > was used to identify the superblock for a given cdev. This approach was
> > > rejected by Christoph ("I don't think the cdev has any business in core
> > > VFS code.").  Apart from that UBIFS can not only be mounted with a path
> > > to the character device (mount -t ubifs /dev/ubix_y /mnt) but also in
> > > the form ubix:volname (mount -t ubifs ubix:volname /mnt) in which case
> > > userspace doesn't have any valid path it could pass in quotactl.
> > >
> > > An idea out of this would be to allow to pass the mountpoint instead of
> > > the path to the block device in quotactl which would work with nfs or
> > > even tmpfs aswell. Would that be acceptable? Any other ideas?
> > 
> > *kind ping*
> > 
> > Jan, another thing Sascha and I are not sure about, what are the consistency
> > constraints of the quota file?
> > If I read the code correctly, quota just writes to the quota file and
> > assumes that
> > the file system makes sure about consistency. Either by fsckfixing the quota
> > file or having a data journal for the quota file.
> > In case of UBIFS where we have a data journal this should be doable.
> > Is it okay when the quota file has S_SYNC set?
> 
> S_SYNC won't help us. We need to make sure that a change of an inode and
> the corresponding update to the quota file is done atomically. Otherwise
> it may happen that we only change the size of an inode, but miss the
> corresponding quota updates, or depending on the implementation, maybe
> the other way round.

This is why I said yesterday you need to touch the UBIFS journal replay code too.
So, S_SYNC is not to keep the quota file consistent with UBIFS' state, it is
to make sure we don't lose quota updates.
Skipping S_SYNC is also possible, but then you need to fix up even more stuff
in the replay code.

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
