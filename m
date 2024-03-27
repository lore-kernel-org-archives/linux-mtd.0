Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728BCC54E67
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2024 16:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzkDKjNIHOK5oXvRxMoDsWT9uiJrqJ64eyju9/PfmiE=; b=R4d4DwDST4zQoujYz9S7tCpvxI
	xjasFytXqUjWz+BeOf7BwTDTMhTQ0OJefxbqDfUWoal2t+WpNbaWmpl4ESEGrND5vooAC8Z2xDZT6
	O0eBUYIYoNBpulebXmPb9PyiCu4cVNGfMmuIsg6efxAycpP6pO2D4CVwCRG/EFhCFUr3Gov573Beg
	QSyVqX85m5ItwBv8xWaskG/1+pZIq5g4IIXh35wtPbMUk88BuMYt1XyesVLtxZs8NT05omttduPYU
	QYwm5ehTWB7OVJpyx6K0d9styfu41K75PLIdCokT43dhQMoH4VfNGItr7IeaOCa0ALJ6hv4j0sPsP
	bKRAPnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpW3u-0000000A4B8-0ecV;
	Wed, 27 Mar 2024 16:23:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpW3p-0000000A49d-1q21
	for linux-mtd@lists.infradead.org;
	Wed, 27 Mar 2024 16:23:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7B1A615F2;
	Wed, 27 Mar 2024 16:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB43C433F1;
	Wed, 27 Mar 2024 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711556612;
	bh=vfPOVeol10GjjIU8ukwbAq6kQFpShA89H7TmSgKAE5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=antVw9bEudlvuPfsZTc4U5PdrQ+1Sv1sJpEBD79eHkcA23MRs6E/67Vh7v+GGzwo+
	 80UP4CDdyBynFZZhYS1gJUTAbd+NUya50+NYF1FBrPS00OrWRulINJ0v0EE/nmS11I
	 DF7KsVEjQlTZO9kWv5UB8IKfVmCtYDlJtrw6jUBsqG57YiNWV2uFrbP8gu1aOmOOxz
	 PC9bo9vCsmMFKgQRLe2bRFKUnJ7DU0OYP/sGcUsuGqrY3KVmhvEQY+wJKOMDMW6c1j
	 T/OHcS6tovHgtDXoyok9M7rsKgp4a1uRTLEQKAEsfWTDJFjn83qB8e5Qj//O59P45I
	 XjlIEAxaflZwg==
Date: Wed, 27 Mar 2024 16:23:28 +0000
From: Conor Dooley <conor@kernel.org>
To: keguang.zhang@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240327-bonehead-handlebar-1ca8dab95179@spud>
References: <20240327-loongson1-nand-v6-0-7f9311cef020@gmail.com>
 <20240327-loongson1-nand-v6-1-7f9311cef020@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240327-loongson1-nand-v6-1-7f9311cef020@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_092335_213391_93B0E235 
X-CRM114-Status: GOOD (  16.79  )
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
Content-Type: multipart/mixed; boundary="===============7890615371948171456=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7890615371948171456==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yDH5t1GCumTzOBnO"
Content-Disposition: inline


--yDH5t1GCumTzOBnO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 06:43:59PM +0800, Keguang Zhang via B4 Relay wrote:
> From: Keguang Zhang <keguang.zhang@gmail.com>
>=20
> Add devicetree binding document for Loongson-1 NAND Controller.
>=20
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> Changes in v6:
> - A newly added patch
> ---
>  .../devicetree/bindings/mtd/loongson,ls1x-nfc.yaml | 66 ++++++++++++++++=
++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1x-nfc.yaml=
 b/Documentation/devicetree/bindings/mtd/loongson,ls1x-nfc.yaml
> new file mode 100644
> index 000000000000..2494c7b3b506
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1x-nfc.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/loongson,ls1x-nfc.yaml#

Please make the filename match the compatible.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-1 NAND Controller
> +
> +maintainers:
> +  - Keguang Zhang <keguang.zhang@gmail.com>
> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: loongson,ls1b-nfc
> +      - items:
> +          - enum:
> +              - loongson,ls1a-nfc
> +              - loongson,ls1c-nfc
> +          - const: loongson,ls1b-nfc
> +
> +  reg:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    const: rxtx

If you only have one dma, why do you need a dma-names entry for it?

Looks fine to me otherwise though,
COnor.

> +
> +patternProperties:
> +  "^nand@[0-3]$":
> +    type: object
> +    $ref: raw-nand-chip.yaml
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - dmas
> +  - dma-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nand-controller@1fe78000 {
> +        compatible =3D "loongson,ls1b-nfc";
> +        reg =3D <0x1fe78000 0x40>;
> +
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        dmas =3D <&dma 0>;
> +        dma-names =3D "rxtx";
> +
> +        nand@0 {
> +            reg =3D <0>;
> +            nand-use-soft-ecc-engine;
> +            nand-ecc-algo =3D "hamming";
> +        };
> +    };
>=20
> --=20
> 2.40.1
>=20
>=20

--yDH5t1GCumTzOBnO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgRH8AAKCRB4tDGHoIJi
0kj7AP42f1IGw8/uELOCbVdp8rqrSHtY1cdHyVGBqH4jo8IuMwD/U9azUbyS3Hm1
gd8v7u0uXHNq+KiSBtDQOh2Gsg6REQs=
=2rtW
-----END PGP SIGNATURE-----

--yDH5t1GCumTzOBnO--


--===============7890615371948171456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7890615371948171456==--

