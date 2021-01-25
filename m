Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04C7C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 15:46:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA3D2224C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 15:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CA3D2224C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9rabsm0BHku2JXczy/XIDgijapmFzdTyqWEcN1n6JC4=; b=xOyaRpMGnPl4Zu4tsP8FeevJv
	FtPeyF9tHP+AloK06FA7RX/y6pz44+dVJsXrse9ceUUsMfNk8DhuKpD04h/EnQSOF6gzWfJgOUP1a
	aONAhhayZuiPseLqIAISuA9hEbZqWZ//tZHnyVhz+2laFhb1d4mUk55zwHeYS5oRcFoc1cQvq6fh3
	hCXt9tqOhuXEwjmV0h7quujdzuDCYV9XE/bsRgOpzBICf/EIWaahA46kG2s12TL1lXwxxwMoR8SM1
	2MyjOL9rsxPAPWPE4G5WI7nlnQNa4U3R41Aj8iB/O8URaxHRJISLiPqwEnJeo/mEM46OE/BVYIAWd
	eb+u7Invg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l443I-00066I-O7; Mon, 25 Jan 2021 15:45:16 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l443F-00065I-Sd
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 15:45:14 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9FEA9AD6A;
 Mon, 25 Jan 2021 15:45:07 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 44CD21E14B3; Mon, 25 Jan 2021 16:45:07 +0100 (CET)
Date: Mon, 25 Jan 2021 16:45:07 +0100
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20210125154507.GH1175@quack2.suse.cz>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-2-s.hauer@pengutronix.de>
 <20210122171658.GA237653@infradead.org>
 <20210125083854.GB31738@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125083854.GB31738@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_104514_039193_DB09D143 
X-CRM114-Status: GOOD (  28.00  )
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
Cc: Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon 25-01-21 09:38:54, Sascha Hauer wrote:
> On Fri, Jan 22, 2021 at 05:16:58PM +0000, Christoph Hellwig wrote:
> > On Fri, Jan 22, 2021 at 04:15:29PM +0100, Sascha Hauer wrote:
> > > This patch introduces the Q_PATH flag to the quotactl cmd argument.
> > > When given, the path given in the special argument to quotactl will
> > > be the mount path where the filesystem is mounted, instead of a path
> > > to the block device.
> > > This is necessary for filesystems which do not have a block device as
> > > backing store. Particularly this is done for upcoming UBIFS support.
> > > 
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > 
> > I hate overloading quotactl even more.  Why not add a new quotactl_path
> > syscall instead?
> 
> We can probably do that. Honza, what do you think?

Hum, yes, probably it would be cleaner to add a new syscall for this so
that we don't overload quotactl(2). I just didn't think of this.

> > > +static struct super_block *quotactl_path(const char __user *special, int cmd)
> > > +{
> > > +	struct super_block *sb;
> > > +	struct path path;
> > > +	int error;
> > > +
> > > +	error = user_path_at(AT_FDCWD, special, LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
> > > +			   &path);
> > 
> > This adds an overly long line.
> 
> ok, will change.
> 
> > 
> > > +	if (error)
> > > +		return ERR_PTR(error);
> > > +
> > > +	sb = quotactl_sb(path.mnt->mnt_sb->s_dev, cmd);
> > 
> > I think quotactl_sb should take the superblock directly.  This will
> > need a little refactoring of user_get_super, but will lead to much
> > better logic.
> 
> What do you mean by "take"? Take the superblock as an argument to
> quotactl_sb() or take a reference to the superblock?
> Sorry, I don't really get where you aiming at.

I think Christoph was pointing at the fact it is suboptimal to search for
superblock by device number when you already have a pointer to it.  And I
guess he was suggesting we could pass 'sb' pointer to quotactl_sb() when we
already have it. Although to be honest, I'm not sure how Christoph imagines
the refactoring of user_get_super() he mentions - when we have a path
looked up through user_path(), that pins the superblock the path is on so
it cannot be unmounted. So perhaps quotactl_sb() can done like:

	...
retry:
	if (passed_sb) {
		sb = passed_sb;
		sb->s_count++;
		if (excl)
			down_write(&sb->s_umount);
		else
			down_read(&sb->s_umount);
	} else {
		sb = user_get_super(dev, excl);
		if (!sb)
			return ERR_PTR(-ENODEV);
	}
	...


								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
