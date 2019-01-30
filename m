Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE92C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 12:45:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436E120882
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 12:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pEuj/LLZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 436E120882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRR9oxdDJJMVwWFjaUpXBXh++thpkWJP1yLFV9Lie0c=; b=pEuj/LLZQZhiEn
	7849QQnrhSFIjl4fOtCighWlk8KvXZNugnUcy2DUNfu9/6oZHniuOXlcqxHJoCwNSoPXRYAhZJMwa
	9mfPUFxWE/CS6yNcxcoHxF62kZKEPp4Cc0z/0sPWoAh8JrBallRrP8fwzft6RtqSitYz6E5LaJaK/
	hNrzE0fRTxODg3rEQWwOVFboI3m+MgifjL/cO/S8QNk2UWhWqnQCIiO221NDniilD07bJgYFx6soc
	uUT4GUOX4i8vpIo21FvDK1Inac50W0LiS7PwfNl6Ok7RaKwSf9ujrmeUysOuf5wEQGtqZWR7krHje
	UWaJXBx1q9A6UOg5XLrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gopFP-0003rf-Rr; Wed, 30 Jan 2019 12:45:43 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gopFM-0003qc-8M
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 12:45:42 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 82426AE4B;
 Wed, 30 Jan 2019 12:45:35 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 29F021E3FFD; Wed, 30 Jan 2019 13:45:35 +0100 (CET)
Date: Wed, 30 Jan 2019 13:45:35 +0100
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: UBIFS quota support
Message-ID: <20190130124535.GE30203@quack2.suse.cz>
References: <20190110114448.vcx6w76ibmxwvlh3@pengutronix.de>
 <CAFLxGvyrNaq6ya9TNr-tdEEbV=qsi8qEko6R7oJ-DtkxPJMk0g@mail.gmail.com>
 <20190123154743.GL13149@quack2.suse.cz>
 <20190125092156.ck77sdqainmmewuz@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190125092156.ck77sdqainmmewuz@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_044540_589218_49ADBCA5 
X-CRM114-Status: GOOD (  37.25  )
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
 Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

On Fri 25-01-19 10:21:56, Sascha Hauer wrote:
> On Wed, Jan 23, 2019 at 04:47:43PM +0100, Jan Kara wrote:
> > sorry for not getting to you earlier, this email got burried in my inbox...
> > 
> > On Wed 23-01-19 00:07:12, Richard Weinberger wrote:
> > > On Thu, Jan 10, 2019 at 12:45 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
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
> > 
> > So after some thought, yes, I think that passing mount point as a specifier
> > identifying a block device will be OK.
> > 
> > > *kind ping*
> > > 
> > > Jan, another thing Sascha and I are not sure about, what are the
> > > consistency constraints of the quota file?
> > > If I read the code correctly, quota just writes to the quota file and
> > > assumes that the file system makes sure about consistency. Either by fsck
> > > fixing the quota file or having a data journal for the quota file.
> > 
> > Essentially yes but it depends on how exactly you decide to implement quota
> > files. First let me explain to you some details about how quota subsystem
> > works.
> > 
> > When quota structure (struct dquot) for some user gets
> > first attached to some inode we call ->acquire_dquot callback from
> > dquot_operations. This is responsible for allocating necessary disk space
> > for the structure (if not already allocated) and otherwise making sure that
> > the quota information can be easily stored later. Also it should fill in
> > current quota information if the structure for given ID already exists.
> 
> UBIFS has no idea of transactions and works a little different from
> ext4. In UBIFS all filesystem data and metadata are stored in the leaf
> nodes of a b+tree. These leaf nodes are constantly written to flash and
> would be enough to reconstruct the FS. From time to time UBIFS does a
> commit and writes the index nodes to flash. During recovery the tree can
> be read from the index nodes from the last commit. The remaining leaf
> nodes that were written after the last commit are then scanned and added
> to the tree during replay.
> 
> Quota seems to work in the way that it has callbacks into the FS to read
> and update dqblks. This is not very suitable for UBIFS. Instead it would

Yes, generally it works by requesting loading / storing of quota
information for a particular user from the filesystem.

> be nicer to read the full quota data from flash and hand it over to
> quota. When UBIFS does a commit it would then request a consistent view
> of the quota data and write it back to flash. During replay of an
> uncleanly mounted FS UBIFS could read the quota data from the last
> commit and update it with the remaining leaf nodes that need to be
> replayed anyway.

Well, I don't think writing all quota data for each commit is a good
design. That will write out lot of unnecessary stuff that didn't change
since last time. It is like if you rewrite the whole file to update
one block in it... Similarly loading all quota data doesn't look great for
performance. There can be thousands or tens of thousands different users of
the filesystem (yes, I've seen such deployments) and you don't want to read
and keep in memory information you don't currently need. But I guess UBIFS
is targetted at smaller deployments?

Anyway, what is easily doable is that you would just ignore requests for
update from quota subsystem (just let quota subsystem mark dquot as dirty)
and then on commit call dquot_writeback_dquots() that will call
->write_dquot callback for each dquot that is dirty. That way you'd get
full dump of dquots that changed since last commit. You'd need to somehow
make sure this gets merged with information from previous commit. Then on
crash recovery you'd load quota information from commit and update it with
the changes that happened since that last commit.

> In the latest UBIFS quota patchset storing the quota data is not safe
> for unclean remounts, the data will become inconsistent with the actual
> filesystem state.
> 
> Thinking about it storing the quota data is completely optional. In UBIFS
> it's easy to retrieve the quota data by scanning the index tree during mount
> time. The quota limits could be set during runtime by some init script.
> For our usecase I think there's no need to store the limits in the FS
> itself. With this I could turn the UBIFS quota patches into something
> useful and consistently working with relatively little effort. Storing
> the quota data on flash needs some discussion how to integrate properly
> into UBIFS, but becomes an optimization left for a future exercise.

Honestly loading quota limits by init scripts looks like a hack to me. Note
that quota limits rarely change so you can easily store them separately
from usage information and load them on mount. Since setting of limits does
not have to be crash-safe (well, it needs to keep the quota information in
a state that is recoverable by mount but it doesn't need to coordinate with
any other filesystem operations), I don't think implementing that would be
hard...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
