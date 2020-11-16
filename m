Return-Path: <SRS0=PjdO=EW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E033C4742C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2020 09:40:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06CAD2225B
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2020 09:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQpriu4m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06CAD2225B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VsIuUBg6GirFF2hv/vzg9NDF6ByBjgf2unXt2WGOeIE=; b=TQpriu4mO2NMVaMwLvxW7rG92
	2ws2KuXLECfJKrm4tvMTL2inRG3ViF7tIYgisbMjuZyF8IyhwIfikNSOrmpt+ho+6jxF45wGVetgC
	ltHU86jiSqGuqj++nFhLdQqGfk2fQQwqKoiUqGLjIaxvXHJwS1a3T+c8t/X3YhcC5Im4Zb+NIte/1
	xkbpGEKAYs1fSSf3zCRrRPnCnlRk3LueJ1cY4wMBwnxU0810/c4FGLN4riPHalMwIOKBAsVGH4QAU
	/c++9BFjxc9p8dCrO0I9rY17yV9HI3D7TROynvvWOi26kz9l+i2RrTinNH6u4h4vi3/9tk95saF3t
	Znyrz5pjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keazI-0004A6-V9; Mon, 16 Nov 2020 09:39:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keazC-00049P-Jo
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2020 09:39:47 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1keaz3-0005wF-SB; Mon, 16 Nov 2020 10:39:37 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1keaz2-00033H-Uk; Mon, 16 Nov 2020 10:39:36 +0100
Date: Mon, 16 Nov 2020 10:39:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH mtd-utils RFC] Add an ubifs mount helper
Message-ID: <20201116093935.zhf4bgiwggwrnnl2@pengutronix.de>
References: <20201006091912.1139071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20201006091912.1139071-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_043946_711662_58E4E781 
X-CRM114-Status: GOOD (  22.19  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 entwicklung@pengutronix.de
Content-Type: multipart/mixed; boundary="===============2662819371374149838=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2662819371374149838==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k3oo7qacpqqgfvum"
Content-Disposition: inline


--k3oo7qacpqqgfvum
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Oct 06, 2020 at 11:19:13AM +0200, Uwe Kleine-K=F6nig wrote:
> This abstracts away attaching of the right ubi and then selecting the rig=
ht
> ubi device and volume to mount.
>=20
> As described in the comment at the top this allows to mount ubifs volumes
> directly from /etc/fstab without having to use hardcoded numbers (which
> depend on mount order and so are unreliable) and extra magic to care for
> attaching.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> this is a nice script that helps attaching ubis and mounting ubifs'. I
> already discussed this a bit with Richard on irc and the idea was
> welcome in principle.
>=20
> A concern was that the entry in /etc/fstab is too magic and there should
> be an indication that this relies on the mount helper. Something like
> using ubifs.autoattach as file system type (fs_vfstype) or requiring
> "autoattach" in the fourth field (fs_mntops).
>=20
> Having thought a bit I'm not convinced we need this indication. Yes
> there is magic but nothing out of the ordinary as mount helpers are a
> known concept and the fs_spec already looks interesting enough to make
> it obvious there is something going on. And once people are used to the
> magic it is annoying to have to always write this indication in your
> fstab. Additionally it complicates the implementation.=20
>=20
> Also "autoattach" doesn't completely cover the script as it does a
> translation from mtd name to mtd number, too. "autoattach,mtdtranslate"
> seems a bit excessive.

I didn't hear any feedback here. Is reviewing this patch still on
somebody's todo list?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--k3oo7qacpqqgfvum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl+ySNMACgkQwfwUeK3K
7Akatgf+MS8LOm2MoIIZ5F4JryrBFdpqQ/OmahnceoRv6z9+JLIh60Xy7mq0hrim
4oaoHj0bXOrD+71dj6sTJiwhqBRvUEXF/KQY7mXPUOgFY5HXkqjiplyC6A5W5SS7
fbWWG1KGSyIulGf5NgcB8GMP+Mmrx9VX1oktCfRM+oNPnnqHtdXgm+C+JDKECTM1
3Bve2ZtE8uG1asbapqihiQ+nAR6lPRkviwSd17k491t3UpaPyg5ceY4bQTPZ3hUD
dLuiY91Qiy1Jp/Vk0zYOIcYuWbMnu/9l7fGgHG//TaMf1wV0QKUD16D0i+B3FAAB
B2zw2jtNUuY7uchT5NLTNrMdbvW6RQ==
=Ds5T
-----END PGP SIGNATURE-----

--k3oo7qacpqqgfvum--


--===============2662819371374149838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2662819371374149838==--

