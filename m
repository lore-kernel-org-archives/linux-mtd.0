Return-Path: <SRS0=q3Mz=WL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27595C31E40
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Aug 2019 07:31:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF0B32063F
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Aug 2019 07:31:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DliQLW6q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF0B32063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00daclT2VExwq5GGWugp+l6KEDG4yGqxBdUDfrGfxLM=; b=DliQLW6qtPu/tz
	O6K4HgQE94k8qWQn/ROTxVvou0ei1l7ir/efY5hPPvDIC/PMuCEUIwEXtUIlgfN7Hirr0LCGHgoOJ
	pLg6RskfkiaeVxVxluBMxl9rIxDI0RbBCh8UpUZXRdqAd216cZEY9L5QtI7ssTqRvsgXK/gcjkyih
	6/x0dSPPYeWMLI8ird1/W8HPFTMG5Ad1uGyHzCSemR0N6058Ygn2BlhW2VuGNcVvZSqI48hRl189g
	Q4M3Al8w5q4Yz30Ru9/PwHxpN3DV5iAKAMOrGeRg9+PCLOSw0MIHh8XFomo4lt8lasCX+M4Z0g8qp
	n2s9OCk2uPtTQ6ZQpQMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyAER-0002Yk-5W; Thu, 15 Aug 2019 07:31:35 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyAEN-0002Y0-1P
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2019 07:31:33 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hyAEI-0008A0-Km; Thu, 15 Aug 2019 09:31:26 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hyAEG-0000RX-5L; Thu, 15 Aug 2019 09:31:24 +0200
Date: Thu, 15 Aug 2019 09:31:24 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: "Mainz, Roland" <R.Mainz@eckelmann.de>
Subject: Re: [PATCH 07/11] ubifs: Add support for FS_IOC_FS[SG]ETXATTR ioctls
Message-ID: <20190815073124.p2wqwyggh2nwvxhp@pengutronix.de>
References: <20190814121834.13983-1-s.hauer@pengutronix.de>
 <20190814121834.13983-8-s.hauer@pengutronix.de>
 <48831093afb8467b90ecf3c96601a2db@eckelmann.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48831093afb8467b90ecf3c96601a2db@eckelmann.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:29:56 up 38 days, 13:40, 48 users,  load average: 0.01, 0.16, 0.22
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_003131_084794_FF278245 
X-CRM114-Status: GOOD (  19.26  )
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
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Aug 14, 2019 at 02:11:08PM +0000, Mainz, Roland wrote:
> 
> 
> 
> > -----Original Message-----
> > From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
> > Sascha Hauer
> > Sent: Wednesday, August 14, 2019 2:19 PM
> > To: linux-fsdevel@vger.kernel.org
> > Cc: Richard Weinberger <richard@nod.at>; Sascha Hauer
> > <s.hauer@pengutronix.de>; linux-mtd@lists.infradead.org;
> > kernel@pengutronix.de; Jan Kara <jack@suse.com>
> > Subject: [PATCH 07/11] ubifs: Add support for FS_IOC_FS[SG]ETXATTR ioctls
> > 
> > The FS_IOC_FS[SG]ETXATTR ioctls are an alternative to FS_IOC_[GS]ETFLAGS
> > with additional features. This patch adds support for these ioctls.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  fs/ubifs/ioctl.c | 89
> > +++++++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 84 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c index
> > b9c4a51bceea..121aa1003e24 100644
> > --- a/fs/ubifs/ioctl.c
> > +++ b/fs/ubifs/ioctl.c
> > @@ -95,9 +95,39 @@ static int ubifs2ioctl(int ubifs_flags)
> >  	return ioctl_flags;
> >  }
> > 
> > -static int setflags(struct file *file, int flags)
> > +/* Transfer xflags flags to internal */ static inline unsigned long
> > +ubifs_xflags_to_iflags(__u32 xflags)
> >  {
> > -	int oldflags, err, release;
> > +	unsigned long iflags = 0;
> > +
> > +	if (xflags & FS_XFLAG_SYNC)
> > +		iflags |= UBIFS_APPEND_FL;
> 
> Erm... what does |FS_XFLAG_SYNC| have to do with |*APPEND| ? Is this a typo ?

Hm, some copy-paste accident probably. That's rubbish of course.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
