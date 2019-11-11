Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90408C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 10:08:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E85D214E0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 10:08:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KJpeeR5w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E85D214E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwpRTsfNwfGPL1J0BxWvBPdVhNl069sBnrNHt9taAlQ=; b=KJpeeR5wAfg6qg
	5fSqZbmyz5l3ENkUBTNw4OTMUUArVmN2fVR4nRV4wPV20cxsNgi+rQ7EXvL4XfdLv8CssnEeDdy/u
	65CTyQ7uMUom83W053PgDDM85HDNXSXrAdaBKsX9WP39XdRikcIN3xLudUzxm5AJ8bvzV6wJ2tnVC
	r1P7tleQJ1YUwIX4teTfiWCctUBQuFgJM9meh3p9mSn6ipOrUYr/WzSI3Tw8zGftD7Ljs0sPkwRQ8
	KRclTJ/b5fi0crm/WMYuYfP/YztVzJXgmwHd6c0terPApjGJDA7YEazV1TDZhoLWtjrmTwRwV7KOK
	fMR11FPJ75EuCA95VtAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6cI-0002eL-6t; Mon, 11 Nov 2019 10:08:14 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6cE-0002bv-H0
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 10:08:12 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iU6cC-0006uV-5z; Mon, 11 Nov 2019 11:08:08 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1iU6cB-0000CY-8J; Mon, 11 Nov 2019 11:08:07 +0100
Date: Mon, 11 Nov 2019 11:08:07 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 04/10] quota: Allow to pass mount path to quotactl
Message-ID: <20191111100807.dzomp2o7n3mch6xx@pengutronix.de>
References: <20191030152702.14269-1-s.hauer@pengutronix.de>
 <20191030152702.14269-5-s.hauer@pengutronix.de>
 <20191101160706.GA23441@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191101160706.GA23441@quack2.suse.cz>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:03:12 up 126 days, 16:13, 138 users,  load average: 0.25, 0.27,
 0.19
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_020810_561656_64DD4647 
X-CRM114-Status: GOOD (  25.68  )
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

On Fri, Nov 01, 2019 at 05:07:06PM +0100, Jan Kara wrote:
> On Wed 30-10-19 16:26:56, Sascha Hauer wrote:
> > This patch introduces the Q_PATH flag to the quotactl cmd argument.
> > When given, the path given in the special argument to quotactl will
> > be the mount path where the filesystem is mounted, instead of a path
> > to the block device.
> > This is necessary for filesystems which do not have a block device as
> > backing store. Particularly this is done for upcoming UBIFS support.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> Thanks for the patch! Some smaller comments below...
> 
> > ---
> >  fs/quota/quota.c           | 37 ++++++++++++++++++++++++++++---------
> >  include/uapi/linux/quota.h |  1 +
> >  2 files changed, 29 insertions(+), 9 deletions(-)
> > 
> > diff --git a/fs/quota/quota.c b/fs/quota/quota.c
> > index cb13fb76dbee..035cdd1b022b 100644
> > --- a/fs/quota/quota.c
> > +++ b/fs/quota/quota.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/types.h>
> >  #include <linux/writeback.h>
> >  #include <linux/nospec.h>
> > +#include <linux/mount.h>
> >  
> >  static int check_quotactl_permission(struct super_block *sb, int type, int cmd,
> >  				     qid_t id)
> > @@ -825,12 +826,16 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
> >  {
> >  	uint cmds, type;
> >  	struct super_block *sb = NULL;
> > -	struct path path, *pathp = NULL;
> > +	struct path path, *pathp = NULL, qpath;
> 
> Maybe call these two 'file_path', 'file_pathp', and 'sb_path' to make it
> clearer which path is which?
> 
> >  	int ret;
> > +	bool q_path;
> >  
> >  	cmds = cmd >> SUBCMDSHIFT;
> >  	type = cmd & SUBCMDMASK;
> >  
> > +	q_path = cmds & Q_PATH;
> > +	cmds &= ~Q_PATH;
> > +
> >  	/*
> >  	 * As a special case Q_SYNC can be called without a specific device.
> >  	 * It will iterate all superblocks that have quota enabled and call
> > @@ -855,19 +860,33 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
> >  			pathp = &path;
> >  	}
> >  
> > -	sb = quotactl_block(special, cmds);
> > -	if (IS_ERR(sb)) {
> > -		ret = PTR_ERR(sb);
> > -		goto out;
> > +	if (q_path) {
> > +		ret = user_path_at(AT_FDCWD, special, LOOKUP_FOLLOW|LOOKUP_AUTOMOUNT,
> > +				   &qpath);
> > +		if (ret)
> > +			goto out1;
> > +
> > +		sb = qpath.mnt->mnt_sb;
> > +	} else {
> > +		sb = quotactl_block(special, cmds);
> > +		if (IS_ERR(sb)) {
> > +			ret = PTR_ERR(sb);
> > +			goto out;
> > +		}
> >  	}
> >  
> >  	ret = do_quotactl(sb, type, cmds, id, addr, pathp);
> >  
> > -	if (!quotactl_cmd_onoff(cmds))
> > -		drop_super(sb);
> > -	else
> > -		drop_super_exclusive(sb);
> > +	if (!q_path) {
> > +		if (!quotactl_cmd_onoff(cmds))
> > +			drop_super(sb);
> > +		else
> > +			drop_super_exclusive(sb);
> > +	}
> >  out:
> > +	if (q_path)
> > +		path_put(&qpath);
> > +out1:
> 
> Why do you need out1? If you leave 'out' as is, things should just work.
> And you can also combine the above if like:

See above where out1 is used. In this case qpath is not valid and I
cannot call path_put() on it.

I see that having q_path and qpath as different variables is confusing,
but as you say I will rename qpath to sb_path, so hopefully this
already makes it clearer.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
