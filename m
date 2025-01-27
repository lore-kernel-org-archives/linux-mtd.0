Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98191C02190
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 04:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBjc2JZIPN2JSNSlobDskVOdsyingbpGBSQZ3J2oGE0=; b=QAHpAL/VuPhjuD
	9Ok1U5E7pYUfsnN5jto9W9fVVCKP+r1HpshLWdgGsm/nY+Ib2px8alvGjbWfqtgFLtAdj618xhEao
	ZTEFNWLIMcdfDMtImOt4YkQKeqb5VVuVoyKOfQJGhNXsGxLV/k3D/13p7/snUpMWTyXjIBFhfObnc
	7ifBMF5rkXwfYdDwMQcAI+e9qw3/KK1A3wpGZYTWEuchKGi0KZQVs6TX6/Sht48qppW8Dc+WHcP94
	EtQHopUsB+shSqapQe9ZPp8T+wMDTjJpzcBNy9Ak3j+KhdMcjMiC2FBQFv01ofCqLk61MH+2xtqIs
	eNBDkalVUlG6f55uqHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcGsp-00000001dWK-0Qd3;
	Mon, 27 Jan 2025 04:37:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcGsl-00000001dVz-30XU
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 04:37:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B21D65C01E4;
	Mon, 27 Jan 2025 04:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5ECC4CED2;
	Mon, 27 Jan 2025 04:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737952674;
	bh=F9bBtsJ1KzgqRgAbiENeTT+ePJ6pc5Uo5r/32gnqo28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJ9lfx76rD0U07xq8rbih+/wr60rWK8TxZPR5e+pLbFiBv03167ZPvDRf90EzUhyn
	 rNSLC5Hve6b+hN58lF98zDv5XLEfmRNDGBiYlfrwKLULuhCAqDMy3y4CwwbLTfVGz8
	 450Vqhn2L2E+dVj0xpa9Z0LrvRxrEaWO5eCaQ03lbRb9ug1YOsdxJZsG6y/KhNyTlX
	 msGBmtnecHgGa8SKyGigtvf8R/4DueQRCtuOa7jsKX7X9bAn81zX36GA+MCQcZnGyY
	 t0NbE55uvlNOCzRxbyp21R1kfT0TQsKY9kNnzeC9xpNZv4NgXScgNh6KMAbWiu5NBE
	 xpiBxfHM1Auvg==
Date: Sun, 26 Jan 2025 22:37:53 -0600
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
Subject: Re: [PATCH 2/9] dt-bindings: ata: Convert fsl,pq-sata binding to YAML
Message-ID: <20250127043753.GA3106458-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-2-50649f51c3dd@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250126-ppcyaml-v1-2-50649f51c3dd@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_203755_855132_B7E02C03 
X-CRM114-Status: GOOD (  19.23  )
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

On Sun, Jan 26, 2025 at 07:58:57PM +0100, J. Neusch=E4fer wrote:
> Convert the Freescale PowerQUICC SATA controller binding from text form
> to YAML. The list of compatible strings reflects current usage.
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/ata/fsl,pq-sata.yaml       | 59 ++++++++++++++++=
++++++
>  Documentation/devicetree/bindings/ata/fsl-sata.txt | 28 ----------
>  2 files changed, 59 insertions(+), 28 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml b/Doc=
umentation/devicetree/bindings/ata/fsl,pq-sata.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6af31ffbcad5e9cc83118a0bd=
8eaf45351a2823f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ata/fsl,pq-sata.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale 8xxx/3.0 Gb/s SATA nodes
> +
> +maintainers:
> +  - J. Neusch=E4fer <j.ne@posteo.net>
> +
> +description: |

Don't need '|'

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +  SATA nodes are defined to describe on-chip Serial ATA controllers.
> +  Each SATA port should have its own node.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8377-sata
> +              - fsl,mpc8536-sata
> +              - fsl,mpc8315-sata
> +              - fsl,mpc8379-sata
> +          - const: fsl,pq-sata
> +      - const: fsl,pq-sata-v2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3, 4]
> +    description: |
> +      1 for controller @ 0x18000
> +      2 for controller @ 0x19000
> +      3 for controller @ 0x1a000
> +      4 for controller @ 0x1b000
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - cell-index
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    sata@18000 {
> +        compatible =3D "fsl,mpc8379-sata", "fsl,pq-sata";
> +        reg =3D <0x18000 0x1000>;
> +        cell-index =3D <1>;
> +        interrupts =3D <44 IRQ_TYPE_LEVEL_LOW>;
> +        interrupt-parent =3D <&ipic>;
> +    };
> diff --git a/Documentation/devicetree/bindings/ata/fsl-sata.txt b/Documen=
tation/devicetree/bindings/ata/fsl-sata.txt
> deleted file mode 100644
> index fd63bb3becc9363c520a8fd06629fdc52c4d4299..0000000000000000000000000=
000000000000000
> --- a/Documentation/devicetree/bindings/ata/fsl-sata.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -* Freescale 8xxx/3.0 Gb/s SATA nodes
> -
> -SATA nodes are defined to describe on-chip Serial ATA controllers.
> -Each SATA port should have its own node.
> -
> -Required properties:
> -- compatible        : compatible list, contains 2 entries, first is
> -		 "fsl,CHIP-sata", where CHIP is the processor
> -		 (mpc8315, mpc8379, etc.) and the second is
> -		 "fsl,pq-sata"
> -- interrupts        : <interrupt mapping for SATA IRQ>
> -- cell-index        : controller index.
> -                          1 for controller @ 0x18000
> -                          2 for controller @ 0x19000
> -                          3 for controller @ 0x1a000
> -                          4 for controller @ 0x1b000
> -
> -Optional properties:
> -- reg               : <registers mapping>
> -
> -Example:
> -	sata@18000 {
> -		compatible =3D "fsl,mpc8379-sata", "fsl,pq-sata";
> -		reg =3D <0x18000 0x1000>;
> -		cell-index =3D <1>;
> -		interrupts =3D <2c 8>;
> -		interrupt-parent =3D < &ipic >;
> -	};
> =

> -- =

> 2.48.0.rc1.219.gb6b6757d772
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
