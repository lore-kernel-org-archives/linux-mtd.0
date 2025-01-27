Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52540C02190
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 04:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtCmUP7lypCGZ0YPsWhD0bsbI1kWkv94a56zhxSAK90=; b=pCe73GapwysvPC
	s++9AY35BCIJ+MJLXqkjmZbaLm5EnXbDpqwcAFBtXCOwXSNx7Ep5ShFMoQPy1u7RtDv0N6yMkbW5o
	875GUuX+9Ey3lLVvHWtOZ4EeTWHLVYjolGpROKaqCY06AxDHNjVdPMUd4A40yfcMLQBYTX0ZnVG90
	VfGZJ/+AA/kbQ91fNmCQHXJkdWN5nmkLN6HrLB5p45onMS6cW8GEWeKn9mgunBIZbVal1YScK8jQG
	LUl30n/lx2yMYTcnHHWENZ8hlOVMl1jXcJznqnebrOxt8JuwdQWg73VavcF8s+1Mzyl+RYDQVPHXa
	NORgSCd2R3HtGuM+xd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcGwH-00000001dkm-3aNv;
	Mon, 27 Jan 2025 04:41:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcGwF-00000001dkQ-12YP
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 04:41:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A09D45C2953;
	Mon, 27 Jan 2025 04:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34971C4CED2;
	Mon, 27 Jan 2025 04:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737952889;
	bh=TJLe4DNAGbVSG/1gbOrX3l9JsT0UDft2vaS9TWA7RVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/fi1Mi5Hd8yfuhdgfwsmXpv6HOOJa7czobvfXBf7zbCtn1JOf6VEhp3SolzSBBjd
	 OsRA7WKEapv+TJW8f614Fo1mxhahSRJTtjFRGqSNm9iZ07t4TGjxQZFr5CI3V5AiiW
	 TgThQ1a+WE7xzXEagL+PKuBTojMyfxJvQPZlN4FTBPpBN3K3YqtpxQMH1wOLQzmj4o
	 MsR104p6ZAttj6bY/Oc5g/gzfOoL0qPAXRCJGrzpG8QyhlkfiR7wbucj74eSlFwOac
	 bQ7Xg/S+vACRZfpNuNy78AVL+lsg9WH3xAH75ymPpiDGbdYrLkLnOJ/SRpDk+PHKn3
	 /s4fzmLpIDmPg==
Date: Sun, 26 Jan 2025 22:41:28 -0600
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
Subject: Re: [PATCH 3/9] dt-bindings: crypto: Convert fsl,sec-2.0 binding to
 YAML
Message-ID: <20250127044128.GB3106458-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-3-50649f51c3dd@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250126-ppcyaml-v1-3-50649f51c3dd@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_204131_387100_567337F3 
X-CRM114-Status: GOOD (  25.27  )
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

On Sun, Jan 26, 2025 at 07:58:58PM +0100, J. Neusch=E4fer wrote:
> Convert the Freescale security engine (crypto accelerator) binding from
> text form to YAML. The list of compatible strings reflects what was
> previously described in prose; not all combinations occur in existing
> devicetrees.
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/crypto/fsl,sec2.0.yaml     | 139 +++++++++++++++=
++++++
>  .../devicetree/bindings/crypto/fsl-sec2.txt        |  65 ----------
>  2 files changed, 139 insertions(+), 65 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml b/D=
ocumentation/devicetree/bindings/crypto/fsl,sec2.0.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..5ae593e60987e175413c3a082=
c9466f09f642bc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml
> @@ -0,0 +1,139 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
> +
> +maintainers:
> +  - J. Neusch=E4fer <j.ne@posteo.net.
> +
> +properties:
> +  compatible:
> +    description: |

Don't need '|'. I imagine there are more in the series, but will let you =

find the rest.

> +      Should contain entries for this and backward compatible SEC versio=
ns,
> +      high to low. Warning: SEC1 and SEC2 are mutually exclusive.
> +    oneOf:
> +      - items:
> +          - const: fsl,sec3.3
> +          - const: fsl,sec3.1
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec3.1
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec1.2
> +          - const: fsl,sec1.0
> +      - items:
> +          - const: fsl,sec1.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  fsl,num-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: An integer representing the number of channels availabl=
e.

minimum: 1
maximum: ?

> +
> +  fsl,channel-fifo-len:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      An integer representing the number of descriptor pointers each cha=
nnel
> +      fetch fifo can hold.

Constraints?

> +
> +  fsl,exec-units-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The bitmask representing what execution units (EUs) are available.
> +      EU information should be encoded following the SEC's Descriptor He=
ader
> +      Dword EU_SEL0 field documentation, i.e. as follows:
> +
> +        bit 0  =3D reserved - should be 0
> +        bit 1  =3D set if SEC has the ARC4 EU (AFEU)
> +        bit 2  =3D set if SEC has the DES/3DES EU (DEU)
> +        bit 3  =3D set if SEC has the message digest EU (MDEU/MDEU-A)
> +        bit 4  =3D set if SEC has the random number generator EU (RNG)
> +        bit 5  =3D set if SEC has the public key EU (PKEU)
> +        bit 6  =3D set if SEC has the AES EU (AESU)
> +        bit 7  =3D set if SEC has the Kasumi EU (KEU)
> +        bit 8  =3D set if SEC has the CRC EU (CRCU)
> +        bit 11 =3D set if SEC has the message digest EU extended alg set=
 (MDEU-B)
> +
> +      remaining bits are reserved for future SEC EUs.

So:

maximum: 0xfff

> +
> +  fsl,descriptor-types-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The bitmask representing what descriptors are available. Descripto=
r type
> +      information should be encoded following the SEC's Descriptor Heade=
r Dword
> +      DESC_TYPE field documentation, i.e. as follows:
> +
> +        bit 0  =3D set if SEC supports the aesu_ctr_nonsnoop desc. type
> +        bit 1  =3D set if SEC supports the ipsec_esp descriptor type
> +        bit 2  =3D set if SEC supports the common_nonsnoop desc. type
> +        bit 3  =3D set if SEC supports the 802.11i AES ccmp desc. type
> +        bit 4  =3D set if SEC supports the hmac_snoop_no_afeu desc. type
> +        bit 5  =3D set if SEC supports the srtp descriptor type
> +        bit 6  =3D set if SEC supports the non_hmac_snoop_no_afeu desc.t=
ype
> +        bit 7  =3D set if SEC supports the pkeu_assemble descriptor type
> +        bit 8  =3D set if SEC supports the aesu_key_expand_output desc.t=
ype
> +        bit 9  =3D set if SEC supports the pkeu_ptmul descriptor type
> +        bit 10 =3D set if SEC supports the common_nonsnoop_afeu desc. ty=
pe
> +        bit 11 =3D set if SEC supports the pkeu_ptadd_dbl descriptor type
> +
> +      ..and so on and so forth.
> +
> +required:
> +  - compatible
> +  - reg
> +  - fsl,num-channels
> +  - fsl,channel-fifo-len
> +  - fsl,exec-units-mask
> +  - fsl,descriptor-types-mask
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    /* MPC8548E */
> +    crypto@30000 {
> +        compatible =3D "fsl,sec2.1", "fsl,sec2.0";
> +        reg =3D <0x30000 0x10000>;
> +        interrupts =3D <29 2>;
> +        interrupt-parent =3D <&mpic>;
> +        fsl,num-channels =3D <4>;
> +        fsl,channel-fifo-len =3D <24>;
> +        fsl,exec-units-mask =3D <0xfe>;
> +        fsl,descriptor-types-mask =3D <0x12b0ebf>;
> +    };
> diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec2.txt b/Docu=
mentation/devicetree/bindings/crypto/fsl-sec2.txt
> deleted file mode 100644
> index 125f155d00d052eec7d5093b5c5076cbe720417f..0000000000000000000000000=
000000000000000
> --- a/Documentation/devicetree/bindings/crypto/fsl-sec2.txt
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
> -
> -Required properties:
> -
> -- compatible : Should contain entries for this and backward compatible
> -  SEC versions, high to low, e.g., "fsl,sec2.1", "fsl,sec2.0" (SEC2/3)
> -                             e.g., "fsl,sec1.2", "fsl,sec1.0" (SEC1)
> -    warning: SEC1 and SEC2 are mutually exclusive
> -- reg : Offset and length of the register set for the device
> -- interrupts : the SEC's interrupt number
> -- fsl,num-channels : An integer representing the number of channels
> -  available.
> -- fsl,channel-fifo-len : An integer representing the number of
> -  descriptor pointers each channel fetch fifo can hold.
> -- fsl,exec-units-mask : The bitmask representing what execution units
> -  (EUs) are available. It's a single 32-bit cell. EU information
> -  should be encoded following the SEC's Descriptor Header Dword
> -  EU_SEL0 field documentation, i.e. as follows:
> -
> -	bit 0  =3D reserved - should be 0
> -	bit 1  =3D set if SEC has the ARC4 EU (AFEU)
> -	bit 2  =3D set if SEC has the DES/3DES EU (DEU)
> -	bit 3  =3D set if SEC has the message digest EU (MDEU/MDEU-A)
> -	bit 4  =3D set if SEC has the random number generator EU (RNG)
> -	bit 5  =3D set if SEC has the public key EU (PKEU)
> -	bit 6  =3D set if SEC has the AES EU (AESU)
> -	bit 7  =3D set if SEC has the Kasumi EU (KEU)
> -	bit 8  =3D set if SEC has the CRC EU (CRCU)
> -	bit 11 =3D set if SEC has the message digest EU extended alg set (MDEU-=
B)
> -
> -remaining bits are reserved for future SEC EUs.
> -
> -- fsl,descriptor-types-mask : The bitmask representing what descriptors
> -  are available. It's a single 32-bit cell. Descriptor type information
> -  should be encoded following the SEC's Descriptor Header Dword DESC_TYPE
> -  field documentation, i.e. as follows:
> -
> -	bit 0  =3D set if SEC supports the aesu_ctr_nonsnoop desc. type
> -	bit 1  =3D set if SEC supports the ipsec_esp descriptor type
> -	bit 2  =3D set if SEC supports the common_nonsnoop desc. type
> -	bit 3  =3D set if SEC supports the 802.11i AES ccmp desc. type
> -	bit 4  =3D set if SEC supports the hmac_snoop_no_afeu desc. type
> -	bit 5  =3D set if SEC supports the srtp descriptor type
> -	bit 6  =3D set if SEC supports the non_hmac_snoop_no_afeu desc.type
> -	bit 7  =3D set if SEC supports the pkeu_assemble descriptor type
> -	bit 8  =3D set if SEC supports the aesu_key_expand_output desc.type
> -	bit 9  =3D set if SEC supports the pkeu_ptmul descriptor type
> -	bit 10 =3D set if SEC supports the common_nonsnoop_afeu desc. type
> -	bit 11 =3D set if SEC supports the pkeu_ptadd_dbl descriptor type
> -
> -  ..and so on and so forth.
> -
> -Example:
> -
> -	/* MPC8548E */
> -	crypto@30000 {
> -		compatible =3D "fsl,sec2.1", "fsl,sec2.0";
> -		reg =3D <0x30000 0x10000>;
> -		interrupts =3D <29 2>;
> -		interrupt-parent =3D <&mpic>;
> -		fsl,num-channels =3D <4>;
> -		fsl,channel-fifo-len =3D <24>;
> -		fsl,exec-units-mask =3D <0xfe>;
> -		fsl,descriptor-types-mask =3D <0x12b0ebf>;
> -	};
> =

> -- =

> 2.48.0.rc1.219.gb6b6757d772
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
