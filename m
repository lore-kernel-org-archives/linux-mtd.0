Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36B9C021A4
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 19:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3pjONqFrQ41rrDrYIdn7ODdckQzi/Mm5azt2jsc+P4=; b=Kr/PqBuoMPXz6b
	qqfZRMnqCBPNr9zI2r+mUAA2a/IjDnD2uuCYLZOtcIXLeoC3I20H1+L8IgIBkBPlZAc1ox20/9txI
	ZeITz4YAbNbEhUPGjbuhE/IleZVWL1xr6L5mb0SaPVtZTaz5duJSjclrhLnIzPoMWqJ8C6pSeNb20
	vq334VxwluARx+rwkCzy554DsujtRdnJIPPWJraz3lZ4ULIae8EVF5KxJt1FMQZsgG79Tg0Rl81lB
	sGvOOJm56O7tLzYSAZbJLRKCk5XoThAwQO+7vXexgsHW7MwiTKebgg/SsEouPBY5011QVrtMIgLg/
	iA8v4TokqWaPB4BWH1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIYw-00000008fKL-3foR;
	Wed, 12 Feb 2025 19:38:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIYr-00000008fIu-3a16
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 19:38:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D96EA40F73;
	Wed, 12 Feb 2025 19:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642E5C4CEDF;
	Wed, 12 Feb 2025 19:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739389096;
	bh=pq9uKQvjFYwDm1Q4B6BmedrGAyc5w91dQwDdbRZBMW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mQBWoZm9pBkAJzBWRz85ZCMTj9IvaY3BA0rxBDDYNpPHMJZ17i09UNxwChFyw0hVZ
	 mbBIuzakROKILvDV5vGDjyN1gMB2TYRWqQYBR/NF21saMN5npe5HC205R2hRIW+xEJ
	 WNMFsM4kAklYkc3yn8/eKUkVaJUPLrYOT0ROBS+XvncYTfQTtAvKtOISkDXenE24NQ
	 6wa3y+6po0NoVWWK2jUywFmF+27+PJBC6jKh0tBUWtlCctbBKKTKQ7EMqk3FyYliyM
	 C7NHhBicFH74iUz86RYpL6uWHOkMzY1SyHEKxjDgogi/QjGlEPpfqSM/yW6mc8gl9J
	 kGVNNVKgf+GQQ==
Date: Wed, 12 Feb 2025 13:38:15 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 05/12] dt-bindings: dma: Convert fsl,elo*-dma to YAML
Message-ID: <20250212193815.GA113049-robh@kernel.org>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-5-8137b0c42526@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250207-ppcyaml-v2-5-8137b0c42526@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_113818_025744_D09E6BE7 
X-CRM114-Status: GOOD (  22.45  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 07, 2025 at 10:30:22PM +0100, J. Neusch=E4fer wrote:
> The devicetree bindings for Freescale DMA engines have so far existed as
> a text file. This patch converts them to YAML, and specifies all the
> compatible strings currently in use in arch/powerpc/boot/dts.
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
> =

> V2:
> - remove unnecessary multiline markers
> - fix additionalProperties to always be false
> - add description/maxItems to interrupts
> - add missing #address-cells/#size-cells properties
> - convert "Note on DMA channel compatible properties" to YAML by listing
>   fsl,ssi-dma-channel as a valid compatible value
> - fix property ordering in examples: compatible and reg come first
> - add missing newlines in examples
> - trim subject line (remove "bindings")
> ---
>  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 140 ++++++++++++++
>  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 123 +++++++++++++
>  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 134 ++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------=
------
>  4 files changed, 397 insertions(+), 204 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml b/Doc=
umentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3d8be9973fb98891a73cb701c=
1f983a63f444837
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/fsl,elo-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Elo DMA Controller
> +
> +maintainers:
> +  - J. Neusch=E4fer <j.ne@posteo.net>
> +
> +description:
> +  This is a little-endian 4-channel DMA controller, used in Freescale mp=
c83xx
> +  series chips such as mpc8315, mpc8349, mpc8379 etc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,mpc8313-dma
> +          - fsl,mpc8315-dma
> +          - fsl,mpc8323-dma
> +          - fsl,mpc8347-dma
> +          - fsl,mpc8349-dma
> +          - fsl,mpc8360-dma
> +          - fsl,mpc8377-dma
> +          - fsl,mpc8378-dma
> +          - fsl,mpc8379-dma
> +      - const: fsl,elo-dma
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      DMA General Status Register, i.e. DGSR which contains status for
> +      all the 4 DMA channels.
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller index. 0 for controller @ 0x8100.
> +
> +  ranges: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Controller interrupt.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "^dma-channel@.*$":

You need to define the unit-address format.

> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        oneOf:
> +          # native DMA channel
> +          - items:
> +              - enum:
> +                  - fsl,mpc8315-dma-channel
> +                  - fsl,mpc8323-dma-channel
> +                  - fsl,mpc8347-dma-channel
> +                  - fsl,mpc8349-dma-channel
> +                  - fsl,mpc8360-dma-channel
> +                  - fsl,mpc8377-dma-channel
> +                  - fsl,mpc8378-dma-channel
> +                  - fsl,mpc8379-dma-channel
> +              - const: fsl,elo-dma-channel
> +
> +          # audio DMA channel, see fsl,ssi.yaml
> +          - const: fsl,ssi-dma-channel
> +
> +      reg:
> +        maxItems: 1
> +
> +      cell-index:
> +        description: DMA channel index starts at 0.
> +
> +      interrupts:
> +        maxItems: 1
> +        description:
> +          Per-channel interrupt. Only necessary if no controller interru=
pt has
> +          been provided.
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dma@82a8 {

dma-controller@...

> +        compatible =3D "fsl,mpc8349-dma", "fsl,elo-dma";
> +        reg =3D <0x82a8 4>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges =3D <0 0x8100 0x1a4>;
> +        interrupt-parent =3D <&ipic>;

Drop interrupt-parent everywhere.

> +        interrupts =3D <71 8>;
> +        cell-index =3D <0>;
> +
> +        dma-channel@0 {
> +            compatible =3D "fsl,mpc8349-dma-channel", "fsl,elo-dma-chann=
el";
> +            reg =3D <0 0x80>;
> +            cell-index =3D <0>;
> +            interrupt-parent =3D <&ipic>;
> +            interrupts =3D <71 8>;
> +        };
> +
> +        dma-channel@80 {
> +            compatible =3D "fsl,mpc8349-dma-channel", "fsl,elo-dma-chann=
el";
> +            reg =3D <0x80 0x80>;
> +            cell-index =3D <1>;
> +            interrupt-parent =3D <&ipic>;
> +            interrupts =3D <71 8>;
> +        };
> +
> +        dma-channel@100 {
> +            compatible =3D "fsl,mpc8349-dma-channel", "fsl,elo-dma-chann=
el";
> +            reg =3D <0x100 0x80>;
> +            cell-index =3D <2>;
> +            interrupt-parent =3D <&ipic>;
> +            interrupts =3D <71 8>;
> +        };
> +
> +        dma-channel@180 {
> +            compatible =3D "fsl,mpc8349-dma-channel", "fsl,elo-dma-chann=
el";
> +            reg =3D <0x180 0x80>;
> +            cell-index =3D <3>;
> +            interrupt-parent =3D <&ipic>;
> +            interrupts =3D <71 8>;
> +        };
> +    };
> +
> +...

Similar comments on the others.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
