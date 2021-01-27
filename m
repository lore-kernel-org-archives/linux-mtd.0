Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023C8C433E6
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 15:21:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5989620771
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 15:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5989620771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q9e4sbaxphA+qcxuFnh25USi+MIow5lBLJs9eQlbPR0=; b=KGs/EGGWvqaCg2jnp0SkXer4a
	MwHYBaYYHQ24dNc3EmLH49M7u7n+XzqUxkuAbvsHEAkskcGLFNnmPf7bnpUdkGtX0f7pzfhnHcUi1
	JXlrgV4K5H0UkhlFCyZaWepZG9lOGsHqzagz5T5x7aUaphb83WszyX60jYS0GycIxmV9VyjwU/MmW
	DQxL6cbItSpIgtAxi1chhvXud9RMsyyx4xSKY+WQ7NTlHg6C3GmBu6nQlGy4W2TLA3dVKroCQGHze
	fY66I9rziJxVKzhWj7eBuBkWMTRsESVNvluB/0LOvK6JXntIjYo0+BmVCrMGWwfla4W1KBGNRANjj
	jC6GYHXvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4mcR-0006T9-Ey; Wed, 27 Jan 2021 15:20:31 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4mcL-0003It-BH
 for linux-mtd@merlin.infradead.org; Wed, 27 Jan 2021 15:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CKAPTT9uyc0MLrw/sgIOo68dqmi/j/U3pstLUPuGtbk=; b=ZqZ/PLrOx7GltsPP11zVfTKQDw
 WXpUB24qOxoa8adL5q6aaTaP7IFHTvxSRcRf3ReTTasATHx+N+6WaEL0bJnbTTL25T9k99AkGkakt
 WFFqNJBuy5LVszLQrDoIstLxZ3z0mgouMMfTPAR8jGLqZ+OkcsE7HmwO6WUQgXdWNUSkdxkz0tZXb
 tei7T0w3Tx7ocG+hfybvJs0IQHMtTQ+y6/18wNcxTFh/RtdrCcRvjPktItTNit1QOabFnrC0HnEaO
 60O2Xe2jg2nelhBZvwhgUFCjaFIUaK91zY5V6yaysXFRCT87v5Ap41OWAN2Obbfuez3I0rSXboYlZ
 wtQlfeqQ==;
Received: from mx2.suse.de ([195.135.220.15])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1l4m5q-0078SW-Cu
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 14:47:09 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AABA8ABDA;
 Wed, 27 Jan 2021 14:46:46 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 6151B1E14D0; Wed, 27 Jan 2021 15:46:46 +0100 (CET)
Date: Wed, 27 Jan 2021 15:46:46 +0100
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20210127144646.GB13717@quack2.suse.cz>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-2-s.hauer@pengutronix.de>
 <20210122171658.GA237653@infradead.org>
 <20210125083854.GB31738@pengutronix.de>
 <20210125154507.GH1175@quack2.suse.cz>
 <20210126104557.GB28722@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126104557.GB28722@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_144709_791470_32C88C9C 
X-CRM114-Status: GOOD (  30.93  )
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
Cc: Jan Kara <jack@suse.cz>, Richard Weinberger <richard@nod.at>,
 Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue 26-01-21 11:45:57, Sascha Hauer wrote:
> On Mon, Jan 25, 2021 at 04:45:07PM +0100, Jan Kara wrote:
> > On Mon 25-01-21 09:38:54, Sascha Hauer wrote:
> > > On Fri, Jan 22, 2021 at 05:16:58PM +0000, Christoph Hellwig wrote:
> > > > On Fri, Jan 22, 2021 at 04:15:29PM +0100, Sascha Hauer wrote:
> > > > > This patch introduces the Q_PATH flag to the quotactl cmd argument.
> > > > > When given, the path given in the special argument to quotactl will
> > > > > be the mount path where the filesystem is mounted, instead of a path
> > > > > to the block device.
> > > > > This is necessary for filesystems which do not have a block device as
> > > > > backing store. Particularly this is done for upcoming UBIFS support.
> > > > > 
> > > > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > > 
> > > > I hate overloading quotactl even more.  Why not add a new quotactl_path
> > > > syscall instead?
> > > 
> > > We can probably do that. Honza, what do you think?
> > 
> > Hum, yes, probably it would be cleaner to add a new syscall for this so
> > that we don't overload quotactl(2). I just didn't think of this.
> 
> How should the semantics of that new syscall look like?
> 
> The easiest and most obvious way would be to do it like the quotactl(2)
> and just replace the special argument with a path:
> 
> int quotactl_path(int cmd, const char *path, int id, caddr_t addr);

Yes, that's what I meant.

> If we try adding a new syscall then we could completely redefine the API
> and avoid the shortcomings of the original quotactl(2) if there are any.
> Can you foresee the discussions we end up in? I am afraid I am opening a
> can of worms here.
> OTOH there might be value in keeping the new syscall compatible to the
> existing one, but I don't know how much this argument counts.

That's a good question but also a can of worms as you write :). One obvious
problem with quotactl() is that's it's ioctl-like interface. So we have
several different operations mixed into a single syscall. Currently there
are these operations:

#define Q_SYNC     0x800001     /* sync disk copy of a filesystems quotas */
#define Q_QUOTAON  0x800002     /* turn quotas on */
#define Q_QUOTAOFF 0x800003     /* turn quotas off */
#define Q_GETFMT   0x800004     /* get quota format used on given filesystem */
#define Q_GETINFO  0x800005     /* get information about quota files */
#define Q_SETINFO  0x800006     /* set information about quota files */
#define Q_GETQUOTA 0x800007     /* get user quota structure */
#define Q_SETQUOTA 0x800008     /* set user quota structure */
#define Q_GETNEXTQUOTA 0x800009 /* get disk limits and usage >= ID */
<plus their XFS variants>

In a puristic world they'd be 9 different syscalls ... or somewhat less
because Q_GETNEXTQUOTA is a superset of Q_GETQUOTA, we could drop Q_SYNC
and Q_GETFMT because they have dubious value these days so we'd be left
with 6. I don't have a strong opinion whether 6 syscalls are worth the
cleanliness or whether we should go with just one new quotactl_path()
syscall. I've CCed linux-api in case other people have opinion.

Anyway, even if we go with single quotactl_path() syscall we should remove
the duplication between VFS and XFS quotactls when we are creating a new
syscall. Thoughts?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
