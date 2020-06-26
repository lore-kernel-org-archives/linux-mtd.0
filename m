Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEEAC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 11:50:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F082078D
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 11:50:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JQ8lL4fh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LM8D/94z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F082078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/3q28yCJ5fwYT5t5hFGLdA43eb72wNG/PBTfYr+qErI=; b=JQ8lL4fhHjm0IOPK7DaDzqJvD
	+OtDJLwDAuKYnmOL0+9430gVNNGkrjn8MKuU0O5CevOA7cbSe3Wr9F19gMPzmm6qrpMo8LGpfmQed
	HraGVV+D8g/vOB3P+dgWKREHavJDG824AZwlqZ8iQ7/BA43CsGXVRFOUqxiojF7UILv6e7/Y7yfpF
	Z0bVHz9oW02IhOtAW9heB72r2v7ZrZOU7E4mghbsj5o+hrBxtpE+drDCZAzFqeysPQvOJ2ePmzAwq
	MCwew0oaWCeaHdUdsQkn3RxiZpN0a8pauhwbRFqeyuK0kZelhal8bjyK2GtTHzcarIUqifGqD491S
	C5b6ykRkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomrx-0005Ic-6x; Fri, 26 Jun 2020 11:50:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolNa-0001IL-PV
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 10:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=lOQSHNwX6j6JPU5R8YQwbqwd99qtsgF61U2+0snNnfE=; b=LM8D/94zhjmF+XT1RRFXB/fBBk
 3BNxg88YH3V3gbb8AVFcu+O6wsHoOQiXzqXqzvga/ZFQqqN3RyRKXHOvGTvLvzk/RtKnkpec+vLPi
 nI3XfRk1hXEILzvuxn8APabtrWXIe4af4WHGMnmJGXjnO+yg3INsKMBd4owgPXi5sX4rHvv/uc816
 QLypwtOreNlmlAZk9akNEfCVa3iT7b6IYs1IOZTQx0501mleHQlMYmKbiCKg9WED1iCeG0xfad7ul
 vyHvQCUboqJb2Vwjvip9RkWQDBh0wteCq0Sz28BBARX13YnDF1f2ny3THkbP3k+JHZvrioNqM0vze
 MYhiMrdw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joilg-0004PE-NL
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 07:27:27 +0000
Received: from torbenh by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <torbenh@linutronix.de>)
 id 1joilW-0005iP-Ou; Fri, 26 Jun 2020 09:27:14 +0200
Date: Fri, 26 Jun 2020 09:27:14 +0200
From: Torben Hohn <torben.hohn@linutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/1] ubifs: support authentication, for ro mount, when no
 key is given
Message-ID: <20200626072714.GH15356@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200625155927.28430-2-torben.hohn@linutronix.de>
 <20200626043120.GA19105@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626043120.GA19105@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_082724_962943_E170A9F4 
X-CRM114-Status: GOOD (  29.10  )
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

On Fri, Jun 26, 2020 at 06:31:20AM +0200, Sascha Hauer wrote:
> Hi Torben,
> =

> On Thu, Jun 25, 2020 at 05:59:27PM +0200, Torben Hohn wrote:
> > diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> > index 7fc2f3f07c16..ec95f1f50e5e 100644
> > --- a/fs/ubifs/super.c
> > +++ b/fs/ubifs/super.c
> > @@ -1291,6 +1291,17 @@ static int mount_ubifs(struct ubifs_info *c)
> >  			err =3D -EINVAL;
> >  			goto out_free;
> >  		}
> > +	} else if (c->auth_hash_name) {
> > +		if (IS_ENABLED(CONFIG_UBIFS_FS_AUTHENTICATION)) {
> > +			err =3D ubifs_init_authentication_read_only(c);
> > +			if (err)
> > +				goto out_free;
> > +		} else {
> > +			ubifs_err(c, "auth_hash_name, but UBIFS is built without"
> > +				  " authentication support");
> > +			err =3D -EINVAL;
> > +			goto out_free;
> > +		}
> >  	}
> =

> In case we don't have a key available for HMAC and can only verify the
> FS is correctly signed then we have to be sure that we are mounting
> readonly. This means the above needs an additional check for
> c->ro_mount.

Indeed, i had that check in authenticate_sb_node() in an earlier
version, and forgot to add it here.

Will do.

> =

> Once we can be sure that UBIFS is in readonly mode when we can't do HMAC
> then there's no point in adding a ubifs_authenticated_write(), because
> the places where you call it will never be hit in a readonly mounted
> filesystem.

The point is making sure, that it really is never hit in a readonly
filesystem. Now, and in the future. If we miss one point, we might
trigger the hmac code with an empty hmac. Although it might just crash.


Maybe we could generate a random key, to lessen the impact of such
an error. But i doubt that i have enough entropy to make that more than
a fig leaf.


Another topic:

Richard raised the point on irc, that in a dirty filesystem, the journal
would be replayed even in ro mode.

i dont see that happening.

--------------------------------------------------------------------------
static int mount_ubifs(struct ubifs_info *c)
{
	[...]

	if (!c->ro_mount) {

	   [...]

	} else if (c->need_recovery) {
		err =3D ubifs_recover_size(c, false);
		if (err)
			goto out_orphans;
	} else {
		/*
		 * Even if we mount read-only, we have to set space in GC LEB
		 * to proper value because this affects UBIFS free space
		 * reporting. We do not want to have a situation when
		 * re-mounting from R/O to R/W changes amount of free space.
		 */
		err =3D take_gc_lnum(c);
		if (err)
			goto out_orphans;
	}

	[...]

}
--------------------------------------------------------------------------

ubifs_recover_size() with in_place =3D false, does not seem to write.



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
