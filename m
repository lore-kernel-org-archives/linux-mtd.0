Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AB7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 27 May 2022 09:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIYb978taYs9j6a9C+ZNxeIRcIJERy1xojFporuMtfU=; b=W8+sBsa+WWloalxVVfr3lGUa2O
	cuVGOM55Z/M06WEzy7P+PTNe5ooiqTjJWyXxk4wHYpXMa92jwIPHf1uNrfTXLplMhaZXr9Eka6FGl
	jZthkzw05pBSML2616+veOXqLip/GNnB1h5pJ+cm+lByy9841kEYucUzUpyccT3s3nQju5SvNGQBk
	FDUGRkPsyb/WZuHJVicuB48o7rMRliTSkWLaoEkU4Ib9XPiqWp5dnbR17DOvsXgC/EJu6jd8FUbMJ
	K4kz84VuGFt0m3VCL+eDpnnzMvwtwlNgbKSMkAC7P/w8J0t6iD86/1c1QeqmjY4SQ7pLwsmjBsPzG
	ogupecxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuWQl-00HDKo-76; Fri, 27 May 2022 09:38:51 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuWQi-00HDJ3-Gq
	for linux-mtd@lists.infradead.org; Fri, 27 May 2022 09:38:49 +0000
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1nuWQb-0000vI-7x; Fri, 27 May 2022 11:38:41 +0200
Received: from pengutronix.de (2a03-f580-87bc-d400-1aea-9b27-7153-c563.ip6.dokom21.de [IPv6:2a03:f580:87bc:d400:1aea:9b27:7153:c563])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id BE52E86CB1;
	Fri, 27 May 2022 09:38:39 +0000 (UTC)
Date: Fri, 27 May 2022 11:38:39 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: mxc-nand: Drop undocumented properties
 from example
Message-ID: <20220527093839.3byc6r6ixuu5givt@pengutronix.de>
References: <20220525205947.2487165-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220525205947.2487165-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_023848_578431_383FC831 
X-CRM114-Status: GOOD (  19.27  )
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
Content-Type: multipart/mixed; boundary="===============7327341936513289970=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7327341936513289970==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bh6neac3glogmych"
Content-Disposition: inline


--bh6neac3glogmych
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 25.05.2022 15:59:46, Rob Herring wrote:
> With unevaluatedProperties issues fixed, 'nand-bus-width' and
> 'nand-ecc-mode' are flagged as undocumented. Removing them from the examp=
le
> is the easiest solution to silence the warnings.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

At least the 'nand-bus-width' property is described in
"nand-controller.yaml" and the "mxc-nand.yaml" refers to it.

| allOf:
|   - $ref: "nand-controller.yaml"

Is this ref broken?

regards,
Marc

> ---
> These properties may be deprecated, but they are still widely used in
> bindings. They either need to be documented (and marked deprecated) or
> removed from current users (i.e. dts files).
> ---
>  Documentation/devicetree/bindings/mtd/mxc-nand.yaml | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml b/Docume=
ntation/devicetree/bindings/mtd/mxc-nand.yaml
> index 73b86f2226c7..66da1b476ab7 100644
> --- a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
> @@ -37,6 +37,4 @@ examples:
>          compatible =3D "fsl,imx27-nand";
>          reg =3D <0xd8000000 0x1000>;
>          interrupts =3D <29>;
> -        nand-bus-width =3D <8>;
> -        nand-ecc-mode =3D "hw";
>      };
> --=20
> 2.34.1
>=20
>=20

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--bh6neac3glogmych
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmKQnB0ACgkQrX5LkNig
013rPAf/T95ObL5kt1e5rsNh4vE5CHtYl1qVh4EBnyNLn0zn7UO2KVQvsC+PL8Kh
bHCC2BKCAOj4ArchBlSIHjBef7/TFe/xctP/L7CcmpusD7txFodk6v0RvkE/GqlQ
YbBCd0MU1AKYEeUtpxTijo+Zw1e2R+ZoafWFp/kGAMktAOc4K87zvC8ZJpCbRykF
mqDHSfs0GhXhy0JjQVu94eRLmHBwbBzT7XXfcc5yOG9V7aCVlanctAHkZYbSVBbS
+rJhJnV+UUqG4VK3xXaMKM3hBjQbPp8SxW2oZe+GudL6Rh33aq0oemAn5bzJLEfs
4Q8YCflj3GpSN4/skxLXg6umG1Rebw==
=ikYa
-----END PGP SIGNATURE-----

--bh6neac3glogmych--


--===============7327341936513289970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7327341936513289970==--

