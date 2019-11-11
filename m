Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C540C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 11:06:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D45D8214DB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 11:06:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iHozxOdR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D45D8214DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPhiUw1qozjWqRoZ0f/0wARbjiZ+XQGEah69/evlxQ0=; b=iHozxOdR9BNJvl
	sONqmd/Hrhl5+Wpt8srKWDqiMNUusVMRPcN7BRcKjo9CTRLR3JuCzPAv1dKMNpKpOEA2+VkezXFs3
	c8GhRa+hy1jOJo5NB6PTKs9i3Ay+4oUW7RSq8XVF8Cf34Z4nVlDVpk027gv/yo2yYY+XnH493zJKP
	NU7Bds5osdl7rsowS5mCZUyrSlbtLhv/U2bPgucSaNYfiKUKpKZ8dT7v/NH5+nUxAxExo6CDlxpic
	yaKvGrVeaQpOgo99ZuNmmjeVoF4phRkLUFj1ObS6V4+zg1u9Iqq/9pFekf6GluyXPkw+j4cZe3JYW
	nieNGrbnrMBpFBYzQI5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU7WP-0002o9-6U; Mon, 11 Nov 2019 11:06:13 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU7WF-0002nG-Ok
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 11:06:09 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3FBBABBD;
 Mon, 11 Nov 2019 11:05:59 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 39D281E4AD6; Mon, 11 Nov 2019 12:05:59 +0100 (CET)
Date: Mon, 11 Nov 2019 12:05:59 +0100
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 04/10] quota: Allow to pass mount path to quotactl
Message-ID: <20191111110559.GB13307@quack2.suse.cz>
References: <20191030152702.14269-1-s.hauer@pengutronix.de>
 <20191030152702.14269-5-s.hauer@pengutronix.de>
 <20191101160706.GA23441@quack2.suse.cz>
 <20191111100807.dzomp2o7n3mch6xx@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191111100807.dzomp2o7n3mch6xx@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_030605_932457_7CB433F9 
X-CRM114-Status: GOOD (  24.38  )
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
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon 11-11-19 11:08:07, Sascha Hauer wrote:
> On Fri, Nov 01, 2019 at 05:07:06PM +0100, Jan Kara wrote:
> > On Wed 30-10-19 16:26:56, Sascha Hauer wrote:
> > > This patch introduces the Q_PATH flag to the quotactl cmd argument.
> > > When given, the path given in the special argument to quotactl will
> > > be the mount path where the filesystem is mounted, instead of a path
> > > to the block device.
> > > This is necessary for filesystems which do not have a block device as
> > > backing store. Particularly this is done for upcoming UBIFS support.
> > > 
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > 
> > Thanks for the patch! Some smaller comments below...
> > 
> > > ---
> > >  fs/quota/quota.c           | 37 ++++++++++++++++++++++++++++---------
> > >  include/uapi/linux/quota.h |  1 +
> > >  2 files changed, 29 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/fs/quota/quota.c b/fs/quota/quota.c
> > > index cb13fb76dbee..035cdd1b022b 100644
> > > --- a/fs/quota/quota.c
> > > +++ b/fs/quota/quota.c
> > > @@ -19,6 +19,7 @@
> > >  #include <linux/types.h>
> > >  #include <linux/writeback.h>
> > >  #include <linux/nospec.h>
> > > +#include <linux/mount.h>
> > >  
> > >  static int check_quotactl_permission(struct super_block *sb, int type, int cmd,
> > >  				     qid_t id)
> > > @@ -825,12 +826,16 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
> > >  {
> > >  	uint cmds, type;
> > >  	struct super_block *sb = NULL;
> > > -	struct path path, *pathp = NULL;
> > > +	struct path path, *pathp = NULL, qpath;
> > 
> > Maybe call these two 'file_path', 'file_pathp', and 'sb_path' to make it
> > clearer which path is which?
> > 
> > >  	int ret;
> > > +	bool q_path;
> > >  
> > >  	cmds = cmd >> SUBCMDSHIFT;
> > >  	type = cmd & SUBCMDMASK;
> > >  
> > > +	q_path = cmds & Q_PATH;
> > > +	cmds &= ~Q_PATH;
> > > +
> > >  	/*
> > >  	 * As a special case Q_SYNC can be called without a specific device.
> > >  	 * It will iterate all superblocks that have quota enabled and call
> > > @@ -855,19 +860,33 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
> > >  			pathp = &path;
> > >  	}
> > >  
> > > -	sb = quotactl_block(special, cmds);
> > > -	if (IS_ERR(sb)) {
> > > -		ret = PTR_ERR(sb);
> > > -		goto out;
> > > +	if (q_path) {
> > > +		ret = user_path_at(AT_FDCWD, special, LOOKUP_FOLLOW|LOOKUP_AUTOMOUNT,
> > > +				   &qpath);
> > > +		if (ret)
> > > +			goto out1;
> > > +
> > > +		sb = qpath.mnt->mnt_sb;
> > > +	} else {
> > > +		sb = quotactl_block(special, cmds);
> > > +		if (IS_ERR(sb)) {
> > > +			ret = PTR_ERR(sb);
> > > +			goto out;
> > > +		}
> > >  	}
> > >  
> > >  	ret = do_quotactl(sb, type, cmds, id, addr, pathp);
> > >  
> > > -	if (!quotactl_cmd_onoff(cmds))
> > > -		drop_super(sb);
> > > -	else
> > > -		drop_super_exclusive(sb);
> > > +	if (!q_path) {
> > > +		if (!quotactl_cmd_onoff(cmds))
> > > +			drop_super(sb);
> > > +		else
> > > +			drop_super_exclusive(sb);
> > > +	}
> > >  out:
> > > +	if (q_path)
> > > +		path_put(&qpath);
> > > +out1:
> > 
> > Why do you need out1? If you leave 'out' as is, things should just work.
> > And you can also combine the above if like:
> 
> See above where out1 is used. In this case qpath is not valid and I
> cannot call path_put() on it.

Right. But you also don't need to do path_put(&qpath) in case
quotactl_block() failed. So you can just jump to out1 there as well and
then 'out' is unused...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
