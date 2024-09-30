Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF8ECF6497
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 09:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgO0iyih+L1tquwvzpmDt1O1rDTzk3FKd26UijBi7sw=; b=c7t27RGVZwkihphKL5C8bW5o9Z
	khl9wn8bC4GIZxFIBTY2ESUPICbtrf7JuPiujY0lvPrMfZMi1PU0ctyGZZFc2GqaZIU7ql91pyP2L
	bTq2wveLSYmz6CTpR3vmeFOZwJKJaupPgI877Dv+JzpcioxNPrqYRPvC7Hg4OQ577GaLfbXJRkKVO
	MM+3wKU+x9df6sM8ZkiXM7Ay5goPI14vrVkNJIeUM4KslGl0hkYf9GIuHT2fOlTQE6/Dq32cD/OEz
	S/8EaEf8x+WjUWrl1bRAlB34Jz3arPXgFg5TBIzTRrbPNR5AYGYvKS9cmEebctZaLhvWXNO1v1UEJ
	VwEnOzPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svCma-0000000GXnX-3b3C;
	Mon, 30 Sep 2024 09:33:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCfN-0000000GVjq-3RHY
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 09:26:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1svCfC-0007Dn-Ca; Mon, 30 Sep 2024 11:25:54 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1svCf8-002bCP-Sa; Mon, 30 Sep 2024 11:25:50 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 7412834682F;
	Mon, 30 Sep 2024 09:25:50 +0000 (UTC)
Date: Mon, 30 Sep 2024 11:25:50 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Michael Walle <mwalle@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: support vcc-supply regulator
Message-ID: <20240930-amaranth-stallion-of-fantasy-67701d-mkl@pengutronix.de>
References: <20240930-spi-v2-0-ed7f6bcbe0df@nxp.com>
 <20240930-spi-v2-2-ed7f6bcbe0df@nxp.com>
 <20240930-wonderful-wealthy-aardwolf-b455d6-mkl@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240930-wonderful-wealthy-aardwolf-b455d6-mkl@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_022605_868703_519ED010 
X-CRM114-Status: GOOD (  21.37  )
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
Content-Type: multipart/mixed; boundary="===============3567453000870666948=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3567453000870666948==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2tcsiwghsi2hwzwq"
Content-Disposition: inline


--2tcsiwghsi2hwzwq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 30.09.2024 11:21:27, Marc Kleine-Budde wrote:
> On 30.09.2024 17:22:25, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >=20
> > SPI NOR flashes needs power supply to work properly. The power supply
> > maybe software controllable per board design. So add the support
> > for an vcc-supply regulator.
> >=20
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/mtd/spi-nor/core.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 9d6e85bf227b..5249c8b13916 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/mtd/spi-nor.h>
> >  #include <linux/mutex.h>
> >  #include <linux/of_platform.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/sched/task_stack.h>
> >  #include <linux/sizes.h>
> >  #include <linux/slab.h>
> > @@ -3462,6 +3463,10 @@ int spi_nor_scan(struct spi_nor *nor, const char=
 *name,
> >  	if (!nor->bouncebuf)
> >  		return -ENOMEM;
> > =20
> > +	ret =3D devm_regulator_get_enable(dev, "vcc");
> > +	if (ret)
> > +		return ret;
> > +
>=20
> What happens if the SPI-NOR doesn't have a "vcc" regulator?

=2E..the SPI-NOR will use the dummy regulator.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--2tcsiwghsi2hwzwq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmb6bpsACgkQKDiiPnot
vG8hIwf/QXZytZ4ZzSbdjv9wXw1kBOy5ES/7Ay5dQoy1vBiQR5ta8KzKASWSHygA
SXpI1/i6UM3ZRu33nqVRFKqUBaAplExv/X5b5wnKXGY8ZmdU7eIfZQZPSRKqnqpl
KSADiG+M9FMpO/KKCVpceHGAs210B1Xh9PPza8Yl2mN4V0S3Usya5bKUI1mFR/lD
zL+rSWO7FPBdQ74xGoTOFFxaWQfCdc1i4B1v2sPbDXy5sRq0QYS71BRIWShDJvDt
a/0wyjiD2xg4gurQenOurY9RjeHtfs2nQRn0JkGRrd+VEJk53ZIABXYBHj2Bf8pn
fYkmdYXTwWFlqvKy1gTeQbLsi6YTJw==
=1jx1
-----END PGP SIGNATURE-----

--2tcsiwghsi2hwzwq--


--===============3567453000870666948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3567453000870666948==--

