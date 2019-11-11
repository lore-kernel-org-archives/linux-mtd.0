Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13B6C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 11:15:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0E2721783
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 11:15:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0MeJ0tc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0E2721783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFYGB3hSbzEHeGJtB/ZSpkANcbU6Rd+nEp7sr6+79Xg=; b=m0MeJ0tcjj8BCY
	Jh49j1+iEPxVcWwA1s2iZdXDNq/+DgoOWS0KFySEycAPxYiNFwqGTNHI+4AWcu/EQbf0BKzCBieF5
	Bd/zB3K6jYN+yabhAT8dKgWPnhDRik8mcUl1q8CqbNDU0v9Qs3smv77NqWAAzxMJS8QXYA+njj5hp
	YQh4jYa27SH7jaBj3hjGv1o+RUu1OUCUV50kjGjQ+vplorcHcT4l8mJQ+ED0cK7bYzE7A9/458Qtg
	Z0h+3PqjLAi/Oe0TSu0U2r39fzfl7n2TKSWre332leQM3lv81BGP/NTT/PXLNIVN1LoC6qOT13j75
	qLrWqajLeXvsAhgNvJUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU7f0-0006Kr-26; Mon, 11 Nov 2019 11:15:06 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU7et-0006Io-RO
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 11:15:02 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iU7er-0005tS-BT; Mon, 11 Nov 2019 12:14:57 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1iU7eo-0003JR-C1; Mon, 11 Nov 2019 12:14:54 +0100
Date: Mon, 11 Nov 2019 12:14:54 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 04/10] quota: Allow to pass mount path to quotactl
Message-ID: <20191111111454.7ebq4hhdcnakpnls@pengutronix.de>
References: <20191030152702.14269-1-s.hauer@pengutronix.de>
 <20191030152702.14269-5-s.hauer@pengutronix.de>
 <20191101160706.GA23441@quack2.suse.cz>
 <20191111100807.dzomp2o7n3mch6xx@pengutronix.de>
 <20191111110559.GB13307@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191111110559.GB13307@quack2.suse.cz>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:14:02 up 126 days, 17:24, 139 users,  load average: 0.07, 0.14,
 0.14
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_031500_153747_3F59F8B5 
X-CRM114-Status: GOOD (  20.46  )
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

On Mon, Nov 11, 2019 at 12:05:59PM +0100, Jan Kara wrote:
> On Mon 11-11-19 11:08:07, Sascha Hauer wrote:
> > On Fri, Nov 01, 2019 at 05:07:06PM +0100, Jan Kara wrote:
> > > On Wed 30-10-19 16:26:56, Sascha Hauer wrote:
> > > > This patch introduces the Q_PATH flag to the quotactl cmd argument.
> > > > When given, the path given in the special argument to quotactl will
> > > > be the mount path where the filesystem is mounted, instead of a path
> > > > to the block device.
> > > > This is necessary for filesystems which do not have a block device as
> > > > backing store. Particularly this is done for upcoming UBIFS support.
> > > > 
> > > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > 
> > > Thanks for the patch! Some smaller comments below...
> > > 
> > > > ---
> > > >  fs/quota/quota.c           | 37 ++++++++++++++++++++++++++++---------
> > > >  include/uapi/linux/quota.h |  1 +
> > > >  2 files changed, 29 insertions(+), 9 deletions(-)
> > > > 
> > > > -	if (!quotactl_cmd_onoff(cmds))
> > > > -		drop_super(sb);
> > > > -	else
> > > > -		drop_super_exclusive(sb);
> > > > +	if (!q_path) {
> > > > +		if (!quotactl_cmd_onoff(cmds))
> > > > +			drop_super(sb);
> > > > +		else
> > > > +			drop_super_exclusive(sb);
> > > > +	}
> > > >  out:
> > > > +	if (q_path)
> > > > +		path_put(&qpath);
> > > > +out1:
> > > 
> > > Why do you need out1? If you leave 'out' as is, things should just work.
> > > And you can also combine the above if like:
> > 
> > See above where out1 is used. In this case qpath is not valid and I
> > cannot call path_put() on it.
> 
> Right. But you also don't need to do path_put(&qpath) in case
> quotactl_block() failed. So you can just jump to out1 there as well and
> then 'out' is unused...

Ah, I see. Ok, will do this.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
