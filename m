Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21348C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Dec 2022 17:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7rZg1g0jAYUViDKbI+pIZLljSQqOdCDS8MMsSwTl5g=; b=Y1PCriepVKBi34M3Vl+xPwDNZS
	FaCxWTLkLn9mT7M5F2BC41ctF4MygK5WerVZoWOP6qh1FxT0jGVxzAfXhUTfUvekC70aZjmCNgAbM
	xgFf8PVpeUXlGeqsSlVCyZtJJzPGyY/ljagkKU8gIbmBUmSSiObjCkX0h5RFjG2XtTC7VE8j67fh0
	noeIvpef6KpHU7vwp10vUehWUc8iXbvaPEBRdgsGjJ2fYDQD5PfgO1/SbneZWrVVZsCvpOHWsU+RP
	9r4fAa1n3X32+ESt4frBYKbRgRnMTOY+W2q7xxTp4e3ZFt9tW+NF0+ExiZnh8opcfyMD9dvbbHOWn
	hc9Mgwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rki-00AUTG-UB; Thu, 15 Dec 2022 17:10:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rkg-00AURF-8X
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2022 17:10:36 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p5rkL-0008Tv-VP; Thu, 15 Dec 2022 18:10:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p5rkH-004k6l-RP; Thu, 15 Dec 2022 18:10:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p5rkH-005Kxd-Ua; Thu, 15 Dec 2022 18:10:09 +0100
Date: Thu, 15 Dec 2022 18:10:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Claudius Heine <ch@denx.de>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH] mtd: dataflash: remove duplicate SPI ID table
Message-ID: <20221215171009.see4b3cvxdqhb5bu@pengutronix.de>
References: <20221215164736.1315815-1-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221215164736.1315815-1-arnd@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_091034_322550_42CC85FA 
X-CRM114-Status: GOOD (  14.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6151145650247953108=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6151145650247953108==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ys7z75btzoijufmr"
Content-Disposition: inline


--ys7z75btzoijufmr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2022 at 05:47:30PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Building with -Werror=3Doverride-init revealds that two patches added

s/revealds/reveals/

> the same device ID table to this driver:
>=20
> drivers/mtd/devices/mtd_dataflash.c:946:27: error: initialized field over=
written [-Werror=3Doverride-init]
>   946 |         .id_table       =3D dataflash_spi_ids,
>       |                           ^~~~~~~~~~~~~~~~~
> drivers/mtd/devices/mtd_dataflash.c:946:27: note: (near initialization fo=
r 'dataflash_driver.id_table')
>=20
> Remove one of the copies.
>=20
> Fixes: 27a030e87292 ("mtd: dataflash: Add device-tree SPI IDs")
> Fixes: ac4f83482afb ("mtd: dataflash: Add SPI ID table")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I seem to recall this was addressed already before. I found
https://lore.kernel.org/r/20221004211412.182940-1-colin.i.king@gmail.com
but it seems Colin (added to Cc:) never followed up on the build
problems reported by the build bots.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ys7z75btzoijufmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmObVO4ACgkQwfwUeK3K
7Anc7Af+NPk1sfcbBoOameluenmscqWrwQwbBn10e54+THdTz/bEWzTOF1vE3Bb8
tlYZdB1oqcSQ2znrh7zoBBgJtj4M905SkeBr9G91NADozsHTmeZxYykhjWxhiYnW
ppNNQRWmqKeJ9LgodvcLe13jLLgj7ls2kzpzUQlc7of76NzhJRxBqMhCfh1XgtnC
kUWdEijo6HjDJrqb5mRlNuJSPxaBlSlTQvqs0Od7OrdCPGkPgfOjfwZqJsQfYEg1
+SvTHBxmYa4O8Xpi/2ggbcf/T7ZIYqUqPLVh8O9bShwX/6aQNdj1WhpLdlW3Xr6D
Ln9PSAQZj+ffrYMhuVqSixp7IOPx7w==
=MApv
-----END PGP SIGNATURE-----

--ys7z75btzoijufmr--


--===============6151145650247953108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6151145650247953108==--

