Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F52C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 27 May 2022 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZ8DM1XZeYyySu+PPmrpnz/JOngPxOhH381l2QrewQM=; b=YrLz7roqxRlaAx6OfO0oXzi5TV
	G/yCvwP+CZqo19XQ53BGb0AH7C3ozmL4x/mhA6Aj9mR696fzP/XmnX9hFKtFe9HK+QZ0OW5zM6W8D
	MLnjyzRxiDpivldvZHqWO1ClRWgJfngog2qoXvdEFFgc9YDxaAGpSPJNw9qq9wmNBGd2jgT4K/L9g
	avPdSE3eWl4kOgKjI6G3sTSMOs/Je3oRtzkJ6tvEJwLPs0c1vIGmFQFwL+tGokjxc/hsrYRXP0iYm
	9rwsLh6NBD5Kojm6EGAVN8u1ju0feMlEq0oSh8xHap9dAWmxkXDI463o4dJg8J6kbckXkaNStlSRn
	vWXMIBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuWig-00HHAv-6i; Fri, 27 May 2022 09:57:22 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuWid-00HH9V-0X
	for linux-mtd@lists.infradead.org; Fri, 27 May 2022 09:57:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nuWiX-00035H-D2; Fri, 27 May 2022 11:57:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nuWiX-004qKc-Oe; Fri, 27 May 2022 11:57:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nuWiV-00CRDZ-B9; Fri, 27 May 2022 11:57:11 +0200
Date: Fri, 27 May 2022 11:57:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: mxc-nand: Drop undocumented properties
 from example
Message-ID: <20220527095711.j42sxprwddrieczz@pengutronix.de>
References: <20220525205947.2487165-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220525205947.2487165-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_025719_095409_093C402F 
X-CRM114-Status: GOOD (  19.92  )
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
Content-Type: multipart/mixed; boundary="===============7298957438687014459=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7298957438687014459==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="omrohr6kiqycho6o"
Content-Disposition: inline


--omrohr6kiqycho6o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 03:59:46PM -0500, Rob Herring wrote:
> With unevaluatedProperties issues fixed, 'nand-bus-width' and
> 'nand-ecc-mode' are flagged as undocumented. Removing them from the examp=
le
> is the easiest solution to silence the warnings.

It's not clear to me, what has to be done to see this warning. Can you
tell me how to reproduce?

My current WIP patch is:

diff --git a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml b/Document=
ation/devicetree/bindings/mtd/mxc-nand.yaml
index 73b86f2226c7..6e3e346e4448 100644
--- a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
@@ -14,7 +14,18 @@ allOf:
=20
 properties:
   compatible:
-    const: fsl,imx27-nand
+    oneOf:
+      - const: fsl,imx21-nand
+      - const: fsl,imx25-nand
+      - const: fsl,imx27-nand
+      - items:
+          - const: fsl,imx31-nand
+          - const: fsl,imx27-nand
+      - items:
+          - const: fsl,imx35-nand
+          - const: fsl,imx27-nand
+      - const: fsl,imx51-nand
+      - const: fsl,imx53-nand
=20
   reg:
     maxItems: 1

which I think is right, but obviously doesn't fix the problem you
pointed out :-)

> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> These properties may be deprecated, but they are still widely used in
> bindings. They either need to be documented (and marked deprecated) or
> removed from current users (i.e. dts files).

Or documented and not marked deprecated?

Best regards
Uwe

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

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--omrohr6kiqycho6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKQoHQACgkQwfwUeK3K
7AkfaAf/d1/EwccFh9yzkjPgHa2JzORRKDOHp9H8fuN2pO27GoFz8n3VowuV44pV
puzHKJyJxB9ZSPHLZpF7x306KGtBflg+Ttr7pgeRqrbE0LjwkCR5k+XzsrnDtboB
R8FxWnbaVYZToIkrNNWkTw1bvgjJ3uwwE3YDFEOXEZQZniZDh2KYDNJNNBs0fwrq
ZR751ZEXpTadOVlaKnjsUqAtiB2Ln0R4SnzBBOm7QkablUP6NpcumYWcOpahKQH2
Zox77WJaKqQSo226qvYEIxETljtPiqTA+KT83jxslUFnMAtHsEycbN7ZsZfuFdJn
VsMPz94QDd/Hy7UQxnV/y5xOzH1Aow==
=ndui
-----END PGP SIGNATURE-----

--omrohr6kiqycho6o--


--===============7298957438687014459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7298957438687014459==--

