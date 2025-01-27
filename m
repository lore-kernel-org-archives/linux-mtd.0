Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B1EC02190
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 04:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXi1Vkjb6yVRy+x692C2MI7r8ijLhf2YEyOSYwu3z7s=; b=CrgpWHfyqmCl1A
	wPHD2sJToUnrPZ3fKHO4CuTHXxMgM9QaWAHw9HHKNTpZuBGFmeo63LHXzXC2D9A2oDRWmn3Mk+GjY
	u59HfA1L5U6Y9M75c7CUtWOgYOMaH6PDKLKy1yIg7IXH/359jOl0eL0JXfDi9hgU2MJmWjtrg+ouZ
	gXEgesWw81YUoaYN84Ht/3CfmbNdcQqlczP5cKhE5Dnqp8gfM61TVzTLYeGGj437wFnc/rVZJV+fe
	lfGQcpbh1DTRyfW6Hh7FTVnf25jp5+D0a8yYKG8k4NMQV9OZeSwfMcfBzTcTe9zvevJSYTlKOAiWp
	gXTsO4ht3WrpwB/JONhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcH4c-00000001el0-39Yj;
	Mon, 27 Jan 2025 04:50:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcH4Z-00000001eke-2B6F
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 04:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33629A400E8;
	Mon, 27 Jan 2025 04:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF808C4CED2;
	Mon, 27 Jan 2025 04:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737953405;
	bh=2rLaEDPfSm/lD1nBxwCCwk3Yv0BG6rIKmqNgHO3hz5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PWYqiZrY+ksbAukgBdboA4rOwSDA7l9d0vK5NMllSgNphdmB4L8Ft8u3pveYKT9mj
	 tWDtm2DwGmqOrTEVyUtSMBVneEU+O8mOz+phBh9ynODjnHUUEuOtnEpZg5oWWNsDx8
	 KD+mru9ihYDAqIbMWA6/6mLuAQMyVafqABUL8Mrpmljgisn40M2gHd2eeIMltsVq0Y
	 IYzCI+YRYSyWQ8ANrG2oM9vcjCYR4VdIx7b+UMAB0tUvIbEqx6iDYFdWrn5+WyOdmk
	 O5CzfmfhSy94avSidgCA1x2o1IDX7bGQlVZZiaI23jXiF+cvyVh/6MdCVgsl2W64t1
	 d+tntyEwJohSQ==
Date: Sun, 26 Jan 2025 22:50:04 -0600
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
Subject: Re: [PATCH 6/9] dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
Message-ID: <20250127045004.GE3106458-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_205007_700982_60C0C51C 
X-CRM114-Status: GOOD (  17.55  )
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

On Sun, Jan 26, 2025 at 07:59:01PM +0100, J. Neusch=E4fer wrote:
> Supplement Documentation/devicetree/bindings/pci/fsl,pci.txt with a more
> formal binding in YAML format.
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml   | 83 ++++++++++++++++=
++++++
>  1 file changed, 83 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml b=
/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..12e86a9c20dfe2362d11f085b=
d9ae47238c4a37f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MPC83xx PCI/PCI-X/PCIe controllers
> +
> +description: |
> +  Binding for the PCI/PCI-X/PCIe host bridges on MPC8xxx SoCs.
> +  See also: Documentation/devicetree/bindings/pci/fsl,pci.txt

Can you move that information here.

> +
> +maintainers:
> +  - J. Neusch=E4fer <j.neuschaefer@gmx.net>
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8308-pcie
> +              - fsl,mpc8315-pcie
> +              - fsl,mpc8377-pcie
> +              - fsl,mpc8378-pcie
> +          - const: fsl,mpc8314-pcie
> +      - const: fsl,mpc8314-pcie
> +      - items:
> +          - const: fsl,mpc8360-pci
> +          - const: fsl,mpc8349-pci
> +      - const: fsl,mpc8349-pci
> +      - items:
> +          - const: fsl,mpc8540-pcix
> +          - const: fsl,mpc8540-pci
> +      - const: fsl,mpc8540-pci
> +      - items:
> +          - const: fsl,mpc8540-pcix
> +          - const: fsl,mpc8540-pci
> +      - const: fsl,mpc8548-pcie
> +      - const: fsl,mpc8548-pcie
> +      - const: fsl,mpc8641-pcie

Move all the single 'const' to 1 enum entry.

> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: internal registers
> +      - description: config space access registers
> +
> +  clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Don't need a type for this.

> +
> +required:
> +  - reg
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pci1: pcie@e0009000 {
> +        #address-cells =3D <3>;
> +        #size-cells =3D <2>;
> +        #interrupt-cells =3D <1>;
> +        device_type =3D "pci";
> +        compatible =3D "fsl,mpc8315-pcie", "fsl,mpc8314-pcie";
> +        reg =3D <0xe0009000 0x00001000>;
> +        ranges =3D <0x02000000 0 0xa0000000 0xa0000000 0 0x10000000
> +                  0x01000000 0 0x00000000 0xb1000000 0 0x00800000>;
> +        bus-range =3D <0 255>;
> +        interrupt-map-mask =3D <0xf800 0 0 7>;
> +        interrupt-map =3D <0 0 0 1 &ipic 1 IRQ_TYPE_LEVEL_LOW
> +                         0 0 0 2 &ipic 1 IRQ_TYPE_LEVEL_LOW
> +                         0 0 0 3 &ipic 1 IRQ_TYPE_LEVEL_LOW
> +                         0 0 0 4 &ipic 1 IRQ_TYPE_LEVEL_LOW>;
> +        clock-frequency =3D <0>;
> +    };
> +
> +...
> =

> -- =

> 2.48.0.rc1.219.gb6b6757d772
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
