Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD590C46CD2
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 21:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+EyOoxgpsQGYqZLvKf+Qy0r10hEtuj3F4YlZJAbjJg=; b=JCsXqfUpGx5c7cFY9CSRlGolsV
	7HSCTweBjwns2cAtxSSHYDaG9504P9ElBRkPVfXLrflLwXjQG5PUbDcdMAE3aWDjvGdr956lGVJZd
	uJYvUng5216tr7SkGr5Tsg0uW+mXmO+TdzoIvleVrEzvakTz77WXgfRfAgYZVoXKX8obRtdbhqgNf
	ax04C3oKwsIbevSVo6S0EuJjthoDN+jxJtXTbWRTqhMKunU9Qu456b46sypqy1aXo2r9Qz5SXbqS6
	DUH6BgqMfRF0Q+TTG82feMI1dDqjjCovs9lSch9u/qCdHkVziXJuNhZKLRr61bnQiGBzc5+DIYsfS
	nGAZWlDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS1rA-00EAzw-1m;
	Mon, 22 Jan 2024 21:29:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS1r6-00EAzY-2a
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 21:29:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rS1qv-0000Ho-PR; Mon, 22 Jan 2024 22:29:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rS1qt-001ga9-T1; Mon, 22 Jan 2024 22:29:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rS1qt-005hn7-2b;
	Mon, 22 Jan 2024 22:29:07 +0100
Date: Mon, 22 Jan 2024 22:29:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org, kernel@pengutronix.de, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 13/33] mtd: rawnand: fsl_elbc: Let .probe retry if
 local bus is missing
Message-ID: <33kxj5ij25bzkyhuww5kane2sb2f3euyq3uoudlgegfks3xs4f@ru24kc6z55je>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
 <41a042207ef791c4c5bcb46f09f63c40c6aa321b.1705944943.git.u.kleine-koenig@pengutronix.de>
 <20240122191931.17807644@xps-13>
MIME-Version: 1.0
In-Reply-To: <20240122191931.17807644@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_132920_845661_DC4671CB 
X-CRM114-Status: GOOD (  21.05  )
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
Content-Type: multipart/mixed; boundary="===============7818657485976071184=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7818657485976071184==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wpw5yp3sgfojkufj"
Content-Disposition: inline


--wpw5yp3sgfojkufj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Miqu=E8l,

On Mon, Jan 22, 2024 at 07:19:44PM +0100, Miquel Raynal wrote:
> u.kleine-koenig@pengutronix.de wrote on Mon, 22 Jan 2024 19:07:08 +0100:
>=20
> > If during probe fsl_lbc_ctrl_dev is NULL that might just be because the
> > fsl_lbc driver didn't bind yet. So return -EPROBE_DEFER in this case to
> > make the driver core retry probing later.
>=20
> Despite the probable usefulness of this change, I don't see any
> relationship with the current series. So unless there is a good reason
> I might take this one through the nand tree.

This patch indeed doesn't belong into this series. It just happend to be
in my tree and shuffled into the middle when I sorted the patches by
subsystem. Note I already sent it separately at

	https://lore.kernel.org/linux-mtd/20240115141245.3415035-2-u.kleine-koenig=
@pengutronix.de

> Also, what about a Fixes/Cc: stable tag here?

The problem exists since

	3ab8f2a2e701 ("P4080/eLBC: Make Freescale elbc interrupt common to elbc de=
vices")

which was included in v2.6.37-rc1. At that time there was no
EPROBE_DEFER yet. I think I wouldn't add a Fixes: line for that, but
feel free to add one if you think there should be one.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wpw5yp3sgfojkufj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWu3iIACgkQj4D7WH0S
/k46Fgf+LprTnc7f6tqg7kcdC7LeG2KTK7vIZ1pjmaQZRz1lnlpCnTrHGPFgCHuz
CA50m2x1CNkDqx46qG60SaYDCk0/+/7HzBEhlfOt8DP+8U+qmF/aTkigmWrX6o1r
uF8FpRxF+Wf5sr32sPV98njmq9Z3rZBHJ3f9vN44TN92xlRvwSSWT/TwqL6clpuw
wV+dOL8KOmE+6jFkp5qsG9x5IRs6fvssMcLchkxuf2nHSAF5rh7NgY7TRFo7QZn6
b96c8ttoIn08z8Yl7StEnB5qhFCF2SB3YR2QRMnpGLR0p1H/f6VYncn10/pEFbu2
Nke5eCouKGSKTpSfwWDJ3LjplrnZNA==
=QV09
-----END PGP SIGNATURE-----

--wpw5yp3sgfojkufj--


--===============7818657485976071184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7818657485976071184==--

