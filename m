Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99547C02190
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 04:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eXZQSrg9iD33ge/vADqg2nsOfQyrbT87dqvyk+x7gO0=; b=URG10iCz6q1i/p
	NorgyFIT7FuqclRusrJPvoP7K3YqkNKu3xDyCKMf7WvHYCugfibHX7cZ+f060CCvrqJ8ImCIXxKlf
	9wDoj2UAQDkPql/KH3gGAbaQflWZb5Uq1an3e4cliMisvHM6Lo7ZEnmOhxR49Rqipo+/f91egvJwo
	ryWkbfFSYZ08iA7t5OldFYuiH1HATq8wxPcuZMBL3M43TRC5kUBfnXvIYjWrpz/N5BY7qIokrvpqt
	qjm7diLYo/wPoJHJgebPyn2Wj3IV0gSMUoWiyXD8vU2bMhifdGDvHaweIl27G472M3zERQWmxQPZR
	LAVaYxUphN5sV3MxhaIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcH2E-00000001eYj-0DY8;
	Mon, 27 Jan 2025 04:47:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcH2A-00000001eXG-2Imq
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 04:47:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EDF1A403D5;
	Mon, 27 Jan 2025 04:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B37C4CED2;
	Mon, 27 Jan 2025 04:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737953257;
	bh=4jEpreMdOqSVobpv5nr5v8UoKZu1pgFXAImK+PlYJ/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLDGLEQCx8r2aEmuePy6OIimus9lYmMLRPucajM5lpal1zBL/l5fBoz4yE1UkMo6f
	 16A5FqWSdOC6dQP65QNmFbSvp9uGGqEynVyuddKUkk94Hw1SwlsHbHXn8iLzGr+eQz
	 iDozUBQvH/5SsZLU73X6UeavDc3Q6c2MmR+3YxoB1CK1PsY+JLiHqDooY2fdpGocpA
	 jxii+k1H+qq+qLAWLIUpm6Mt2F+y8UbJ3H/2JB2FFLy3JwGoad8VKgFXNzjBumqKMw
	 ZaCGr/DpMuIR28JX7NsV6jBU+4DH3H9lySeSZ4RizTNHpcI8F7LJ96y1xBMDAMbhDg
	 BSSd0w0uiZ+xw==
Date: Sun, 26 Jan 2025 22:47:35 -0600
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
Subject: Re: [PATCH 5/9] dt-bindings: dma: Convert fsl,elo*-dma bindings to
 YAML
Message-ID: <20250127044735.GD3106458-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_204738_731939_74A7CBEC 
X-CRM114-Status: GOOD (  27.03  )
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

On Sun, Jan 26, 2025 at 07:59:00PM +0100, J. Neusch=E4fer wrote:
> The devicetree bindings for Freescale DMA engines have so far existed as
> a text file. This patch converts them to YAML, and specifies all the
> compatible strings currently in use in arch/powerpc/boot/dts.
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 129 +++++++++++++
>  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 105 +++++++++++
>  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 120 ++++++++++++
>  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------=
------
>  4 files changed, 354 insertions(+), 204 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml b/Doc=
umentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d1f4978a672c1217c322c27f2=
43470b2de8c99d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> @@ -0,0 +1,129 @@
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
> +description: |
> +  This is a little-endian 4-channel DMA controller, used in Freescale mp=
c83xx
> +  series chips such as mpc8315, mpc8349, mpc8379 etc.
> +
> +  Note on DMA channel compatible properties: The compatible property mus=
t say
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel" to be used by the E=
lo DMA
> +  driver (fsldma).  Any DMA channel used by fsldma cannot be used by ano=
ther
> +  DMA driver, such as the SSI sound drivers for the MPC8610.  Therefore,=
 any
> +  DMA channel that should be used for another driver should not use
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel".  For the SSI drive=
rs, for
> +  example, the compatible property should be "fsl,ssi-dma-channel".  See
> +  ssi.txt for more information.
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
> +  ranges: true
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller index. 0 for controller @ 0x8100.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^dma-channel@.*$":
> +    type: object

       additionalProperties: false

(The tools should have highlighted this)

> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - fsl,mpc8315-dma-channel
> +              - fsl,mpc8323-dma-channel
> +              - fsl,mpc8347-dma-channel
> +              - fsl,mpc8349-dma-channel
> +              - fsl,mpc8360-dma-channel
> +              - fsl,mpc8377-dma-channel
> +              - fsl,mpc8378-dma-channel
> +              - fsl,mpc8379-dma-channel
> +          - const: fsl,elo-dma-channel
> +
> +      reg:
> +        maxItems: 1
> +
> +      cell-index:
> +        description: DMA channel index starts at 0.
> +
> +      interrupts: true

You have to define how many interrupts and what they are.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    dma@82a8 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        compatible =3D "fsl,mpc8349-dma", "fsl,elo-dma";
> +        reg =3D <0x82a8 4>;
> +        ranges =3D <0 0x8100 0x1a4>;
> +        interrupt-parent =3D <&ipic>;
> +        interrupts =3D <71 8>;
> +        cell-index =3D <0>;
> +        dma-channel@0 {
> +            compatible =3D "fsl,mpc8349-dma-channel", "fsl,elo-dma-chann=
el";
> +            cell-index =3D <0>;
> +            reg =3D <0 0x80>;
> +            interrupt-parent =3D <&ipic>;
> +            interrupts =3D <71 8>;
> +        };
> +        dma-channel@80 {
> +            compatible =3D "fsl,mpc8349-dma-channel", "fsl,elo-dma-chann=
el";
> +            cell-index =3D <1>;
> +            reg =3D <0x80 0x80>;
> +            interrupt-parent =3D <&ipic>;
> +            interrupts =3D <71 8>;
> +        };
> +        dma-channel@100 {
> +            compatible =3D "fsl,mpc8349-dma-channel", "fsl,elo-dma-chann=
el";
> +            cell-index =3D <2>;
> +            reg =3D <0x100 0x80>;
> +            interrupt-parent =3D <&ipic>;
> +            interrupts =3D <71 8>;
> +        };
> +        dma-channel@180 {
> +            compatible =3D "fsl,mpc8349-dma-channel", "fsl,elo-dma-chann=
el";
> +            cell-index =3D <3>;
> +            reg =3D <0x180 0x80>;
> +            interrupt-parent =3D <&ipic>;
> +            interrupts =3D <71 8>;
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/dma/fsl,elo3-dma.yaml b/Do=
cumentation/devicetree/bindings/dma/fsl,elo3-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d4853ffd40dc75c7fcdc0dfb1=
5e497ec56f3e1ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,elo3-dma.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Elo3 DMA Controller
> +
> +maintainers:
> +  - J. Neusch=E4fer <j.ne@posteo.net>
> +
> +description: |
> +  DMA controller which has same function as EloPlus except that Elo3 has=
 8
> +  channels while EloPlus has only 4, it is used in Freescale Txxx and Bx=
xx
> +  series chips, such as t1040, t4240, b4860.
> +
> +  Note on DMA channel compatible properties: The compatible property mus=
t say
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel" to be used by the E=
lo DMA
> +  driver (fsldma).  Any DMA channel used by fsldma cannot be used by ano=
ther
> +  DMA driver, such as the SSI sound drivers for the MPC8610.  Therefore,=
 any DMA
> +  channel that should be used for another driver should not use
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel".  For the SSI drive=
rs, for
> +  example, the compatible property should be "fsl,ssi-dma-channel".  See=
 ssi.txt
> +  for more information.
> +
> +properties:
> +  compatible:
> +    const: fsl,elo3-dma
> +
> +  reg:
> +    maxItems: 2
> +    description: |
> +      contains two entries for DMA General Status Registers, i.e. DGSR0 =
which
> +      includes status for channel 1~4, and DGSR1 for channel 5~8
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^dma-channel@.*$":
> +    type: object

       additionalProperties: false

> +
> +    properties:
> +      compatible:
> +        const: fsl,eloplus-dma-channel
> +
> +      reg:
> +        maxItems: 1
> +
> +      interrupts: true

You have to define how many interrupts.

> +
> +examples:
> +  - |
> +    dma@100300 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        compatible =3D "fsl,elo3-dma";
> +        reg =3D <0x100300 0x4>,
> +              <0x100600 0x4>;
> +        ranges =3D <0x0 0x100100 0x500>;
> +        dma-channel@0 {
> +            compatible =3D "fsl,eloplus-dma-channel";
> +            reg =3D <0x0 0x80>;
> +            interrupts =3D <28 2 0 0>;
> +        };
> +        dma-channel@80 {
> +            compatible =3D "fsl,eloplus-dma-channel";
> +            reg =3D <0x80 0x80>;
> +            interrupts =3D <29 2 0 0>;
> +        };
> +        dma-channel@100 {
> +            compatible =3D "fsl,eloplus-dma-channel";
> +            reg =3D <0x100 0x80>;
> +            interrupts =3D <30 2 0 0>;
> +        };
> +        dma-channel@180 {
> +            compatible =3D "fsl,eloplus-dma-channel";
> +            reg =3D <0x180 0x80>;
> +            interrupts =3D <31 2 0 0>;
> +        };
> +        dma-channel@300 {
> +            compatible =3D "fsl,eloplus-dma-channel";
> +            reg =3D <0x300 0x80>;
> +            interrupts =3D <76 2 0 0>;
> +        };
> +        dma-channel@380 {
> +            compatible =3D "fsl,eloplus-dma-channel";
> +            reg =3D <0x380 0x80>;
> +            interrupts =3D <77 2 0 0>;
> +        };
> +        dma-channel@400 {
> +            compatible =3D "fsl,eloplus-dma-channel";
> +            reg =3D <0x400 0x80>;
> +            interrupts =3D <78 2 0 0>;
> +        };
> +        dma-channel@480 {
> +            compatible =3D "fsl,eloplus-dma-channel";
> +            reg =3D <0x480 0x80>;
> +            interrupts =3D <79 2 0 0>;
> +        };
> +    };
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml b=
/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..680d64332ddf4d6d68ee8c607=
ac71211a7e19e6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,eloplus-dma.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale EloPlus DMA Controller
> +
> +maintainers:
> +  - J. Neusch=E4fer <j.ne@posteo.net>
> +
> +description: |
> +  This is a 4-channel DMA controller with extended addresses and chainin=
g,
> +  mainly used in Freescale mpc85xx/86xx, Pxxx and BSC series chips, such=
 as
> +  mpc8540, mpc8641 p4080, bsc9131 etc.
> +
> +  Note on DMA channel compatible properties: The compatible property mus=
t say
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel" to be used by the E=
lo DMA
> +  driver (fsldma).  Any DMA channel used by fsldma cannot be used by ano=
ther
> +  DMA driver, such as the SSI sound drivers for the MPC8610.  Therefore,=
 any DMA
> +  channel that should be used for another driver should not use
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel".  For the SSI drive=
rs, for
> +  example, the compatible property should be "fsl,ssi-dma-channel".  See=
 ssi.txt
> +  for more information.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8540-dma
> +              - fsl,mpc8541-dma
> +              - fsl,mpc8548-dma
> +              - fsl,mpc8555-dma
> +              - fsl,mpc8560-dma
> +              - fsl,mpc8572-dma
> +              - fsl,mpc8641-dma
> +          - const: fsl,eloplus-dma
> +      - const: fsl,eloplus-dma
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      DMA General Status Register, i.e. DGSR which contains
> +      status for all the 4 DMA channels
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      controller index.  0 for controller @ 0x21000, 1 for controller @ =
0xc000
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^dma-channel@.*$":
> +    type: object

       additionalProperties: false

> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - fsl,mpc8540-dma-channel
> +              - fsl,mpc8541-dma-channel
> +              - fsl,mpc8548-dma-channel
> +              - fsl,mpc8555-dma-channel
> +              - fsl,mpc8560-dma-channel
> +              - fsl,mpc8572-dma-channel
> +          - const: fsl,eloplus-dma-channel
> +
> +      reg:
> +        maxItems: 1
> +
> +      cell-index:
> +        description: DMA channel index starts at 0.
> +
> +      interrupts: true

How many?

> +
> +examples:
> +  - |
> +    dma@21300 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        compatible =3D "fsl,mpc8540-dma", "fsl,eloplus-dma";
> +        reg =3D <0x21300 4>;
> +        ranges =3D <0 0x21100 0x200>;
> +        cell-index =3D <0>;
> +        dma-channel@0 {
> +            compatible =3D "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-c=
hannel";
> +            reg =3D <0 0x80>;
> +            cell-index =3D <0>;
> +            interrupt-parent =3D <&mpic>;
> +            interrupts =3D <20 2>;
> +        };
> +        dma-channel@80 {
> +            compatible =3D "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-c=
hannel";
> +            reg =3D <0x80 0x80>;
> +            cell-index =3D <1>;
> +            interrupt-parent =3D <&mpic>;
> +            interrupts =3D <21 2>;
> +        };
> +        dma-channel@100 {
> +            compatible =3D "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-c=
hannel";
> +            reg =3D <0x100 0x80>;
> +            cell-index =3D <2>;
> +            interrupt-parent =3D <&mpic>;
> +            interrupts =3D <22 2>;
> +        };
> +        dma-channel@180 {
> +            compatible =3D "fsl,mpc8540-dma-channel", "fsl,eloplus-dma-c=
hannel";
> +            reg =3D <0x180 0x80>;
> +            cell-index =3D <3>;
> +            interrupt-parent =3D <&mpic>;
> +            interrupts =3D <23 2>;
> +        };
> +    };
> +
> +additionalProperties: true
> +
> +...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
