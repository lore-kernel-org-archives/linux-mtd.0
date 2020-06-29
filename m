Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09F5C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 08:54:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6686220720
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 08:54:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tY1UpA9q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k1VKmqLC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WmGWfIRG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6686220720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mYDOZBj0nLGV4m0Y9Tik9DAG16PLoJ7qdEQm/bbKihI=; b=tY1UpA9qgAgWtvmmn169d4OkR
	adz1/UVXlAjths+JSC/UI+J4EvZCdrptilFb9ukQfs4ZDlhXyYGPMqGX3hEnPxpkgDobJvVAIC/qR
	8RW0ohQVqwtYgC6OXqXqP/mxDXKuY//EqfIyQwpVWZ1cBE4G86dwckbRHF/BFZ3YSFN4yG1FONPve
	juiIvIrHRbhQ6VcrwcpK+KTdd8yhes7MSAf8+FGZj0W91iMcxnCnVS2cvwFrUyWxBS7CjqF+GUJdu
	bjigrViGRmekGlntqlJNxeiULAFIWT8k5lzgIEu2xBTKYPLYaNmEWng+LvYXd5iBju/mhZjnR5Akl
	9nYxv/PAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jppXK-0002XZ-G0; Mon, 29 Jun 2020 08:53:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jppXH-0002XB-Rk
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 08:53:08 +0000
Date: Mon, 29 Jun 2020 10:53:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1593420782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KFL/p5xaSqVRQfsV15M0zFV9Vcn1MKUNOmtYBuAljE=;
 b=k1VKmqLCVMV5xx7oo5LuxjOcTykJmv/NSO1+It0W1OyjVL5PDrKGXprAaIjSmWdsYGNLnw
 87EaSbEeDpP5PIHMh+iR/h1y2Po5hgLiQZwkkGYe0pn+0pmJrVlNw//PEeCMxPGO8Q3AdD
 0gdisxR2VrcA+lEOCKdh9Dw7NCu3EIagkrtZqi03wFNc/Lfu5Y8d5ftKxnN6wlbAejMrby
 XktkfTfR66+Ji0Wi8Hd/6N3MxzmAkIVIItj3V7GJTS42SrpqweKmu/z8DmI0ggQtZPxmIE
 vopEWHzRyWyG+w4sO0HBZqkIlJcqh0Euo2KejOjKs+gkZs41oamT+17toQqNig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1593420782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KFL/p5xaSqVRQfsV15M0zFV9Vcn1MKUNOmtYBuAljE=;
 b=WmGWfIRGXqpWpAly661wYujLxfeIf9dMfjuEPkmOncGWU/ejJYLQBWgupieffCfR4Rpki3
 7k68gvw1kDg3tCDw==
From: Torben Hohn <torben.hohn@linutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 4/4] ubifs: prevent remounting rw when no hmac key was
 given
Message-ID: <20200629085300.GA17241@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
 <20200626112907.13201-5-torben.hohn@linutronix.de>
 <1273452738.62169.1593174441367.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1273452738.62169.1593174441367.JavaMail.zimbra@nod.at>
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
Cc: bigeasy <bigeasy@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 tglx <tglx@linutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 26, 2020 at 02:27:21PM +0200, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "Torben Hohn" <torben.hohn@linutronix.de>
> > An: "richard" <richard@nod.at>
> > CC: "bigeasy" <bigeasy@linutronix.de>, "tglx" <tglx@linutronix.de>, "li=
nux-mtd" <linux-mtd@lists.infradead.org>, "Sascha
> > Hauer" <s.hauer@pengutronix.de>
> > Gesendet: Freitag, 26. Juni 2020 13:29:07
> > Betreff: [PATCH v2 4/4] ubifs: prevent remounting rw when no hmac key w=
as given
> =

> > After adding readonly hmac-less authentication support,
> > prevent remounting the filesystem in rw mode, when
> > the hmac is not available.
> > =

> > Signed-off-by: Torben Hohn <torben.hohn@linutronix.de>
> > ---
> > fs/ubifs/super.c | 4 ++++
> > 1 file changed, 4 insertions(+)
> > =

> > diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> > index b41ca9ee5763..62bdef8f1ddf 100644
> > --- a/fs/ubifs/super.c
> > +++ b/fs/ubifs/super.c
> > @@ -1996,6 +1996,10 @@ static int ubifs_remount_fs(struct super_block *=
sb, int
> > *flags, char *data)
> > 			ubifs_msg(c, "cannot re-mount R/W - UBI volume is R/O");
> > 			return -EROFS;
> > 		}
> > +		if (ubifs_authenticated(c) && !c->hash_tfm) {
> > +			ubifs_msg(c, "cannot re-mount R/W due to missing hmac key, for
> > authentication");
> > +			return -EROFS;
> > +		}
> =

> But the case that one remounts rw and provides a HAMC is handled?

No. And i am not sure, whether thats a thing, we want to support.
I would suggest, we clarify that in the message.


One would need to check, whether c->auth_key_name is set now,
and then instantiate c->hash_tfm.

ubifs_init_authentication is not called upon remount.
so a remount with a changed auth_key_name is not supported either.




> =

> Thanks,
> //richard

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
