Return-Path: <SRS0=FaK6=3Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA12C2D0B1
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2020 10:35:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC92320674
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2020 10:35:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WPhG96cp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC92320674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3Xwr1tGvMgeLl2MEs62KJF6iBQlbur/fgnvE0du2yw=; b=WPhG96cpvYisvs
	Uo16NiOKDeDu8QR+QznoL7xInnwzrZhVoN1FLK6cbq33aKkGFE7ivvnwfUwBElm10uhRa58QPGqD/
	znSXucigkjX1u7kfc0fBFxYjoAjArktmbg0Bfvlk97KOvKW2JYTJN/zFO5g60auulbz7697spMkCM
	lzo2utK4/q6UTPup5855JONgGbGM4X3FGHEN6uYJcYsWRhgUqAkf17rg12D2RdRUQZmZeygVfU03M
	itbtJRqBTw+cJ7FmVUZMo4yGEjbUAYKf/1Jq27Zhg57g+iNN/0qyK1DpCCOzuUd8SeFfqP0FhrxSm
	NslhGRH+ULSLwSkN+/Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyvYM-00023e-NN; Tue, 04 Feb 2020 10:35:34 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyvYJ-000201-SP
 for linux-mtd@lists.infradead.org; Tue, 04 Feb 2020 10:35:33 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iyvYC-0004wP-NX; Tue, 04 Feb 2020 11:35:24 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1iyvYB-0004Gi-3r; Tue, 04 Feb 2020 11:35:23 +0100
Date: Tue, 4 Feb 2020 11:35:23 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20200204103523.tbxzptf4lkr474yi@pengutronix.de>
References: <20200124131323.23885-1-s.hauer@pengutronix.de>
 <20200124131323.23885-2-s.hauer@pengutronix.de>
 <20200127104518.GC19414@quack2.suse.cz>
 <20200128100631.zv7cn726twylcmb7@pengutronix.de>
 <20200129012929.GV23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129012929.GV23230@ZenIV.linux.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:21:53 up 211 days, 14:32, 79 users,  load average: 0.16, 0.19,
 0.23
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_023531_920127_5F69F6E6 
X-CRM114-Status: GOOD (  21.40  )
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

On Wed, Jan 29, 2020 at 01:29:29AM +0000, Al Viro wrote:
> On Tue, Jan 28, 2020 at 11:06:31AM +0100, Sascha Hauer wrote:
> > Hi Jan,
> 
> > @@ -810,6 +811,36 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
> >  #endif
> >  }
> >  
> > +static struct super_block *quotactl_path(const char __user *special, int cmd,
> > +					 struct path *path)
> > +{
> > +	struct super_block *sb;
> > +	int ret;
> > +
> > +	ret = user_path_at(AT_FDCWD, special, LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
> > +			   path);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	sb = path->mnt->mnt_sb;
> > +restart:
> > +	if (quotactl_cmd_onoff(cmd))
> > +		down_write(&sb->s_umount);
> > +	else
> > +		down_read(&sb->s_umount);
> > +
> > +	if (quotactl_cmd_write(cmd) && sb->s_writers.frozen != SB_UNFROZEN) {
> > +		if (quotactl_cmd_onoff(cmd))
> > +			up_write(&sb->s_umount);
> > +		else
> > +			up_read(&sb->s_umount);
> > +		wait_event(sb->s_writers.wait_unfrozen,
> > +			   sb->s_writers.frozen == SB_UNFROZEN);
> > +		goto restart;
> > +	}
> > +
> > +	return sb;
> > +}
> 
> This partial duplicate of __get_super_thawed() guts does *not* belong here,
> especially not interleaved with quota-specific checks.
> 
> > +	if (q_path) {
> > +		if (quotactl_cmd_onoff(cmd))
> > +			up_write(&sb->s_umount);
> > +		else
> > +			up_read(&sb->s_umount);
> > +
> > +		path_put(&sb_path);
> > +	} else {
> > +		if (!quotactl_cmd_onoff(cmds))
> > +			drop_super(sb);
> > +		else
> > +			drop_super_exclusive(sb);
> > +	}
> 
> Er...  Why not have the same code that you've used to lock the damn thing
> (needs to be moved to fs/super.c) simply get a passive ref to it?  Then
> you could do the same thing, q_path or no q_path...

I am getting confused here. To an earlier version of this series you
responded:

> And for path-based you don't need to mess with superblock
> references - just keep the struct path until the end.  That
> will keep the superblock alive and active just fine.

I did that and got the objection from Jan:

> So I've realized that just looking up superblock with user_path_at() is not
> enough. Quota code also expects that the superblock will be locked
> (sb->s_umount) and filesystem will not be frozen (in case the quota
> operation is going to modify the filesystem). This is needed to serialize
> e.g. remount and quota operations or quota operations among themselves.

So after drawing circles we now seem to be back at passive references.
What I have now in my tree is this in fs/super.c, untested currently:

static bool __grab_super_thawed(struct super_block *sb, bool excl)
{
	while (1) {
		bool again = false;

		spin_lock(&sb_lock);

		if (hlist_unhashed(&sb->s_instances)) {
			spin_unlock(&sb_lock);
			return false;
		}

		sb->s_count++;
		spin_unlock(&sb_lock);

		if (excl)
			down_write(&sb->s_umount);
		else
			down_read(&sb->s_umount);

		if (sb->s_root && (sb->s_flags & SB_BORN)) {
			if (sb->s_writers.frozen == SB_UNFROZEN)
				return true;
			else
				again = true;
		}

		if (excl)
			up_write(&sb->s_umount);
		else
			up_read(&sb->s_umount);

		if (again)
			wait_event(sb->s_writers.wait_unfrozen,
				   sb->s_writers.frozen == SB_UNFROZEN);

		put_super(sb);

		if (!again)
			return false;
	}

	return ret;
}

int grab_super_thawed(struct super_block *sb)
{
	return __grab_super_thawed(sb, false);
}

int grab_super_exclusive_thawed(struct super_block *sb)
{
	return __grab_super_thawed(sb, true);
}

Does this look ok now?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
