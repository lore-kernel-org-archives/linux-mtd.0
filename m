Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70692C4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6A+/Tvi+ZcHz/f1y+aD6nffC5rcbwCT5TzRph9kO0M=; b=mJy0ckRxwZrSHCz5Gq+c51UNTK
	8im8zlIpDrUC2lFXJLwJvk6ehDfj8+FcTDJafwtB3VPhc5rHogvNVEbeULTQbHNsIn2STRmd35aWQ
	WrCMOdq1JCp08V4bWgOnlmNwz6w+iG9neZjaLtPRwDTXQCuwOE7gSh0/U8Pc24SZCTmSX+TJh9YUe
	S266TwReNaETmQc3Heg5Bbs9oZTziCYgdL7hyLqoPiFpfi6W0u/3nu1Os7mzr05cwb1B3wuc8GeMn
	rJFnj3/LlLTla9MpOq0ZYfe892grk0YW6KuGIEE5pPK8yW4bgkuaJJQ6SEYTnz5LKuCRr70pgTpCA
	WTT4lLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racep-0000000GXqO-2Nz4;
	Thu, 15 Feb 2024 14:24:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racen-0000000GXq0-1d3M
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 14:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8D7E61DC7;
	Thu, 15 Feb 2024 14:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D23BC433C7;
	Thu, 15 Feb 2024 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708007048;
	bh=n4QN1QaOnHa9dWqkKphOT17gFQtTnkhJWHRJ7aqMprY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7PC2yP239Rulrb4Oc0X42S7d0fM0Qj3QMQ7xzjZKF6YFGVw1OWI0WKrgzuZCMR1u
	 FZ21DlxMcKnKJmfKG2ILc8JfIxKYteCJwBlYJtO8NPD76hUWOJwMScsukUMbNQPkvW
	 3TEa3/xe0SGtmFGuZPO+FxLf3K5zo9ILVYuFwg4pnJShUsfgTqYsdfoIu6kO16v1oN
	 O1pZejF6PC71dGBeD3ggzxHxqGdteuIjhg5T/gOPSxqZilj0Bk6JpK9exc5X/FDjfh
	 yEhuGn/4vntrq34XCOgVmOMZsMYwfwi9a5wQDA59IME5uJWA9JV8GO4J2/tyPDjFW5
	 Xon+tLJr8u3Ig==
Date: Thu, 15 Feb 2024 14:24:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH 1/5] spi: dt-bindings: add binding doc for spi-qpic-snand
Message-ID: <20240215-upon-anime-af032e49e84d@spud>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-2-quic_mdalam@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240215134856.1313239-2-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_062409_558846_77C1DED2 
X-CRM114-Status: GOOD (  15.85  )
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
Content-Type: multipart/mixed; boundary="===============1831174221972966614=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1831174221972966614==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UDj3Iu6IuX6GpJeg"
Content-Disposition: inline


--UDj3Iu6IuX6GpJeg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 07:18:52PM +0530, Md Sadre Alam wrote:
> Add device-tree binding documentation for QCOM QPIC-SNAND-NAND Flash
> Interface.
>=20
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
>  .../bindings/spi/qcom,spi-qpic-snand.yaml     | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qpic-s=
nand.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.ya=
ml b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
> new file mode 100644
> index 000000000000..fa7484ce1319
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/qcom,spi-qpic-snand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QPIC NAND controller
> +
> +maintainers:
> +  - Md sadre Alam <quic_mdalam@quicinc.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq9574-snand
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#
> +  - if:

> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq9574-snand
> +
> +    then:
> +      properties:
> +        dmas:
> +          items:
> +            - description: tx DMA channel
> +            - description: rx DMA channel
> +            - description: cmd DMA channel
> +
> +        dma-names:
> +          items:
> +            - const: tx
> +            - const: rx
> +            - const: cmd

None of this complexity here is needed, you have only one device in this
binding and therefore can define these properties at the top level.

Cheers,
Conor.

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
> +    qpic_nand: spi@79b0000 {
> +        compatible =3D "qcom,ipq9574-snand";
> +        reg =3D <0x1ac00000 0x800>;
> +
> +        clocks =3D <&gcc GCC_QPIC_CLK>,
> +                 <&gcc GCC_QPIC_AHB_CLK>,
> +                 <&gcc GCC_QPIC_IO_MACRO_CLK>;
> +        clock-names =3D "core", "aon", "iom";
> +
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        flash@0 {
> +            compatible =3D "spi-nand";
> +            reg =3D <0>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +            nand-ecc-engine =3D <&qpic_nand>;
> +            nand-ecc-strength =3D <4>;
> +            nand-ecc-step-size =3D <512>;
> +            };
> +        };
> --=20
> 2.34.1
>=20

--UDj3Iu6IuX6GpJeg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc4eggAKCRB4tDGHoIJi
0vO4AQC/9EXBXWmYMmh41rKINWfmf2C0tle9Rbns/1KqqVSKAQD+Lo3EUIx5DARc
ZjZm/tSapiiF/R0brf6h1Z0Dk28FfQQ=
=mzbY
-----END PGP SIGNATURE-----

--UDj3Iu6IuX6GpJeg--


--===============1831174221972966614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1831174221972966614==--

