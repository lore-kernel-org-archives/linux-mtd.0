Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689C2C61DA3
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Mar 2023 22:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59HAJJt/Bv0O55pMsUcgKS6Nk/6lRrTjwD4tM7fk0vA=; b=ou7q/vtUY/ECGRynStdeINSEu7
	AQk5tOT+GPXNQl06H/RqZ2IPIOeqpgAr+kf2qxWbJbSeGshIEOY0UOxHxs+290kcntCOUyVIMP+4d
	XlGMfoMaVWCOStcumWqgqCegkEB1tyNdIxgIIqbPPc/mOjOWYfeJBjWhnyn7WC2/TBQlc3Hb8PYp8
	mlXdqfEshhzBEaju/zIotSi/+VCQryi/m1f1ei1sLKlCQ0dsk27sRbMI3tR31C5ehixXv2Jx3ujVz
	7jdvrY06Z8//A+4BGc/sifQiiCO5/ffixGbksgmlg6sZy1sTQedAJ4+dEoR1ZRUm4AXjqTgZ4jcnK
	0Qt/Ogdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYDab-007hjQ-1K; Fri, 03 Mar 2023 22:09:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYDaW-007hiu-Mb
	for linux-mtd@lists.infradead.org; Fri, 03 Mar 2023 22:09:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYDaM-0007X5-7q; Fri, 03 Mar 2023 23:09:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYDaF-001eHQ-77; Fri, 03 Mar 2023 23:08:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYDaE-001xZG-GT; Fri, 03 Mar 2023 23:08:58 +0100
Date: Fri, 3 Mar 2023 23:08:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ajay Gupta <ajayg@nvidia.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-mtd@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>,
	Crt Mori <cmo@melexis.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jean Delvare <jdelvare@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Peter Rosin <peda@axentia.se>, Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/9] i2c: Switch .probe() to not take an id parameter
Message-ID: <20230303220856.ebloz7kjw7sskxym@pengutronix.de>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_140916_776061_2CAA4AB2 
X-CRM114-Status: GOOD (  20.89  )
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
Content-Type: multipart/mixed; boundary="===============5232949487948468327=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5232949487948468327==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jphhkeygsgtmhvzu"
Content-Disposition: inline


--jphhkeygsgtmhvzu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Feb 26, 2023 at 11:26:45PM +0100, Uwe Kleine-K=F6nig wrote:
> this is v2 of the series. I send it a bit earlier than I planned to do th=
at
> initially because I failed to send v1 completely to the linux-i2c list.
>=20
> Changes since (implicit) v1:
>  - Added Acks for patches #5, #6 and #8
>  - Fixed kernel doc as pointed out by Luca Ceresoli (patch #7)
>  - Send all patches to linux-i2c mailing list
>  - Rebased to current Linus' tree.
>    This reduces the list of prerequisite patches to two.
>=20
> I updated
>=20
> 	https://git.pengutronix.de/git/ukl/linux i2c-probe-new
>=20
> accordingly.

Linus tree now contains all patches that are a prerequisite for this
series. I rebased the above branch again on top of linus/master and now
it contains only the change sets included in this series.

Also no unexpected new usages of .probe() appeared in Linus's tree (nor
in next). Also there are no changes to any of the files touched by this
series in next.

So this series is ready to be applied once Linus cuts -rc1.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jphhkeygsgtmhvzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQCb/UACgkQwfwUeK3K
7AkuXgf/SMwWwnMqZjGgBPUDM9VgxnIlfQtagDo9nbprjQzoh3Ib5rPoV0hS3hvB
47qsOgOL5iA240b8zcxn8IatQDJaPiDl7F06lLmWFEvMrhA233m84hU/U/O/0xbY
0WuHom/ABjZwJ2JEl+qFUiE1Cm5r89LhYCw4UEXTG6Wn1dtuUb5Roq+uVAVjQxSS
0aAP77IklhKDSPlpdnGXgiY1NrMiWmJWpFEyTLhNeqI7l9djO5tHLbezUcb2E4nU
Xsz0eWpOmh85Eq8BhIFPY8CigES8ePIragUO4rxneI1ewhYWpvjEklysWIC0SO98
Z9CJvnehDyeveIhwgTJsgtK21N7mxA==
=QY8V
-----END PGP SIGNATURE-----

--jphhkeygsgtmhvzu--


--===============5232949487948468327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5232949487948468327==--

