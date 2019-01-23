Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50730C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:55:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F33E217F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:55:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XOg6MUVP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F33E217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nL/ZjRYkrKn6+Wddx19q7RoJQ7FLNefF36XyqPi38xo=; b=XOg6MUVPuRqRPo
	A1SCe19y65nsO0y/ZGhXTPivliIdbM88CDSbgjB5OtqGn9RFC7/pVPbGosfoh5mFMdeWPrng7yxMH
	sdvJLkwdwc5tV0HZR8Q/rLYnXumh0aQkc8oNyY7AlMEuU/SosuWFwYPLkruUTZy4G4LqsN8YladI2
	FY+4yKS0pf8p06Jn0aqYO3zihuYtGFrS0CcKBqHaRvlT8A+Bwx8cCiuzlOLv2JlL4cg6S9092dm52
	hStEh+xu2x7QxblDxu3+2q0HRBUFN8ObRkPfWl78H0gDxQcxFlpmVS9089PMPRsE+4xNd7vNX3WX0
	or5vDxa7f7YiVb/y4yFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmFG4-0004i0-Eh; Wed, 23 Jan 2019 09:55:44 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmFG1-0004gw-6x
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 09:55:43 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gmFFw-0002kP-4P; Wed, 23 Jan 2019 10:55:36 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gmFFv-0001M0-O0; Wed, 23 Jan 2019 10:55:35 +0100
Date: Wed, 23 Jan 2019 10:55:35 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: Re: UBIFS quota support
Message-ID: <20190123095535.itwduropd2moqs3n@pengutronix.de>
References: <20190110114448.vcx6w76ibmxwvlh3@pengutronix.de>
 <CAFLxGvyrNaq6ya9TNr-tdEEbV=qsi8qEko6R7oJ-DtkxPJMk0g@mail.gmail.com>
 <20190123094305.7owpfwzgtzz2snat@pengutronix.de>
 <3682938.yUD6jHpT9R@blindfold>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3682938.yUD6jHpT9R@blindfold>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:50:51 up 1 day, 21:03, 73 users,  load average: 0.34, 0.23, 0.20
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_015541_422665_622EDA6F 
X-CRM114-Status: GOOD (  29.02  )
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

On Wed, Jan 23, 2019 at 10:46:24AM +0100, Richard Weinberger wrote:
> Sascha,
> 
> Am Mittwoch, 23. Januar 2019, 10:43:05 CET schrieb Sascha Hauer:
> > On Wed, Jan 23, 2019 at 12:07:12AM +0100, Richard Weinberger wrote:
> > > On Thu, Jan 10, 2019 at 12:45 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > > >
> > > > Hi all,
> > > >
> > > > I'm currently working on resurrecting the UBIFS quota patches posted back in
> > > > 2015 by Dongsheng Yang, last posted here:
> > > >
> > > > http://lists.infradead.org/pipermail/linux-mtd/2015-September/061812.html
> > > >
> > > > First of all I think work stopped there, there is no newer UBIFS quota
> > > > support I am missing, right?
> > > >
> > > > One problem with this series was that the quotactl systemcall expects a
> > > > path to a block device. UBIFS doesn't work on a block device but on a
> > > > character device instead.
> > > > The solution in this series was to pass the path to the cdev in
> > > > quotactl.  A struct cdev * member was added to struct super_block which
> > > > was used to identify the superblock for a given cdev. This approach was
> > > > rejected by Christoph ("I don't think the cdev has any business in core
> > > > VFS code.").  Apart from that UBIFS can not only be mounted with a path
> > > > to the character device (mount -t ubifs /dev/ubix_y /mnt) but also in
> > > > the form ubix:volname (mount -t ubifs ubix:volname /mnt) in which case
> > > > userspace doesn't have any valid path it could pass in quotactl.
> > > >
> > > > An idea out of this would be to allow to pass the mountpoint instead of
> > > > the path to the block device in quotactl which would work with nfs or
> > > > even tmpfs aswell. Would that be acceptable? Any other ideas?
> > > 
> > > *kind ping*
> > > 
> > > Jan, another thing Sascha and I are not sure about, what are the consistency
> > > constraints of the quota file?
> > > If I read the code correctly, quota just writes to the quota file and
> > > assumes that
> > > the file system makes sure about consistency. Either by fsckfixing the quota
> > > file or having a data journal for the quota file.
> > > In case of UBIFS where we have a data journal this should be doable.
> > > Is it okay when the quota file has S_SYNC set?
> > 
> > S_SYNC won't help us. We need to make sure that a change of an inode and
> > the corresponding update to the quota file is done atomically. Otherwise
> > it may happen that we only change the size of an inode, but miss the
> > corresponding quota updates, or depending on the implementation, maybe
> > the other way round.
> 
> This is why I said yesterday you need to touch the UBIFS journal replay code too.
> So, S_SYNC is not to keep the quota file consistent with UBIFS' state, it is
> to make sure we don't lose quota updates.

But how we handle a power cut between the update to the quota file and
the actual inode change then? During replay we'll find quota updates and
inode updates, but we do not have any information which quota update
belongs to which inode change.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
