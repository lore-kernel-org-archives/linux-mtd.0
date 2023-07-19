Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D974AC001DE
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Tnwchhpheb2or1vP2DyaRyaNiHWgiwOnt8vYEZcjWQ=; b=2hKY+JGpY6rlRDA8sDJEny143V
	K0YfSon+FyyQbuncJ3YmjZLKHE32jptFMKxQcdBZGAjUbXI5yd/+rrB1z5gXcBWflxPdig6+SEJSF
	n9sxSCIaWiTi0tdWXr/NupKVDcTbhzLdLp/4OwXAKEFhRVSjHBVEuZOqB1zzjoHO9YWvWxvwixUaz
	1+hmb1QKBUprNREkZSya3UfPO9eLrmPbCx3GVY0wJjIvcY1fLN1K3pYTpwg3ME/UxOdPpBhJib0LV
	CQu7JWx6SaJAoCYPy+hE/XbvGBMxc+58gN6+o48XQdLm6mGfVP5VpYvU5Tkd7O0XafgUztT+CGzFe
	SQW2TFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9tn-0086kj-2a;
	Wed, 19 Jul 2023 16:19:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9tj-0086ii-2l
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 16:19:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 50D526171C;
	Wed, 19 Jul 2023 16:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65CDC433C7;
	Wed, 19 Jul 2023 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689783570;
	bh=ExPtoNyHUFeA29htWYi8hJzCPMxOdh9y0o8C7+6x1lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OfTgyiTQhVxWaw755l10GClhg5+3b6Fp4FGzCfjaksK42v6g8fqT7ScwGk5/3hgfF
	 DBSZ2GMM24bHrNcLaDxGwITGb7o/Ga0jGOOsjBp7Jf3o4Mwhz1auzwHyPGc4b3ycVS
	 Zb3bXv8VtRDApWZg+oioE4IJY72NBKG+2Uo5bqwqiEBu1aqkRx2mK4vWihpgdpbq7Y
	 jk4P/nlwgijz1hDCElZ3EUjkhoa192INmKvNtqigHkW/mIQnSC3tWzAcx4Kbf0p7hS
	 10tQEjDtI4ytiTsTk6AuKJRwxzThXwaPmjBMP3XO4VmipcZ2UrNYlz5+1bj1SeAmpi
	 eVC0qOD3uM8Mg==
Date: Wed, 19 Jul 2023 17:19:25 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Walle <michael@walle.cc>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: convert U-Boot env to NVMEM
 layout
Message-ID: <20230719-prelaunch-hatching-556f6fe97c43@spud>
References: <20230718160652.26756-1-zajec5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230718160652.26756-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_091931_974145_59A6B7FB 
X-CRM114-Status: GOOD (  18.97  )
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
Content-Type: multipart/mixed; boundary="===============1762326605008443668=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1762326605008443668==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BSVX58EKAjDZorw2"
Content-Disposition: inline


--BSVX58EKAjDZorw2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 06:06:50PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Use "nvmem-layout" and drop unused "mac" label while at it.

Stupid question perhaps, does the "old" way of doing this still work
after this series?

Thanks
Conor.

>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  .../bindings/nvmem/layouts/nvmem-layout.yaml    |  1 +
>  .../nvmem/{ =3D> layouts}/u-boot,env.yaml         | 17 +++++++++++------
>  2 files changed, 12 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/nvmem/{ =3D> layouts}/u-boot,en=
v.yaml (87%)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout=
=2Eyaml b/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
> index 3b40f7880774..382507060651 100644
> --- a/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
> @@ -21,6 +21,7 @@ oneOf:
>    - $ref: fixed-layout.yaml
>    - $ref: kontron,sl28-vpd.yaml
>    - $ref: onie,tlv-layout.yaml
> +  - $ref: u-boot,env.yaml
> =20
>  properties:
>    compatible: true
> diff --git a/Documentation/devicetree/bindings/nvmem/u-boot,env.yaml b/Do=
cumentation/devicetree/bindings/nvmem/layouts/u-boot,env.yaml
> similarity index 87%
> rename from Documentation/devicetree/bindings/nvmem/u-boot,env.yaml
> rename to Documentation/devicetree/bindings/nvmem/layouts/u-boot,env.yaml
> index 36d97fb87865..ebe3b71ba155 100644
> --- a/Documentation/devicetree/bindings/nvmem/u-boot,env.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/layouts/u-boot,env.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/nvmem/u-boot,env.yaml#
> +$id: http://devicetree.org/schemas/nvmem/layouts/u-boot,env.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
>  title: U-Boot environment variables
> @@ -72,11 +72,14 @@ examples:
>          };
> =20
>          env: partition@40000 {
> -            compatible =3D "u-boot,env";
>              reg =3D <0x40000 0x10000>;
> =20
> -            mac: ethaddr {
> -                #nvmem-cell-cells =3D <1>;
> +            nvmem-layout {
> +                compatible =3D "u-boot,env";
> +
> +                ethaddr {
> +                    #nvmem-cell-cells =3D <1>;
> +                };
>              };
>          };
>      };
> @@ -92,9 +95,11 @@ examples:
>              label =3D "u-boot";
> =20
>              partition-u-boot-env {
> -                compatible =3D "brcm,env";
> +                nvmem-layout {
> +                    compatible =3D "brcm,env";
> =20
> -                ethaddr {
> +                    ethaddr {
> +                    };
>                  };
>              };
>          };
> --=20
> 2.35.3
>=20

--BSVX58EKAjDZorw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLgNDQAKCRB4tDGHoIJi
0hwUAP4j+zpbaVgSQrGuOwLm3aPVNHHJgVIEwIMMpon8jA4FeQD/b+UUjeXlLRus
R4eNI7ua07EPpuM/RbOpElBPPSqdog8=
=ON60
-----END PGP SIGNATURE-----

--BSVX58EKAjDZorw2--


--===============1762326605008443668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1762326605008443668==--

