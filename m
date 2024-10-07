Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA05CFB447
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2024 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/PRzK3jBe+Xhzi+3EfHcAoLHQnqHbgbXrqCT8w/2xc=; b=EZupnYWyBDeb23KLtJ3lfCsdgd
	NUlz+ahTpM/eFlilcTvNqGckxZYUEIPzq1LlQiI335U/KskFzHCADC+pE1SS3mgpJXA8lPybfbnfm
	ddltBNv58odSsb4bpt/6j0Woow267/fSmtqFDLDOZ6ivFOCPf+RttvDClCZ8RoQBnbHKu2kBdZz5U
	D587uIuyDLbaJepwK7pmIsasPjile1J9xntp/SaaEBKziPlcVwPzLt6DuOUQ7t4zUh0+8QHgrGIl1
	A/LYtO1KXG3TyVAVHrWDD68Lk1ra5V9kDIzu/RkDukiMaYN8thEaFZEJ1AoxgIMtxd0WHK1TtHf4a
	QyCtuhfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxize-00000001jyx-3fjU;
	Mon, 07 Oct 2024 08:21:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxiVx-00000001eqv-1Fsx;
	Mon, 07 Oct 2024 07:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0A5C5C54C1;
	Mon,  7 Oct 2024 07:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557DBC4CEC6;
	Mon,  7 Oct 2024 07:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728287443;
	bh=LZwLhPcihpVwhqUd44bHekSn+fvPmdtdSBIxwelAqgU=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=GK8EWprjujC9Tfvzj6WVPbnrV2bF6TKHAk2EAEqU41FrNmpVkNiQZ4sJBWYAqDWEF
	 0KB9XVHtxTc7/rv21PlOB0YBw46iOu9cX+WnSX79m0cVdJgDQ84i4HRjL0c6vmxOuX
	 DQr5O05dm1qtHgasFGHJk5B/52rCgL68ohQme0HRkOBqeYUwn7zHI6BReTf+NX3FI+
	 vbcHvcuquWjy1orykoi97YVXsCVD3t/5RvJ65AYRqu8YmjgwryBldzdRVQg4aT1fP7
	 n0VxLzbNachbfkfInMr9jW5/2OIYYy3d+CZRgu0U/hVziwX9tbzzCHckyPYWvm1K7w
	 1/CDpp+F5UmLA==
Date: Mon, 07 Oct 2024 09:50:39 +0200
Message-Id: <D4PERKZ4GL6B.1WKA1I3MYSQVL@kernel.org>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: support vcc-supply regulator
Cc: "Rob Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Fabio Estevam" <festevam@gmail.com>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 "Richard Weinberger" <richard@nod.at>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Marco Felsch" <m.felsch@pengutronix.de>,
 <linux-kernel@vger.kernel.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>, "Peng Fan" <peng.fan@nxp.com>, "Pratyush
 Yadav" <pratyush@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Marc Kleine-Budde" <mkl@pengutronix.de>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>
X-Mailer: aerc 0.16.0
References: <20240930-spi-v2-0-ed7f6bcbe0df@nxp.com>
 <20240930-spi-v2-2-ed7f6bcbe0df@nxp.com>
 <20240930-wonderful-wealthy-aardwolf-b455d6-mkl@pengutronix.de>
 <20240930-amaranth-stallion-of-fantasy-67701d-mkl@pengutronix.de>
In-Reply-To: <20240930-amaranth-stallion-of-fantasy-67701d-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_005045_400323_6A4DE276 
X-CRM114-Status: GOOD (  12.14  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8669139433755712603=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8669139433755712603==
Content-Type: multipart/signed;
 boundary=4f89559e3e3addf49573992635c3f51e2eb8df6bf427dc56eda58fc4e794;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--4f89559e3e3addf49573992635c3f51e2eb8df6bf427dc56eda58fc4e794
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > > +	ret =3D devm_regulator_get_enable(dev, "vcc");
> > > +	if (ret)
> > > +		return ret;
> > > +
> >=20
> > What happens if the SPI-NOR doesn't have a "vcc" regulator?
>
> ...the SPI-NOR will use the dummy regulator.

Which then prints a warning "using dummy regulator". Is that the
usual way to go?
I mean the regulator is actually mandatory because it is the main
voltage rail for the flash. To get rid of the warning one can add a
fixed-regulator (which is correct anyway). But OTOH, the device tree
lists it as optional (marking it as required isn't an option either
because virtually all device trees won't have that property).

-michael

--4f89559e3e3addf49573992635c3f51e2eb8df6bf427dc56eda58fc4e794
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZwOS0BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/itIQGAlVlJTTCQIXmqzui5WhdsuBn8I74X+Pl7
YIOZ5srEjl+s75tdMuZ79ixoF50nGGX2AXwJv/geIp9+ua4N3snMvPChaw43SAbu
nfe1itE/wQHdobQbIS5fXEZsl0asg29UJfg=
=bBef
-----END PGP SIGNATURE-----

--4f89559e3e3addf49573992635c3f51e2eb8df6bf427dc56eda58fc4e794--


--===============8669139433755712603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8669139433755712603==--

