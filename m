Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC940C282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 09:22:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF0E218D0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 09:22:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aP0fCKzJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EF0E218D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Ubb7rf4cclIcd9sGJ5HBEo1kvYwRP89gV28DiIRC1s=; b=aP0fCKzJQAk0Wm
	rDrPKHX5OuUD9nJaj+xSu27aoQC3LdMiJ21EEkdZx3eNJ61CSqH7Ba5Ho95zZf7P1W7jmDkLvvrdr
	0zTxQKYcMRrvKtAG7yp/sGdpej/x2O++3/rjmoBn0pKWXsuG6TYLzkhjGnQBo+M3Eauce6CwT1SiV
	aTGKCC5vPbq/a1oW/C0o2FJ26JatvC8fYebaVagYY0WtGaB7v/0EJ5Hwghz1fOdzl27o83RNa2+uy
	7YTtp1hDMFIQSSVPWuz+VvSrp62H9x9m8pNz5r7NVSu6yBQ0fXNuWaboSr2uON5tLsD3bPQ+UrYu6
	MqEaFD2pWLNE1NCrXa1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmxgl-0006WE-MX; Fri, 25 Jan 2019 09:22:15 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmxgh-0006Vc-Pf
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 09:22:14 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gmxgX-0000Sv-48; Fri, 25 Jan 2019 10:22:01 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gmxgS-0001Ke-EP; Fri, 25 Jan 2019 10:21:56 +0100
Date: Fri, 25 Jan 2019 10:21:56 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: UBIFS quota support
Message-ID: <20190125092156.ck77sdqainmmewuz@pengutronix.de>
References: <20190110114448.vcx6w76ibmxwvlh3@pengutronix.de>
 <CAFLxGvyrNaq6ya9TNr-tdEEbV=qsi8qEko6R7oJ-DtkxPJMk0g@mail.gmail.com>
 <20190123154743.GL13149@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190123154743.GL13149@quack2.suse.cz>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:43:08 up 3 days, 18:56, 65 users, load average: 0.03, 0.08, 0.09
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_012211_988020_7205045E 
X-CRM114-Status: GOOD (  32.70  )
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
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jan,

On Wed, Jan 23, 2019 at 04:47:43PM +0100, Jan Kara wrote:
> Hi,
> 
> sorry for not getting to you earlier, this email got burried in my inbox...
> 
> On Wed 23-01-19 00:07:12, Richard Weinberger wrote:
> > On Thu, Jan 10, 2019 at 12:45 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
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
> 
> So after some thought, yes, I think that passing mount point as a specifier
> identifying a block device will be OK.
> 
> > *kind ping*
> > 
> > Jan, another thing Sascha and I are not sure about, what are the
> > consistency constraints of the quota file?
> > If I read the code correctly, quota just writes to the quota file and
> > assumes that the file system makes sure about consistency. Either by fsck
> > fixing the quota file or having a data journal for the quota file.
> 
> Essentially yes but it depends on how exactly you decide to implement quota
> files. First let me explain to you some details about how quota subsystem
> works.
> 
> When quota structure (struct dquot) for some user gets
> first attached to some inode we call ->acquire_dquot callback from
> dquot_operations. This is responsible for allocating necessary disk space
> for the structure (if not already allocated) and otherwise making sure that
> the quota information can be easily stored later. Also it should fill in
> current quota information if the structure for given ID already exists.

UBIFS has no idea of transactions and works a little different from
ext4. In UBIFS all filesystem data and metadata are stored in the leaf
nodes of a b+tree. These leaf nodes are constantly written to flash and
would be enough to reconstruct the FS. From time to time UBIFS does a
commit and writes the index nodes to flash. During recovery the tree can
be read from the index nodes from the last commit. The remaining leaf
nodes that were written after the last commit are then scanned and added
to the tree during replay.

Quota seems to work in the way that it has callbacks into the FS to read
and update dqblks. This is not very suitable for UBIFS. Instead it would
be nicer to read the full quota data from flash and hand it over to
quota. When UBIFS does a commit it would then request a consistent view
of the quota data and write it back to flash. During replay of an
uncleanly mounted FS UBIFS could read the quota data from the last
commit and update it with the remaining leaf nodes that need to be
replayed anyway.

In the latest UBIFS quota patchset storing the quota data is not safe
for unclean remounts, the data will become inconsistent with the actual
filesystem state.

Thinking about it storing the quota data is completely optional. In UBIFS
it's easy to retrieve the quota data by scanning the index tree during mount
time. The quota limits could be set during runtime by some init script.
For our usecase I think there's no need to store the limits in the FS
itself. With this I could turn the UBIFS quota patches into something
useful and consistently working with relatively little effort. Storing
the quota data on flash needs some discussion how to integrate properly
into UBIFS, but becomes an optimization left for a future exercise.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
