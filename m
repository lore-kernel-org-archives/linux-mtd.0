Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3E8C433E1
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:45:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B76C620775
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0RkMy5Jg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B76C620775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9Gp8E1ld6TsX27eB4owDD8To5Lg+qvT1RFkBZYVUKmA=; b=0RkMy5JgOnIQRFGY3y/a8HqnG
	d38O1GZmm32NQom3sJbsgLAQlgtZ0saLjFpAnHSZQMSHJhsexHRQTXElF31mPAdTMKO4MRYXFwoNx
	SOi8B7R4PkpGNXm5cWvaUo1U50EDr4G4wUNR5D6zVwplMSduYmbfjVMLoiWqwOy0sC08cy0xBz8YP
	uya429eAbK21ANjGj2UnfyagxMnizFTa7nc+gPQsNj0aQrqXOTkzVXKT5LoNlxGSxE0EI7gz9s9hu
	QTKvfmUq+3vKM/RBbl+vPCH3FlE+JTwdUEHNeUIz49Pyo4e7p4U6H1AeKSvkJEru86rldlPmy3RKQ
	G4S/n+CnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolqh-0003Px-VQ; Fri, 26 Jun 2020 10:44:48 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolqY-0003Lq-8u
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 10:44:43 +0000
Received: from torbenh by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <torbenh@linutronix.de>)
 id 1jokpa-00089Q-FO; Fri, 26 Jun 2020 11:39:34 +0200
Date: Fri, 26 Jun 2020 11:39:31 +0200
From: Torben Hohn <torben.hohn@linutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/1] ubifs: support authentication, for ro mount, when no
 key is given
Message-ID: <20200626093931.GJ15356@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200625155927.28430-2-torben.hohn@linutronix.de>
 <20200626043120.GA19105@pengutronix.de>
 <20200626072714.GH15356@linutronix.de>
 <20200626081028.GE19105@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626081028.GE19105@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 26, 2020 at 10:10:28AM +0200, Sascha Hauer wrote:
> On Fri, Jun 26, 2020 at 09:27:14AM +0200, Torben Hohn wrote:
> > On Fri, Jun 26, 2020 at 06:31:20AM +0200, Sascha Hauer wrote:
> > > Hi Torben,
> > > =

> > > On Thu, Jun 25, 2020 at 05:59:27PM +0200, Torben Hohn wrote:
> > > > diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> > > > index 7fc2f3f07c16..ec95f1f50e5e 100644
> > > > --- a/fs/ubifs/super.c
> > > > +++ b/fs/ubifs/super.c
> > > > @@ -1291,6 +1291,17 @@ static int mount_ubifs(struct ubifs_info *c)
> > > >  			err =3D -EINVAL;
> > > >  			goto out_free;
> > > >  		}
> > > > +	} else if (c->auth_hash_name) {
> > > > +		if (IS_ENABLED(CONFIG_UBIFS_FS_AUTHENTICATION)) {
> > > > +			err =3D ubifs_init_authentication_read_only(c);
> > > > +			if (err)
> > > > +				goto out_free;
> > > > +		} else {
> > > > +			ubifs_err(c, "auth_hash_name, but UBIFS is built without"
> > > > +				  " authentication support");
> > > > +			err =3D -EINVAL;
> > > > +			goto out_free;
> > > > +		}
> > > >  	}
> > > =

> > > In case we don't have a key available for HMAC and can only verify the
> > > FS is correctly signed then we have to be sure that we are mounting
> > > readonly. This means the above needs an additional check for
> > > c->ro_mount.
> > =

> > Indeed, i had that check in authenticate_sb_node() in an earlier
> > version, and forgot to add it here.
> > =

> > Will do.
> > =

> > > =

> > > Once we can be sure that UBIFS is in readonly mode when we can't do H=
MAC
> > > then there's no point in adding a ubifs_authenticated_write(), because
> > > the places where you call it will never be hit in a readonly mounted
> > > filesystem.
> > =

> > The point is making sure, that it really is never hit in a readonly
> > filesystem. Now, and in the future. If we miss one point, we might
> > trigger the hmac code with an empty hmac. Although it might just crash.
> =

> If that's your point then you can add a ubifs_assert(c, c->ro_mount) at
> those places. This has the advantage that it triggers not only in
> authenticated mode, but also in unauthenticated mode. Please add this
> assertion explicitly and not indirectly in ubifs_authenticated_write().
> This function has a strange semantics, the name suggests that it returns
> the status of authenticated write. It's quite unexpected to me that it
> triggers a warning when called with only readonly authentication
> available.

Ok. will do.


> =

> Regards,
>  Sascha
> =

> -- =

> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

-- =

Torben Hohn
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-M=FChlhofen
Phone: +49 7556 25 999 18; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy =

can be found here): https://linutronix.de/kontakt/Datenschutz.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-M=FChlhofen | =

Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 =

806 | Gesch=E4ftsf=FChrer (Managing Directors): Heinz Egger, Thomas Gleixner

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
