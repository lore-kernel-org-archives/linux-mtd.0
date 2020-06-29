Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA97C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 09:08:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05395233A0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 09:08:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nr0qhSqY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aN7vp2PV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0XFFNGAq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05395233A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v54SaX+6CZEyWMnUJqbGhjrr9+RQOUhpmvWGhrWI9cg=; b=nr0qhSqYefCoA8H2ycMt1jUYx
	pcWGnz7HybAGKJm+ZWlHBP2xeB22+VSxDpyZjsF2BkfwXaw9Wp7hoB9pcItkXv4CkOXSLTzysI1Gr
	KVO3g70wE1VVHD+iI1k0rpcWFoylTfwdj3jA2FmFJNZisC/KWTaLIR20g7HVjyPjJU6FJ9DaXTLw2
	ytJEmtyL1Y12h4U6rkssamd0srFmiYY2sS91NicFb1/4R8yV9uaD85ECWVol1jVRiFqydRlCV1G2O
	BNksOV1Y80/vBBUb0NWmcrLc5ST4cGaX2OtXLpnigq6090JLzKehQ6G27O+oALlnAxrgFPsOoYnwS
	oP6dgn4oQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpplL-0004CO-25; Mon, 29 Jun 2020 09:07:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpplJ-0004Bs-77
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 09:07:38 +0000
Date: Mon, 29 Jun 2020 11:07:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1593421655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4JdMt2M0Q4asIO0EMUsSOkK6al0GXFuzgm3DQXNrW4g=;
 b=aN7vp2PVbVDi8vak8S56qn+UL+5BH4xQMIy9GEaYdUAVnCiYxJv5iQTa7uIzpw/zzgiv/I
 tfpyfBNTqBx+OOzRjhlzW1XTmNMWSo49n7VLFESk7Iq/0G5di1jQ8MXK06W81Fiy05q+cT
 KZzUKcyHAbtUnfF4W6mrjoDJi/MRid/JAHwgfM7m0Hp8LisA12a9TZ4hKOezP+zjKm0qTX
 wlVdvTmgnPRL2CJ01JzaRSHaUU4yxxQuNmY5QY1ykhV1YWOaeOzXTWghyfH5PPXaHzmovY
 N9Y9yd1L8Mnd9r7ZdHAdpTSazhUzY1DeZx9eBxsU3mUAc4z4xJwCBzu3ka25/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1593421655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4JdMt2M0Q4asIO0EMUsSOkK6al0GXFuzgm3DQXNrW4g=;
 b=0XFFNGAqdZU6rze8aUktWmhH9YQsvrT2tWcXAGP9eKf82RNGZoYyOEovMYWWJamxpZ0+Ny
 r3CPtfBTMFofTjAQ==
From: Torben Hohn <torben.hohn@linutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 0/4] ubifs: support authentication without hmac
Message-ID: <20200629090734.GB17241@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
 <1644538308.62483.1593181011127.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1644538308.62483.1593181011127.JavaMail.zimbra@nod.at>
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
 tglx <tglx@linutronix.de>, david <david@sigma-star.at>,
 Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 26, 2020 at 04:16:51PM +0200, Richard Weinberger wrote:
> Torben,
> =

> ----- Urspr=FCngliche Mail -----
> > Von: "Torben Hohn" <torben.hohn@linutronix.de>
> > An: "richard" <richard@nod.at>
> > CC: "bigeasy" <bigeasy@linutronix.de>, "tglx" <tglx@linutronix.de>, "li=
nux-mtd" <linux-mtd@lists.infradead.org>, "Sascha
> > Hauer" <s.hauer@pengutronix.de>
> > Gesendet: Freitag, 26. Juni 2020 13:29:03
> > Betreff: [PATCH v2 0/4] ubifs: support authentication without hmac
> =

> > This PQ adds support for ubifs authentication without HMAC,
> > which obviously only works for a read-only mount.
> > =

> > ubiblock and dm-verity are not supported by u-boot, and
> > the kernel on the target is loaded by u-boot out of the RFS.
> > =

> > This is a first try to implement this.
> > It boots fine, and the WARN_ON is not triggered.
> > =

> > I plan to update the docs also, but i would like to have
> > some positive comments on this before.
> > =

> > Changes since v1:
> > =

> > - apply comments from Sascha an revert the
> >  ubifs_authicated_(read|write) stuff.
> >  Use ubifs_assert(c, !c->ro_mount) instead.
> > - Prevent remount rw, when hmac-less authentication is used
> > - add missing check, for ro mode, when no auth_key_name is specified.
> =

> I didn't dig deep into the code so far, I'm still checking the concept.
> =

> Your approach works only on pristine offline signed images from mkfs.ubif=
s.
> So, if somebody does this, it won't work:
> =

> $ keyctl padd logon ubifs:authfs @s < secret.key =

> $ mount -t ubifs /dev/ubi0_0 /mnt/ -o auth_hash_name=3Dsha256,auth_key=3D=
ubifs:authfs
> =

> ... change the fs ...
> =

> $ umount /mnt
> $ mount -t ubifs /dev/ubi0_0 /mnt/ -o auth_hash_name=3Dsha256,ro
> =

> The ro mount will fail because UBIFS is no longer able to verify the supe=
r block
> using the system key ring. It was overwritten by they ubifs:authfs key.

Yes. But that is the intended behaviour.
If the filesystem has been changed, it must not be mounted again.

I would rather like to make it impossible to mount the filesystem in rw
mode, because this is an attack scenario. It would refuse to mount upon
reboot. Making it possible to remount root rw, with a fresh key is
nice for development, but its not desired in production. =



> =

> A possible solution is keeping a copy of the offline sign key forever in =
the fs.
> But I'm not sure whether this is wise.

Heh ? you mean the private key. NO

When its not possible to store a secret on the h/w then the only
option we have is asymmetric sigatures, with the private key never
being on the device.

This obviously means, that the device is not able to write to RFS.




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
