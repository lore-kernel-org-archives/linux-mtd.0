Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142C4C02190
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 05:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsTIL3rPes8KbYK0F7S6Z2a79XodhzLE7At8HCvK9Ls=; b=Hz7FJOdZK23WwS
	qxYnDWHLi979rul0USkgOfY38QUmFyZzktYaHqoZXS40zLg078Ww2ng/byBv092KI2Rff2pCDBzOx
	5k8R2T6ArEQPO92NThcwmLxI6stgZtlkCDWK/Pj309oPw8WUzwrBAqWUPAQ5DxCGOhfbsCbqi6GUy
	+UkwUpjCWAg+Xw8YcX1R6SGhOf2xExVCmh37Fhd7DIMAXWigz2s5wCite62fnOQDKt20GdlUgLsvT
	wwbVZFoYw7nP4EH2oXI/mZxUOET9eQCrTs7qKR3gmf/gh9lODTsXf0C3SbcUJBLpTcpKyY0dX/wLZ
	efCqjtBdNL0IzAjfAVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcHMw-00000001fYf-2tDh;
	Mon, 27 Jan 2025 05:09:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcHMu-00000001fYL-1yP2
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 05:09:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4BA01A40473;
	Mon, 27 Jan 2025 05:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1EBCC4CED2;
	Mon, 27 Jan 2025 05:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737954543;
	bh=SRnaJ7NOhy1yqtMSuRpVYvCRnbZCyG9ICmKcrEhZu1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dCXssLii/zSRuNLuQUKKGyPENsQBo8Sn5CnYY3O3FxYVAjvruFGyZ57EqKUguv/ra
	 S1h9azhs45cKCSaEPcpsFRa1xKUdQaiOE1O3mn5BZdEeVFQfTlDF7bD3TDraPrBc+3
	 nPr1oEW2dfuaWfsgk5bejmSntOo7SnDsTmo+1COoCYTPp06T7kKbcFbJdDA8zzvyNe
	 x/H0vNeh34Ov9EMHHnfnz+3OUzplGfUJFvMSQcKI5nvKJbwxbMBt6ha/ffzx8jCdb9
	 hCqZ+eanBhx2pBGe+B8aQ+DqKIv74Gk+cWfnDnM6BJFAzTM3tPgAH3xzHh4Ww7eGxN
	 yKnd77AdR7MFA==
Date: Sun, 26 Jan 2025 23:09:01 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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
Subject: Re: [PATCH 8/9] dt-bindings: spi: Convert Freescale SPI bindings to
 YAML
Message-ID: <20250127050901.GB3127337-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-8-50649f51c3dd@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250126-ppcyaml-v1-8-50649f51c3dd@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_210904_640601_992F1F2D 
X-CRM114-Status: GOOD (  18.39  )
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

On Sun, Jan 26, 2025 at 07:59:03PM +0100, J. Neusch=E4fer wrote:
> fsl-spi.txt contains the bindings for the fsl,spi and fsl,espi
> contollers. Convert them to YAML.
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/spi/fsl,espi.yaml          | 56 +++++++++++++++++
>  Documentation/devicetree/bindings/spi/fsl,spi.yaml | 71 ++++++++++++++++=
++++++
>  Documentation/devicetree/bindings/spi/fsl-spi.txt  | 62 ----------------=
---
>  3 files changed, 127 insertions(+), 62 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/spi/fsl,espi.yaml b/Docume=
ntation/devicetree/bindings/spi/fsl,espi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..350275760210c5763af0c7b1e=
1522ccbfb97eec7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/fsl,espi.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/fsl,espi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale eSPI (Enhanced Serial Peripheral Interface) controller
> +
> +maintainers:
> +  - J. Neusch=E4fer <j.ne@posteo.net>
> +
> +properties:
> +  compatible:
> +    const: fsl,mpc8536-espi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts: true

How many?

> +
> +  fsl,espi-num-chipselects:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The number of the chipselect signals.

Constraints?

> +
> +  fsl,csbef:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Chip select assertion time in bits before frame starts

Constraints?

> +
> +  fsl,csaft:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Chip select negation time in bits after frame ends

Constraints?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - fsl,espi-num-chipselects
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi@110000 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        compatible =3D "fsl,mpc8536-espi";
> +        reg =3D <0x110000 0x1000>;
> +        interrupts =3D <53 0x2>;
> +        interrupt-parent =3D <&mpic>;
> +        fsl,espi-num-chipselects =3D <4>;
> +        fsl,csbef =3D <1>;
> +        fsl,csaft =3D <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi.yaml b/Documen=
tation/devicetree/bindings/spi/fsl,spi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8efa971b5954a93665cb62434=
5774f2966bb5648
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/fsl,spi.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/fsl,spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale SPI (Serial Peripheral Interface) controller
> +
> +maintainers:
> +  - J. Neusch=E4fer <j.ne@posteo.net>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,spi
> +      - aeroflexgaisler,spictrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      QE SPI subblock index.
> +      0: QE subblock SPI1
> +      1: QE subblock SPI2
> +
> +  mode:
> +    description: SPI operation mode
> +    enum:
> +      - cpu
> +      - cpu-qe
> +
> +  interrupts: true
> +
> +  clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Don't need a type.

> +    description: input clock frequency to non FSL_SOC cores
> +
> +  cs-gpios: true
> +
> +  fsl,spisel_boot:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      For the MPC8306 and MPC8309, specifies that the SPISEL_BOOT signal=
 is used
> +      as chip select for a slave device. Use reg =3D <number of gpios> i=
n the
> +      corresponding child node, i.e. 0 if the cs-gpios property is not p=
resent.
> +
> +required:
> +  - compatible
> +  - reg
> +  - mode
> +  - interrupts
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi@4c0 {
> +        cell-index =3D <0>;
> +        compatible =3D "fsl,spi";
> +        reg =3D <0x4c0 0x40>;
> +        interrupts =3D <82 0>;
> +        interrupt-parent =3D <&intc>;
> +        mode =3D "cpu";
> +        cs-gpios =3D <&gpio 18 1          // device reg=3D<0>
> +                    &gpio 19 1>;        // device reg=3D<1>
> +    };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
