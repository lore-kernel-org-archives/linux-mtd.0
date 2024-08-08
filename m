Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD960C3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Aug 2024 15:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xt+A2iOdSACWvy3m0Ng6T7ARub6zJUQWtI/eCgD3O7M=; b=D9IyInnl/+j0W8FFwuSMoT9z3O
	mruc4HhGByNncEJhRy3/Pbj2Qw8Y0kUz1GW5vzb59VWumG1aBMbfnRgSIlJxbZWSCrP6m/WGghNqu
	Do+bUh6/RM9ouPx4Dq80nb8LByiMV9Oe6cY7BvA/1FnrMtTEa6iCg/r7X8ODfGHbZZzhbxGD47Ei4
	nzuEHt44tIFdfKRbKT0nHifUB2e0hf0op1/H+PcVz9lBAWakFibBqMUtRQyNUV/eFiqlOX2ermyMi
	0fxqsrdymCejEIzqeZNgKn1NN2LmTnDUVhS0tA+oNdEWcjHmGI53m9HHaj/nU/iNJyMCeGYTYTAFH
	MxuqkwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc5Cp-00000008nFL-0Sb9;
	Thu, 08 Aug 2024 15:37:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc5Cm-00000008nEx-0n67
	for linux-mtd@lists.infradead.org;
	Thu, 08 Aug 2024 15:37:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6A91CCE18E6;
	Thu,  8 Aug 2024 15:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671B1C32782;
	Thu,  8 Aug 2024 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723131449;
	bh=RAPzk173wWVs48Ql9p6p42T/JVNyFolrQT4dn3Ymff4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGo+Rw06sFiWbEULMJDOWj9ztjASTJReIRZOGl9h53/LdFIb76dsKJfXkC8j2RJUr
	 XmHJ3wdrlcUN2pW/AUqNGHapO+O1cPH65sw8Ohw9osEyFnhYMPdZIVTIywLUWGzhNN
	 bxV5DRyuCvBJpNsNMbF9zo6D92z7dHkX2flJUpeRMD+asq11EvuRXqmHTHw2NBxVRz
	 IhHCZKnh2QyciKa4UsRpQG2qMWVF+1uOVbhsvvzjNsJySVap2h7hacEHJXsi/PTDvE
	 y6yLcRFsZ1khQphEBWkogNI5rHDZ0RUYxKsniP3qL5RQJ7XDPEEPyM82AAbp9SAdtG
	 oHw4mhwv/TTSQ==
Date: Thu, 8 Aug 2024 16:37:25 +0100
From: Conor Dooley <conor@kernel.org>
To: keguang.zhang@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240808-backyard-unglue-3cf429ad8da5@spud>
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
 <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_083732_601887_A12E11BC 
X-CRM114-Status: GOOD (  22.80  )
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
Content-Type: multipart/mixed; boundary="===============8756411336463926723=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8756411336463926723==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IivgV01SW2D8tib3"
Content-Disposition: inline


--IivgV01SW2D8tib3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2024 at 07:22:19PM +0800, Keguang Zhang via B4 Relay wrote:
> From: Keguang Zhang <keguang.zhang@gmail.com>
>=20
> Add devicetree binding document for Loongson-1 NAND Controller.
>=20
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> Changes in v8:
> - Add a description part.
> - Adjust the compatible because the match data for ls1c-nfc differs from =
ls1b-nfc.
> - Mark 'nand-use-soft-ecc-engine' and 'nand-ecc-algo' as mandatory.
> - Delete the superfluous blank lines.
>=20
> Changes in v7:
> - rename the file to loongson,ls1b-nfc.yaml
>=20
> Changes in v6:
> - A newly added patch
> ---
>  .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml | 75 ++++++++++++++++=
++++++
>  1 file changed, 75 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml=
 b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> new file mode 100644
> index 000000000000..7ce335324a29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml

When I first read "nfc" here I thought it was a copy-paste mistake, as
"nfc" is a technology of it's own. I think it would make sense to rename
to "loongson,ls1b-nand-controller" etc to remove that sort of confusion.
These devices might not implement NFC, but what's to say that a future
device will not?

Cheers,
Conor.

> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/loongson,ls1b-nfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-1 NAND Controller
> +
> +maintainers:
> +  - Keguang Zhang <keguang.zhang@gmail.com>
> +
> +description: |

This | is not needed.

> +  The Loongson-1 NAND controller abstracts all supported operations,
> +  meaning it does not support low-level access to raw NAND flash chips.
> +  Moreover, the controller is paired with the DMA engine to perform
> +  READ and PROGRAM functions.
> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - loongson,ls1b-nfc
> +          - loongson,ls1c-nfc
> +      - items:
> +          - enum:
> +              - loongson,ls1a-nfc
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
> +
> +patternProperties:
> +  "^nand@[0-3]$":
> +    type: object
> +    $ref: raw-nand-chip.yaml
> +
> +    required:
> +      - nand-use-soft-ecc-engine
> +      - nand-ecc-algo
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
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
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
> 2.43.0
>=20
>=20

--IivgV01SW2D8tib3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrTmNQAKCRB4tDGHoIJi
0gQGAQD4FzC6xGG9TJwnPfpKvGfe1EEUqx9N24HY676DWUAOWAEA4rp26Na9xv5L
k+pYjSdEwe8GytO0yKotr98oBr8C3gc=
=O27f
-----END PGP SIGNATURE-----

--IivgV01SW2D8tib3--


--===============8756411336463926723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8756411336463926723==--

