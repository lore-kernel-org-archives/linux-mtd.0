Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B905EC021A4
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 19:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rlq+NVsmJpndKuQKDPMyUZ6FZbKHGP6LTpJZp6q/vTQ=; b=bxL8je1Jj8Cz8M
	ILys6EkKuJ4I0gSLrLVmakkoEcFzMKWDUp0Uf9AgsYH/VOs9/6SY0SR7mSjopWQSqeuWK0HrKt0ag
	LyG9qTAXbbX8iOHjTS/QCAzV5H4BsgnfLlYVBrUAJ/K9NneneT/zL96lqiLHxKPtSd4UgORDsXgWp
	Drv8C9GaUUVRCCGTFpW36XqYtnTSUNdbSxU2A+3rSYmZ1eVxx6g383myX+g8K5g3mnXgagIJm+F9j
	rq4m1lSEc5oTnx/2uuft2/a8ylXbOzYnZdVLqyhMLylNxfhIYOZIM6u1CauFVXdDsVQy8S3B2tR6B
	eYU9c2yt3lXGM2Cv3cRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIeG-00000008fvx-3B7H;
	Wed, 12 Feb 2025 19:43:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIeE-00000008fvW-32an
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 19:43:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1179A419C9;
	Wed, 12 Feb 2025 19:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EEFC4CEDF;
	Wed, 12 Feb 2025 19:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739389428;
	bh=J53gut3FCEvv7QNmL9a0iiaxDFCqQSjC2O6Ihu/AJ84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l3nluVDjmkhujiS09PDYmKWR8ZpL1NvZ673ie95nbqovNihUcry7wp4RhxDaIcW4C
	 WzALgu8RqrEf8AEKXJa1NQN36127tWGpqtfMt+ceF8qkKxFUatwJV8mWOCXDA7c8U6
	 5c6mvpzQn7EtvSK26FGhsTxvo9nA5pW5qx8gSDuBJ7zl/wl5WF+1A0qzlo/GtstEyq
	 UpvxdrPQwjDAE3IeNXfcspWaobaAE2jMqkTwrZPDdD8R5k2k0xPPuMTtHZRy6guNwr
	 J6A5CGOXSwgZePq4BouABSV8KVXF9QiPXKh5Adk1Oyuh6/Hd8f5WNo1Hpr1RY3Eam1
	 dqgSlb5voTSKg==
Date: Wed, 12 Feb 2025 13:43:47 -0600
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
Subject: Re: [PATCH v2 08/12] dt-bindings: spi: Convert Freescale SPI
 bindings to YAML
Message-ID: <20250212194347.GA119448-robh@kernel.org>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-8-8137b0c42526@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250207-ppcyaml-v2-8-8137b0c42526@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_114350_893598_6B9B2B2E 
X-CRM114-Status: GOOD (  17.78  )
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

On Fri, Feb 07, 2025 at 10:30:25PM +0100, J. Neusch=E4fer wrote:
> fsl-spi.txt contains the bindings for the fsl,spi and fsl,espi
> contollers. Convert them to YAML.
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
> =

> V2:
> - add missing end-of-document ("...") markers
> - add missing constraints to interrupts, fsl,espi-num-chipselects,
>   fsl,csbef and fsl,csaft properties
> - remove unnecessary type from clock-frequency property
> - fix property order to comply with dts coding style
> ---
>  .../devicetree/bindings/spi/fsl,espi.yaml          | 64 ++++++++++++++++=
+++
>  Documentation/devicetree/bindings/spi/fsl,spi.yaml | 73 ++++++++++++++++=
++++++
>  Documentation/devicetree/bindings/spi/fsl-spi.txt  | 62 ----------------=
--
>  3 files changed, 137 insertions(+), 62 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/spi/fsl,espi.yaml b/Docume=
ntation/devicetree/bindings/spi/fsl,espi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c504b7957dde39086ef7d7a75=
50d6169cf5ec407
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/fsl,espi.yaml
> @@ -0,0 +1,64 @@
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
> +  interrupts:
> +    maxItems: 1
> +
> +  fsl,espi-num-chipselects:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 1, 4 ]
> +    description: The number of the chipselect signals.
> +
> +  fsl,csbef:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description: Chip select assertion time in bits before frame starts
> +
> +  fsl,csaft:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description: Chip select negation time in bits after frame ends
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
> +        compatible =3D "fsl,mpc8536-espi";
> +        reg =3D <0x110000 0x1000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        interrupts =3D <53 0x2>;
> +        interrupt-parent =3D <&mpic>;

Drop interrupt-parent. Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +        fsl,espi-num-chipselects =3D <4>;
> +        fsl,csbef =3D <1>;
> +        fsl,csaft =3D <1>;
> +    };
> +
> +...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
