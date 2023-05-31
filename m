Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1886EC77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 12:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H23F6bmxvXMyJZ4RWLYKOqxD0qxUBvopEXwReJ9oSKo=; b=PnEKmhOd3ey+w5kIgVAyma8sJn
	VKEXf7AdTn+pjdrNlOIiL4L1ZPrjDO0rjiBVdrZq9y4drG/SnVfZSYnlDn1v6izHr8LIxNWBs7fYy
	qAI6q4srdWNYP/9HLsayRh2L2DVIJuA99TiC96UBjLsz6+W3NaQ14iCLGVjGclgvY0wCykjMfdLgp
	Ag+yoxtpFpUumFk+IxIDi1cXO4HZp4/eZDAu0dU8nZwK4oEsGp1WwwC59EkCFB1gQkJTYakVuBygL
	a/zRMoDWbDj4DPvbkvVV+hFBW2O/ATryoQcSU3yZzU5S27dpFfbWmYIwaYPKNQJstV4KkHMCtSryh
	0oESRoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4L33-00HNF5-1P;
	Wed, 31 May 2023 12:35:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4L2o-00HNBk-32;
	Wed, 31 May 2023 12:35:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5CE4763024;
	Wed, 31 May 2023 12:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1740C4339E;
	Wed, 31 May 2023 12:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685536513;
	bh=yuATc0ewpjoNkponZyfQ6nxQCdgMjgGjVPMha1ccK5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BE5M3bXVySZN4XBI7InXHGgsRr+/vX8+uyevGhLaMHsvzFl0OP+np7347BMSm3/PW
	 U6nEdPtTyyg/nbk0loD54Fdg8LVFAvMY9TtowZFw0+XM1SmiCKGYtUk+JMK7ujL1Gl
	 Q1hbP80hFOr7B9LHX9X/Z6Y2W6Y/6Yl+Jzks1pdbAis+ZPSZkUn/7JhpgTwZZ7Kf25
	 K/IRhJvfPiU6+YWpirDBBizqxv4egoG8r36hBf88SxzDNklyYt9YvykBSZ62zkNmTG
	 xG+4Erdnrx+bYTxd9rt0r/o+vjyoImE2xhcWbwUATckXRC6wb2gxoSjGGInfYTUPaw
	 epLzsz/BJcT+g==
Date: Wed, 31 May 2023 13:35:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, enachman@marvell.com,
	Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v7 3/4] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <20230531-botanical-swoosh-05683af1d3f0@spud>
References: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
 <20230530235456.1009082-4-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
In-Reply-To: <20230530235456.1009082-4-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_053515_064204_E48B75DE 
X-CRM114-Status: GOOD (  30.66  )
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
Content-Type: multipart/mixed; boundary="===============2292848556873260217=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2292848556873260217==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YdeHVyof/+8Ux7qZ"
Content-Disposition: inline


--YdeHVyof/+8Ux7qZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Chris,

On Wed, May 31, 2023 at 11:54:55AM +1200, Chris Packham wrote:
> From: Vadym Kochan <vadym.kochan@plvision.eu>
>=20
> Switch the DT binding to a YAML schema to enable the DT validation.
>=20
> Dropped deprecated compatibles and properties described in txt file.
>=20
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>=20
> Notes:
>     Changes in v7:
>     - Restore "label" and "partitions" properties (should be picked up via
>       nand-controller.yaml but aren't)
>     - Add/restore nand-on-flash-bbt and nand-ecc-mode which aren't covered
>       by nand-controller.yaml.
>     - Use "unevalautedProperties: false"
>     - Corrections for clock-names, dma-names, nand-rb and nand-ecc-streng=
th
>     - Add pxa3xx-nand-controller example
>    =20
>     Changes in v6:
>     - remove properties covered by nand-controller.yaml
>     - add example using armada-8k compatible
>    =20
>     earlier changes:
>    =20
>     v5:
>        1) Get back "label" and "partitions" properties but without
>           ref to the "partition.yaml" which was wrongly used.
>    =20
>        2) Add "additionalProperties: false" for nand@ because all possible
>           properties are described.
>    =20
>     v4:
>        1) Remove "label" and "partitions" properties
>    =20
>        2) Use 2 clocks for A7K/8K platform which is a requirement
>    =20
>     v3:
>       1) Remove txt version from the MAINTAINERS list
>    =20
>       2) Use enum for some of compatible strings
>    =20
>       3) Drop:
>             #address-cells
>             #size-cells:
>    =20
>          as they are inherited from the nand-controller.yaml
>    =20
>       4) Add restriction to use 2 clocks for A8K SoC
>    =20
>       5) Dropped description for clock-names and extend it with
>          minItems: 1
>    =20
>       6) Drop description for "dmas"
>    =20
>       7) Use "unevalautedProperties: false"
>    =20
>       8) Drop quites from yaml refs.
>    =20
>       9) Use 4-space indentation for the example section
>    =20
>     v2:
>       1) Fixed warning by yamllint with incorrect indentation for compati=
ble list
>=20
>  .../bindings/mtd/marvell,nand-controller.yaml | 221 ++++++++++++++++++
>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ----------
>  MAINTAINERS                                   |   1 -
>  3 files changed, 221 insertions(+), 127 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-co=
ntroller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controlle=
r.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> new file mode 100644
> index 000000000000..7cd4a2e99343
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> @@ -0,0 +1,221 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/marvell,nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell NAND Flash Controller (NFC)
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: marvell,armada-8k-nand-controller
> +          - const: marvell,armada370-nand-controller

Apologies if I have missed this - but the commit message should probably
explain where this fallback came from since it does not appear to be
present in the original binding.

> +      - enum:
> +          - marvell,armada370-nand-controller
> +          - marvell,pxa3xx-nand-controller

> +          - marvell,armada-8k-nand
> +          - marvell,armada370-nand
> +          - marvell,pxa3xx-nand

Please mark these 3 as deprecated.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      Shall reference the NAND controller clocks, the second one is
> +      is only needed for the Armada 7K/8K SoCs

As a nit, allOf below invalidates this second part of the sentence (in
possibly a clearer way too).

> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - const: reg
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - enum:

I don't think the items: here is needed, enum on its own suffices, no?

Cheers,
Conor.

--YdeHVyof/+8Ux7qZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHc+6wAKCRB4tDGHoIJi
0uyhAQDKKUynMOe4ocCMIjqXxFF5IJ80y0JmIzHnljlbls4TAgD9E0fd+PguTVQu
cNOwu/6pc/nngrCtlryA4l55i5qpEQc=
=fT3C
-----END PGP SIGNATURE-----

--YdeHVyof/+8Ux7qZ--


--===============2292848556873260217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2292848556873260217==--

