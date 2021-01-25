Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B216C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 08:39:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD97D224DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 08:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD97D224DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r5Ta/H+sINkYbg+eYSPree4cUFeZutELMFFJ0BsEPJE=; b=JQ/PF3IP8ekZVukAf7Wkpw9Hk
	iRSySBtj+WDeLChYk2n3RIa4DJ468eUrEDfKSLXMYsJT4lgPFQNigFsJ3DDIKe7GLqfSHd0n5GSya
	dciP8KLHaVa7gD6E19o++tiDHM4TUr9sG+3eBYsQW7PQKIWe4p5WeCJNgRwzEljr79J32x05a/Kbj
	Xj3EXAo1CuDZLclivyT6so6CuzME3Ytb4p02yNv8azSSFhgfoceF0SwU36hEo8vdw/B9/qBUgmHV3
	c/dGXFlT66nilVMUIAXD0BYgUSxkvtmEamhwenDkJNdEjH3dG3AnaIr0/dZZCQDHNTypaJjBFyJAy
	v+vhAy3VA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3xOq-0002ZI-SV; Mon, 25 Jan 2021 08:39:04 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3xOn-0002Ye-H5
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 08:39:02 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l3xOi-0007V3-1o; Mon, 25 Jan 2021 09:38:56 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l3xOg-0008Hs-Lq; Mon, 25 Jan 2021 09:38:54 +0100
Date: Mon, 25 Jan 2021 09:38:54 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20210125083854.GB31738@pengutronix.de>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-2-s.hauer@pengutronix.de>
 <20210122171658.GA237653@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210122171658.GA237653@infradead.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:17:40 up 53 days, 18:44, 60 users,  load average: 0.12, 0.09, 0.09
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_033901_614426_808FCA96 
X-CRM114-Status: GOOD (  29.16  )
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
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 22, 2021 at 05:16:58PM +0000, Christoph Hellwig wrote:
> On Fri, Jan 22, 2021 at 04:15:29PM +0100, Sascha Hauer wrote:
> > This patch introduces the Q_PATH flag to the quotactl cmd argument.
> > When given, the path given in the special argument to quotactl will
> > be the mount path where the filesystem is mounted, instead of a path
> > to the block device.
> > This is necessary for filesystems which do not have a block device as
> > backing store. Particularly this is done for upcoming UBIFS support.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> I hate overloading quotactl even more.  Why not add a new quotactl_path
> syscall instead?

We can probably do that. Honza, what do you think?

> 
> > +static struct super_block *quotactl_sb(dev_t dev, int cmd)
> >  {
> >  	struct super_block *sb;
> >  	bool excl = false, thawed = false;
> >  
> >  	if (quotactl_cmd_onoff(cmd)) {
> >  		excl = true;
> > @@ -901,12 +887,50 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
> >  		goto retry;
> >  	}
> >  	return sb;
> > +}
> > +
> > +/*
> > + * look up a superblock on which quota ops will be performed
> > + * - use the name of a block device to find the superblock thereon
> > + */
> > +static struct super_block *quotactl_block(const char __user *special, int cmd)
> > +{
> > +#ifdef CONFIG_BLOCK
> > +	struct filename *tmp = getname(special);
> > +	int error;
> > +	dev_t dev;
> >  
> > +	if (IS_ERR(tmp))
> > +		return ERR_CAST(tmp);
> > +	error = lookup_bdev(tmp->name, &dev);
> > +	putname(tmp);
> > +	if (error)
> > +		return ERR_PTR(error);
> > +
> > +	return quotactl_sb(dev, cmd);
> >  #else
> >  	return ERR_PTR(-ENODEV);
> >  #endif
> 
> Normal kernel style would be to keep the ifdef entirely outside the
> function.

It has been like this before, so changing this should be done in an
extra patch. Not sure if it's worth it though.

> 
> > +static struct super_block *quotactl_path(const char __user *special, int cmd)
> > +{
> > +	struct super_block *sb;
> > +	struct path path;
> > +	int error;
> > +
> > +	error = user_path_at(AT_FDCWD, special, LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
> > +			   &path);
> 
> This adds an overly long line.

ok, will change.

> 
> > +	if (error)
> > +		return ERR_PTR(error);
> > +
> > +	sb = quotactl_sb(path.mnt->mnt_sb->s_dev, cmd);
> 
> I think quotactl_sb should take the superblock directly.  This will
> need a little refactoring of user_get_super, but will lead to much
> better logic.

What do you mean by "take"? Take the superblock as an argument to
quotactl_sb() or take a reference to the superblock?
Sorry, I don't really get where you aiming at.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
