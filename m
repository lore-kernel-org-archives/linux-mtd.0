Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB96C43334
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWCn7XFoPUUQZe65Uh9esR0qmUYJrIO5o26fNdh+r9A=; b=C33XqW1LNYjpl2daZuAeMCBO1h
	n/0sbuaR2GyODJARHjnVR/wxw/LDna5EZUzQUhAtiooaGYi1cU7Ep6XKepIBCwRbgguxANY/N9Q5y
	QoMpEDiToudqVquh7CZDusRMrYUnK8p2l8LcwJhO93jtfqY7nYjOCEry71lO87N47yB08gR2ZoYH6
	xd6TroFcfxXNnxPmw6qGSHhRtz5PmvJrknltcqET09kuI/mHJl72gZmCpzHPrACGHcQtGHil1WKf5
	M2OOGoht3h8cf5WMTtmmKhRsjQ5/0JP+BKIdpKqCekDJ/rC9//gRu+m+JJPX8ZFXNB+/n1Voz3trZ
	/DE+bEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIY7-002Uar-Q0; Mon, 06 Jun 2022 19:38:03 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIY4-002UZI-SC
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2022 19:38:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyIXY-0000GP-Sn; Mon, 06 Jun 2022 21:37:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyIXY-006r97-Jv; Mon, 06 Jun 2022 21:37:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyIXW-00EcdK-J8; Mon, 06 Jun 2022 21:37:26 +0200
Date: Mon, 6 Jun 2022 21:37:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Richard Weinberger <richard@nod.at>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-mtd@lists.infradead.org, kernel@pengutronix.de,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/14] mtd: rawnand: atmel: Warn about failure to
 unregister mtd device
Message-ID: <20220606193721.w2cjrnhtsvrkvumf@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
 <20220603210758.148493-9-u.kleine-koenig@pengutronix.de>
 <20220606151620.0282cece@xps-13>
MIME-Version: 1.0
In-Reply-To: <20220606151620.0282cece@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_123800_972583_3F174A90 
X-CRM114-Status: GOOD (  19.01  )
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
Content-Type: multipart/mixed; boundary="===============7625753921933757035=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7625753921933757035==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dzjn72tjyjvsaphg"
Content-Disposition: inline


--dzjn72tjyjvsaphg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 03:16:20PM +0200, Miquel Raynal wrote:
> Hi Uwe,
>=20
> u.kleine-koenig@pengutronix.de wrote on Fri,  3 Jun 2022 23:07:52 +0200:
>=20
> > The Linux device core doesn't intend remove callbacks to fail. If an
> > error code is returned the device is removed anyhow. So wail loudly if
> > the atmel specific remove callback fails and return 0 anyhow to suppress
> > the generic (and little helpful) error message by the device core.
> >=20
> > Also check the remove callback to actually exist before calling it. That
> > might happen if nc->caps->ops points to atmel_nand_controller_ops.
>=20
> I believe you got mislead by grepping the code because there is:
>=20
> * struct nand_controller_ops atmel_nand_controller_ops
>   -> this is a NAND-wide controller ops structure
>=20
> * struct atmel_nand_controller_ops atmel_<smtg>_nc_ops
>   -> this is a driver specific structure to provide different
>      registration helpers.
>=20
> The latter always provide a probe and a remove implementation, so I
> believe the addition if the "if (nc->caps->ops->remove)" check is not
> relevant, unless I missed something.

You're right. I assume it's easiest for you if I send a v2 with all 14
patches? If you consider this a waste of bytes, please advise. The
patches are independant, so it would work if you pick up 1-7 + 9-14,
too. Then I'd resend a fixed patch 8 individually.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dzjn72tjyjvsaphg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKeV24ACgkQwfwUeK3K
7Al1uwf+JpZAxh2cevd0cAXaHZx7IynU8NioTc11Z8MY1CL2KFC7A5IfFj/ccqLu
yMbgkbu4Gi6tzL8BXx06UFMrJdVZ9NBDpPsl9IWaGYNGDbvC1hcRv/aD2LceyD//
XNCIi1gVj//iZbtz/n9dBUJA6hMmIM8fF7z3+8jKYF3D96x33QZGjcyu5pTGJLv0
jbNG8EKfsV28b1q8CgUFgqImRmx+vV9SD8sNK7wgvHMzPEG7GQoZGLkr+6pn7Tms
qswQXuZUMT52iZq9zW0pF2ceylK73sVohpgOH5Y0btmrhuV3BheJSbaTCSsKQk32
oFAspmgcfT/7Lc328Jj6up6DzRBpug==
=SsBW
-----END PGP SIGNATURE-----

--dzjn72tjyjvsaphg--


--===============7625753921933757035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7625753921933757035==--

