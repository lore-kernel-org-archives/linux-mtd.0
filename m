Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84594CEF174
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 13:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5HnH7a9VmvWqujQ20kLNLwfD/6VC0sLxGsfGwtEw9s=; b=y7XuZVGaXN8JcG
	QiRAncbeDjIcwXWQyp/oh9kj945W2UkfIteqiB7PRW1fgauWJBaR+sHJVVDxU1gsoUVRZc7OvImpz
	vSY36XK0zWtI8XNF00olgnkz0AZdT2isiGSYDn8cgbUYY5bAJ/46Hr2jpWH2QoU2opvCYjzluhNRo
	SM69thXaGung8R8MbmcUfxcAgeDaBnFQJkDgb7Ps4I1Xt3einYHpAFHyyJXwGq2UuQDrCuEfJMWX/
	FTPZiJ3KOjY/Ld4ms7Vjl9RFTdBmcqLeouMUbudXWB0FX+Ik+fdR0PH1sknv7xsZLO8GKYD0c+dPE
	KJA4LKUHHayl6Tok7e2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syAPy-000000061Me-16h1;
	Tue, 08 Oct 2024 13:38:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syAGT-00000005zKy-3gm6
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 13:28:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22C165C5BDE;
	Tue,  8 Oct 2024 13:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8CDC4CECD;
	Tue,  8 Oct 2024 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728394117;
	bh=14qGYeM0ii/htuwDgyw45Jd41C1hUPbWSgeByF8tYkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=neveWu31FituKGuru4HxDagfnPHNfLpq0n+EN/+IFoMajVnymRa0UDighXjUSRmOn
	 utWBLcm1c8YPSLTPdmKpOT/qT5BjFR1Ht0kKigkiFU9LlObh7kmx/jjOAHu5P+wcPf
	 Dhr8ofyX2xaHAlZc0bNcy+W0shER2yYn4tIyWZY/Rpsbzb0dCFlwJz1BFkvJlK3Xe2
	 Widt+XTS/Zq5z6V1AxOXKr+7j6K+pGjpmBekwWHvUo1tJhF1cAnKbfre5HVAvIBTVS
	 7uLZMmPgbzne7nmUcDfJWWRmmbVhQl0afFCdm6jIAovcFuYMuGVU+NRJVGfd1hVtGV
	 MRmjgYi37eYgQ==
Date: Tue, 8 Oct 2024 15:28:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: mtd: davinci: convert to yaml
Message-ID: <4u5iv24enpz46funfvbo2aggx6yiqxy7beaa3ldt5ai5wf65kl@bnlm4eyuwkui>
References: <20241008-ondie-v5-0-041ca4ccc5ee@gmail.com>
 <20241008-ondie-v5-2-041ca4ccc5ee@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241008-ondie-v5-2-041ca4ccc5ee@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_062838_031752_147C57AB 
X-CRM114-Status: GOOD (  21.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 08, 2024 at 09:02:45AM +0200, Marcus Folkesson wrote:
> Convert the bindings to yaml format.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  .../devicetree/bindings/mtd/davinci-nand.txt       |  94 -----------------
>  .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 115 +++++++++++++++++++++
>  2 files changed, 115 insertions(+), 94 deletions(-)
> 


> diff --git a/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml b/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..1263616593532e8483d556b4242b004a16620ddf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI DaVinci NAND controller
> +
> +maintainers:
> +  - Marcus Folkesson <marcus.folkesson@gmail.com>
> +
> +allOf:
> +  - $ref: nand-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,davinci-nand
> +      - ti,keystone-nand
> +
> +  reg:
> +    maxItems: 1

This was different in original binding and commit msg does not explain
changes.  Be sure any change from pure conversion is explained in the
commit msg.

> +
> +  partitions:
> +    $ref: /schemas/mtd/partitions/partitions.yaml
> +
> +  ti,davinci-chipselect:
> +    description:
> +      Number of chipselect. Indicate on the davinci_nand driver which
> +      chipselect is used for accessing the nand.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +
> +  ti,davinci-mask-ale:
> +    description:
> +      Mask for ALE. Needed for executing address phase. These offset will be
> +      added to the base address for the chip select space the NAND Flash
> +      device is connected to.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x08
> +
> +  ti,davinci-mask-cle:
> +    description:
> +      Mask for CLE. Needed for executing command phase. These offset will be
> +      added to the base address for the chip select space the NAND Flash device
> +      is connected to.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x10
> +
> +  ti,davinci-mask-chipsel:
> +    description:
> +      Mask for chipselect address. Needed to mask addresses for given
> +      chipselect.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +
> +  ti,davinci-ecc-bits:
> +    description: Used ECC bits.
> +    enum: [1, 4]
> +
> +  ti,davinci-ecc-mode:
> +    description: Operation mode of the NAND ECC mode.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [none, soft, hw, on-die]
> +    deprecated: true
> +
> +  ti,davinci-nand-buswidth:
> +    description: Bus width to the NAND chip
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [8, 16]
> +    default: 8
> +    deprecated: true
> +
> +  ti,davinci-nand-use-bbt:
> +    type: boolean
> +    description:
> +      Use flash based bad block table support. OOB identifier is saved in OOB
> +      area.
> +    deprecated: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - ti,davinci-chipselect
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nand-controller@2000000 {
> +      compatible = "ti,davinci-nand";
> +      #address-cells = <1>;
> +      #size-cells = <0>;

I did not notice it last time.... but what is this? How could you have
no sizes?

> +
> +      reg = <0 0x02000000>;

This is odd. Address is not 0... and size should be 0.

I don't get how it even works. For sure it is not correct.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
