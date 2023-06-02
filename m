Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472A3C7EE29
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jun 2023 17:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EeH89UAY6n8Gt0eBMkBM4zFuoHxLhqm5x/f4MdxzTg=; b=U9/DuRdWkOjGfh7d73ea+kYyN4
	n+8pKgW77GWoHjlIcUEUyy+DYJyBQNPmwIRCo1SYedCX95Zjm1s4BhGZydphVjHwFKgadjN5OJO42
	PDWxWSnXEZolLB8fiJ4iCznjidG5T9Mtdv+ty6fo+10HbKaPgw+mKTqgdbIVK1uc3KAOV+nr7ktr1
	2++5f8eyCajYs0h2jlue63hfflXHXfgSeq+JX4Y8giOxjSCp7CkNx8NU1rgL4yKmaI7wick6geJDy
	zdPWxPtiGILK7GXAA8QW9n8fNIvBqfVRo76rgPTdbvDKfnopB3o9keUfEJkjLCzy+9lCd1s1KGvZ8
	/BGYFr3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q58hl-007Y0c-1I;
	Fri, 02 Jun 2023 17:36:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q58hi-007Xzu-1n
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jun 2023 17:36:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0643C60D2E;
	Fri,  2 Jun 2023 17:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06835C433D2;
	Fri,  2 Jun 2023 17:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685727405;
	bh=H8cO8pwKMsgmyagKn0dUw4ty1lVYzMAg/B0nJrCbPPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3UoMKi01tdjuM/yNwb/HhcXMoDmwMRx6E0jpL0EYmygJ3nl3PhYoZpFQ3/amrjU0
	 012lWNGdxHUOFz17Rc1NFuVX4va5gaINxLhqCYfwi5ToMFkr3XqILCaQ+QoxglfgMR
	 gWQZfK2xamdbjj0hZU2FY3RGskBPCg7HsOumXoU+0EFlt7aG/td363RJWDsEKDcPOO
	 NJtToqFgvtVuoCSyCBIqzqRJ43tFig6mJNJ5aiPEF6VIKKcXoRT3WPEv8+iim3W1gy
	 AkQK6IX5DFdvdwoBGEKwmGFqbw4+p1Px2jIDzdanFS+B0romUON5BYhO06U+RPE3pU
	 47EZGKwpy8MNw==
Date: Fri, 2 Jun 2023 18:36:40 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pratyush Yadav <ptyadav@amazon.de>, Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: mtd: partitions: Include TP-Link SafeLoader
 in allowed list
Message-ID: <20230602-concise-lent-612301adb856@spud>
References: <20230602161023.14739-1-zajec5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230602161023.14739-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_103646_634309_5D8A7DA0 
X-CRM114-Status: GOOD (  16.53  )
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
Content-Type: multipart/mixed; boundary="===============0473535975851331042=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0473535975851331042==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o5EchAN4kPIujJ+I"
Content-Disposition: inline


--o5EchAN4kPIujJ+I
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2023 at 06:10:23PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This fixes validation of Linux hosted DTS files for Northstar based
> TP-Link routers.

What is the actual error that this fixes?

Cheers,
Conor.

>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/mtd/partitions/partitions.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.=
yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> index 2edc65e0e361..1dda2c80747b 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> @@ -21,6 +21,7 @@ oneOf:
>    - $ref: linksys,ns-partitions.yaml
>    - $ref: qcom,smem-part.yaml
>    - $ref: redboot-fis.yaml
> +  - $ref: tplink,safeloader-partitions.yaml
> =20
>  properties:
>    compatible: true
> --=20
> 2.35.3
>=20

--o5EchAN4kPIujJ+I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHooqAAKCRB4tDGHoIJi
0rLIAQDtgZZe23hQKLk5rCFrwCL8nX7+5VxmDD0sKDgn55FjyQD9HdyW13V8NeR4
wtJpUiHFEqfkD/ZXnOxfrfeksxuQowc=
=h+rh
-----END PGP SIGNATURE-----

--o5EchAN4kPIujJ+I--


--===============0473535975851331042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0473535975851331042==--

