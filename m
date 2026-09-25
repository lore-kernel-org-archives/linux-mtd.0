Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2097C9832A
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 16:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HofdMIYOADgs0efLiKZxEhA6tCFR+JjBkuTh6GaaPSE=; b=44jK1C6bQ2mDtmMfA4RMmumGm4
	H4CAdoX/t/Up71eUIAIZnxRHuWCuC+auFBV3fbG3bYIIkX0GiEQd6PZS+M3ZjAUhaDC6Hyn5z/K3/
	3Ubcr3bx8pdJ1hYPrSLEyMNHELu02MWqJ14mX/WH7uBjp0p+yULxMcx77YMNksbnMOgF9SoKp9wMz
	UbwL4Py6MPkVzeVP9AS0VTn9nXiRuBPT7jxGpHUHPpBT/Gcv0LulW3ngH07KDXwmqWAolyLkhM+Cz
	yKZTVrgpKQhg56cHhvuAwZzH7nV0KEs/pQLxxUAvS9UKRT//JN6mUhv9FBLjA907B10ZN3WqTQYzV
	mcVnoXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8wZ-0000000DxUS-3ncq;
	Fri, 25 Sep 2026 16:38:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8wS-0000000DxQ2-2rkn
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 16:38:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F11C660136;
	Fri, 25 Sep 2026 16:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FA11F000FF;
	Fri, 25 Sep 2026 16:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354311;
	bh=+3ptMQHZioL0GyGzjw8mYJksnNJNd1gNgEW48A3+JCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OFBmO2pTQ9pyN6XN3mtT8SxQxFQw6RGKcjpfM7vn0X57HYAyB0zuHFlfdmi1vbHYb
	 Z0Sa98UKxpt43/kf1PbTnOFjo3YcS8L8dQgY5rJTBEqC9VP3OEoOAav1nwFFxMG9uB
	 gZUYbU96vzgXnZOo4yFeWJr/M79ZB5BXkNqiT+2eunJvxPrvZaZVFhdzuCUQnjCVPM
	 P+MEBsGeF4FvJBexauDSb1nPe+U4g9CgAY9P3bvh5/G/iKUMUe32m27wI2jdMPskj0
	 RYIpoYCBitJsDfWPiLeOlaMBHsj2lMJmCuSVEkzrQSkJZsLCFcTVdr+vaUA6ad3T+W
	 4HdXFwO32p2wQ==
Date: Fri, 25 Sep 2026 17:38:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Fei Xie <fei.xie@horizon.auto>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Parshuram Thombare <pthombar@cadence.com>,
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] spi: cadence-xspi: add ACMD support for SPI NAND
Message-ID: <5600a2ce-0428-4f1c-af72-668a55ef6fce@sirena.org.uk>
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
 <20260921093701.1341766-3-fei.xie@horizon.auto>
 <arFEjzkHGMbecWWV@sirena.co.uk>
 <20260923061211.1608907-1-fei.xie@horizon.auto>
 <67f4e1a4-fc0e-4b2b-b41e-8dbb33227302@sirena.org.uk>
 <87pky1ll4g.fsf@bootlin.com>
 <arZHjbzUEFhydnHt@nsa>
 <87ecehljdy.fsf@bootlin.com>
 <85dc596e-4378-4d23-b48e-80053cb5166d@sirena.org.uk>
 <87qzihjxlo.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <87qzihjxlo.fsf@bootlin.com>
X-Cookie: Love America -- or give it back.
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
Content-Type: multipart/mixed; boundary="===============7449352996284809786=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7449352996284809786==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M4ifCx97cv0pZVcl"
Content-Disposition: inline


--M4ifCx97cv0pZVcl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 02:59:15PM +0200, Miquel Raynal wrote:
> On 25/09/2026 at 12:59:49 +01, Mark Brown <broonie@kernel.org> wrote:

> > It might potentially help a heavily loaded system if you can do fewer
> > waits, the rest of the tasks running on the system will have more time
> > if we're doing fewer waits for interrupts.  Not sure it'd be enough to
> > write home about though.

> Definitely, but this is already possible, one may implement
> ctlr->mem_ops->poll_status. This way the core can leverage the hardware
> to perform the polling. It is not directly visible on benchmarks,
> because it won't reduce much the wait time, but the system load will
> decrease.

You'd still get a benefit from taking just one interrupt per sequence
rather than one per operation, that can help when the system is heavily
loaded.

--M4ifCx97cv0pZVcl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2o4EACgkQJNaLcl1U
h9CNHgf/cvBZ+GyYuwWHmdwSwoY03PKLi2c5ks2Bwn3dlZ+RRSJ3Prtp/wdxPYgZ
3HFHtyKuIzWS1NGA6cKIEvBausOBN2Z5HQUIFXZ6Le3j54yIQqb+bVMB0H/AjGef
LA/tDAokGoff0PhaGUQRlo05AokS2EOS13kMMdlC6DzrVHNgVGFV+k+kU7h42kt5
xvxL8zHrZe1nVdtUkGvpvunV78AdVVyPcE6+/HzZnLeThoZcD0yVx6F/eqAQVbVr
mPVqzKhPkDxMlRitiScWu2I3Ybg3NYABe9W5ElpK7GxE/FlURwlFmajiBdM1rnf0
iE95xIyteW0awKr9ixhrLM78vnrNsg==
=3DcM
-----END PGP SIGNATURE-----

--M4ifCx97cv0pZVcl--


--===============7449352996284809786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7449352996284809786==--

