Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EA1C02193
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 19:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4+nSNCHoI0N1sySFRkSSgmwlFhxcNj2B1fzy/hlNa4=; b=Gy2JTXV5fbvTUIAUs7fkYal3t0
	W7yzAw+QZfqBp0oPTNCD8SzHJkYdKirw0IPqk/vPG19XOiW+QZQiU66PPya6eZa+2RrQTaREFr/Cz
	7Ae2xgvhnCPFH22x3nlRqXsi0fboTBYVMUOIXwGEVygA2VnP66pzHajtDyOEPrO1Fhm+YPgwMnw5x
	E8+vmnfEVeZBhoUERZra8NVv+ApeGwzNgGzfM2z4F+VVzDu6h3TF63rih+SABj/YEjmx0uPBFhOUJ
	MEDY05vE7aYhq19AgDKeZn4HswFxkLi1aw3yEmT5XtmdYU1aujEQD5apqHltyl5mlEbAC2QIToNiw
	dw0zyK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOpN-00000001Odh-1n5J;
	Tue, 04 Feb 2025 19:43:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOn9-00000001O3F-3lt0;
	Tue, 04 Feb 2025 19:41:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0BD40A42C6F;
	Tue,  4 Feb 2025 19:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D36C4CEDF;
	Tue,  4 Feb 2025 19:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738698062;
	bh=JsbdS+VSX2zerX1EGa50DMfTtA6lRcOiTssSk+CZwtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PLk5XcgTS8zIYGhlOdpqvLx4nMj4veKaBYppmoKrbHGYIAvuUyOZOriXpu6u7jcp6
	 Qq0HI9kRBtRc4Wazlq2oZzCd4xUmbqdToz1Xt3YhI9/ldRRKuAhGCKMuNAbrnAZi+J
	 ydyRWaUDz+WW0sejDhltNYpgyEdzMl1RMhXuM4Nh4auUW8iviBusUT5afIZP/8PVpT
	 pmrYnrSkIeQOWaiSGooPp4abObgc3ENmBLEwEqhWMiBPhdRZxrBfUWIQrcbNvSF57W
	 23hj1qMA3ZA4tEQWPHURkDUc1Hn2g3eeVP9wi2GmmEU75igeGeDqEfNHPHGuL82EHv
	 xZlyudll+yfUg==
Date: Tue, 4 Feb 2025 19:40:58 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: physmap: Ensure all properties are
 defined
Message-ID: <20250204-craftsman-sandbag-9fa200d77398@spud>
References: <20250203213036.9816-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250203213036.9816-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_114104_000475_3E4E34CB 
X-CRM114-Status: GOOD (  15.32  )
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
Content-Type: multipart/mixed; boundary="===============5174375253201816302=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5174375253201816302==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KnjCQsogAgVBMdmo"
Content-Disposition: inline


--KnjCQsogAgVBMdmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 03:30:35PM -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add the missing 'ranges'
> property, and fix this constraint.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/mtd-physmap.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Doc=
umentation/devicetree/bindings/mtd/mtd-physmap.yaml
> index 18f6733408b4..1b375dee83b0 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> @@ -122,6 +122,8 @@ properties:
>    '#size-cells':
>      const: 1
> =20
> +  ranges: true
> +
>    big-endian: true
>    little-endian: true
> =20
> @@ -143,8 +145,7 @@ then:
>    required:
>      - syscon
> =20
> -# FIXME: A parent bus may define timing properties
> -additionalProperties: true
> +unevaluatedProperties: false

I dunno what that comment has to do with anything? If a parent bus
defined properties, wouldn't they be in the parent bus?

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--KnjCQsogAgVBMdmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6JtSgAKCRB4tDGHoIJi
0u+EAPwLj8afRS9DROXhuBoSq8kHCpjNNFQq0nFa1KEOjQdxXwEAl20Xpr5iCHJo
iVXHQHmfO7DLyTkbo9WTdRnmtgORsQY=
=9cHz
-----END PGP SIGNATURE-----

--KnjCQsogAgVBMdmo--


--===============5174375253201816302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5174375253201816302==--

