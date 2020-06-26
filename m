Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4075C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:23:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A772070A
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:23:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KRXYZBS1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Arl9jcn4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A772070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YcYNOs8mhpb0U3wmHYNdM6P/MCxt0D3mL0Gcm3A37y8=; b=KRXYZBS1Prbi0hAtxf+hOvLss
	1W2zI17J2PiCfaQ6fCsVyzOMEch0YxDmwDbsxzqJV/LkRRiSA0fyVlHQ7FKWHMV1IsZkp55ZWvfGq
	EbR16ye6Evyr3XnTetrrxWBR7TnPjqReu+1cWoITxDQzlyFsjtvg2Z+xH9Wqh2cnJTkgSOJKmoods
	7jULcFa9F5B4zogEYd9dRKc4TCAJRE8PFmyvaZLzf8tuAEoU1CsKS1oeg/h887JpaLsIODlSD7E4m
	PO5fRDuZNEcwZhqgyHXeanqjIflwb8xpRWerKCL0PsFD5qEifrnX7X9v9LgT70ziav2iLJO9tYBiw
	GvwtAGlPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolV3-0000z6-Kn; Fri, 26 Jun 2020 10:22:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolQO-00073y-3y
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 10:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pRozcZXBVsJc+iyMC5gSyDGwlDQwrWemz4aXhPd6Q6s=; b=Arl9jcn4GxZXKwL99gkPulAMG2
 t27fnWnnomzjTh3G0vdeO8jAdnHAPfk3yChhL2Q+Le6+R2dmLQIcSJnma9uCQ7Lx0n2AWApcLvuM0
 L3Fqt87DB8yW9gska9KDMQBe/t5hXlYIQRLJjdT275ayxb0so63bIrXg+bOgD6IA73aPPdc21zB9V
 bxWb2kaB3+ORvjk7LUkkd1znWilglnrXYjfrMeqtBYUS8pmaIhl3hM+5UvSXhP0sO0yxJ3FxenXVz
 xuRAB0li0bbA16HCv11InTWTwf3o2iP/XypevhsHGnZXZhyrVZZjpsu/FekNcQZgR2bhiFHrj8NhN
 W8O1fcGw==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojRQ-0008IZ-TE
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 08:10:35 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1jojRM-0006LF-NI; Fri, 26 Jun 2020 10:10:28 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1jojRM-0003lF-DC; Fri, 26 Jun 2020 10:10:28 +0200
Date: Fri, 26 Jun 2020 10:10:28 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Torben Hohn <torben.hohn@linutronix.de>
Subject: Re: [PATCH 1/1] ubifs: support authentication, for ro mount, when no
 key is given
Message-ID: <20200626081028.GE19105@pengutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200625155927.28430-2-torben.hohn@linutronix.de>
 <20200626043120.GA19105@pengutronix.de>
 <20200626072714.GH15356@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626072714.GH15356@linutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:57:50 up 127 days, 15:28, 115 users,  load average: 0.03, 0.10,
 0.13
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_091033_082314_BF665124 
X-CRM114-Status: GOOD (  35.71  )
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
Cc: richard@nod.at, bigeasy@linutronix.de, linux-mtd@lists.infradead.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 26, 2020 at 09:27:14AM +0200, Torben Hohn wrote:
> On Fri, Jun 26, 2020 at 06:31:20AM +0200, Sascha Hauer wrote:
> > Hi Torben,
> > 
> > On Thu, Jun 25, 2020 at 05:59:27PM +0200, Torben Hohn wrote:
> > > diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> > > index 7fc2f3f07c16..ec95f1f50e5e 100644
> > > --- a/fs/ubifs/super.c
> > > +++ b/fs/ubifs/super.c
> > > @@ -1291,6 +1291,17 @@ static int mount_ubifs(struct ubifs_info *c)
> > >  			err = -EINVAL;
> > >  			goto out_free;
> > >  		}
> > > +	} else if (c->auth_hash_name) {
> > > +		if (IS_ENABLED(CONFIG_UBIFS_FS_AUTHENTICATION)) {
> > > +			err = ubifs_init_authentication_read_only(c);
> > > +			if (err)
> > > +				goto out_free;
> > > +		} else {
> > > +			ubifs_err(c, "auth_hash_name, but UBIFS is built without"
> > > +				  " authentication support");
> > > +			err = -EINVAL;
> > > +			goto out_free;
> > > +		}
> > >  	}
> > 
> > In case we don't have a key available for HMAC and can only verify the
> > FS is correctly signed then we have to be sure that we are mounting
> > readonly. This means the above needs an additional check for
> > c->ro_mount.
> 
> Indeed, i had that check in authenticate_sb_node() in an earlier
> version, and forgot to add it here.
> 
> Will do.
> 
> > 
> > Once we can be sure that UBIFS is in readonly mode when we can't do HMAC
> > then there's no point in adding a ubifs_authenticated_write(), because
> > the places where you call it will never be hit in a readonly mounted
> > filesystem.
> 
> The point is making sure, that it really is never hit in a readonly
> filesystem. Now, and in the future. If we miss one point, we might
> trigger the hmac code with an empty hmac. Although it might just crash.

If that's your point then you can add a ubifs_assert(c, c->ro_mount) at
those places. This has the advantage that it triggers not only in
authenticated mode, but also in unauthenticated mode. Please add this
assertion explicitly and not indirectly in ubifs_authenticated_write().
This function has a strange semantics, the name suggests that it returns
the status of authenticated write. It's quite unexpected to me that it
triggers a warning when called with only readonly authentication
available.

Regards,
 Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
