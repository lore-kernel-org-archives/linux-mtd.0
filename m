Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A41DC001DE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 22:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LB9o2v3ru4n+/ACaqB5iwgLVe0BYtOwa4pfSL2ckoHQ=; b=pfabVX5kt5UXvL
	6jaFcZK70FCd4qqdlHBbl5g51iGqvtZKdJbtprY6zWhdD7/P6vJpkHbYudT0sgBMFC71SoVK++AvQ
	h+uwjYeB2F38+tQAWqDr+a2N6CLIa1ywjWQYxP2Q2dcmEhoe36laI891C2uUv52I5UbMUVqAo2IME
	P2PeVmCu8v8xI1vTSiQ6Tn8TemR2L0Zf943LcqUSE6eH+Jrv1iXOmmRvdc+uOhn+Yn0TTDpzYkGqA
	zmWVYlJnyBXbQg9r49h0svNTc7i0F7PUPAWiewT31VVBaM3PC9z20uugvSe76L+3wqsn9294xZ9bA
	Ys5OiPUMfDy+inPOUujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTs8X-0061fw-1m;
	Wed, 09 Aug 2023 22:58:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTs8U-0061fB-0k
	for linux-mtd@lists.infradead.org;
	Wed, 09 Aug 2023 22:58:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EFF2864BB1;
	Wed,  9 Aug 2023 22:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8894DC433C8;
	Wed,  9 Aug 2023 22:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691621916;
	bh=qXAY5+ypBMRjazkxqMPSQk8aD3TC6Q1gvPIppZsbcKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BbgfgXdsOE1QpeBsua+opVOLktDulOVKwrCaVnE+j/XlHuEqn9K5n88UcwTAUVVoo
	 zgTMn+okkEpKKSl1H69pYJOdDX/wQ9vbSY7IacbVHRfTOdAPT5LTyBGIR+3ApZPm9L
	 Q4/9B+zSKZWhRLNoy2P6/ah0vmGksUfy+jnyq5gBvzs8TgZGWyIEOkoj6ksJRL3TeK
	 1Tjn5N5Ry4ya7sJtVj+4DHPGpT5bBRbqiD0OEqy3kgFo002Y0r+3PNHgogA3sOBAm9
	 0/aIl3X9uaOoK02IgDHKgKkryfRnhcv6bhevTFS2Jq6cC2j+hKSm6iHjfl5i4QSSUq
	 a2ZeUbCL1tkgw==
Received: (nullmailer pid 3162148 invoked by uid 1000);
	Wed, 09 Aug 2023 22:58:34 -0000
Date: Wed, 9 Aug 2023 16:58:34 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/8] dt-bindings: mtd: add basic bindings for UBI
Message-ID: <20230809225834.GA3144140-robh@kernel.org>
References: <cover.1691510312.git.daniel@makrotopia.org>
 <094e68da59bbd9efea1469b122f34f5dcf156f0f.1691510312.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <094e68da59bbd9efea1469b122f34f5dcf156f0f.1691510312.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_155838_378902_FAC7AFBE 
X-CRM114-Status: GOOD (  21.97  )
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

On Tue, Aug 08, 2023 at 05:03:19PM +0100, Daniel Golle wrote:
> Add basic bindings for UBI devices and volumes.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/mtd/partitions/linux,ubi.yaml    | 65 +++++++++++++++++++
>  .../bindings/mtd/partitions/ubi-volume.yaml   | 35 ++++++++++
>  2 files changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml b/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
> new file mode 100644
> index 0000000000000..79cfa0a3eaa7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Unsorted Block Images
> +
> +description: |
> +  UBI ("Unsorted Block Images") is a volume management system for raw
> +  flash devices which manages multiple logical volumes on a single
> +  physical flash device and spreads the I/O load (i.e, wear-leveling)
> +  across whole flash chip.
> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +allOf:
> +  - $ref: partition.yaml#
> +
> +properties:
> +  compatible:
> +    const: linux,ubi
> +
> +  volumes:
> +    type: object
> +    description: UBI Volumes
> +
> +    patternProperties:
> +      "^ubi-volume-.*$":
> +        $ref: "/schemas/mtd/partitions/ubi-volume.yaml"

Don't need quotes.

> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    partitions {
> +        compatible = "fixed-partitions";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        partition@0 {
> +            reg = <0x0 0x100000>;
> +            label = "bootloader";
> +            read-only;
> +        };
> +
> +        partition@100000 {
> +            reg = <0x100000 0x1ff00000>;
> +            label = "ubi";
> +            compatible = "linux,ubi";
> +
> +            volumes {
> +                ubi-volume-caldata {
> +                    volid = <2>;
> +                    volname = "rf";
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
> new file mode 100644
> index 0000000000000..c17d0caf07d97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/ubi-volume.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UBI volume
> +
> +description: |
> +  This binding describes a single UBI volume. Volumes can be matches either
> +  by their ID or their name, or both.
> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +properties:
> +  volid:

volume-id or ubi-vol-id.

> +    $ref: "/schemas/types.yaml#/definitions/uint32"

Drop quotes.

> +    description:
> +      Match UBI volume ID
> +
> +  volname:
> +    $ref: "/schemas/types.yaml#/definitions/string"
> +    description:
> +      Match UBI volume ID

ID? 

> +
> +anyOf:
> +  - required:
> +    - volid
> +
> +  - required:
> +    - volname
> +
> +# This is a generic file other binding inherit from and extend
> +additionalProperties: true

Where do we restrict this? You referenced it, but didn't didn't restrict 
it there (with unevaluatedProperties).

What other properties would you expect? These nodes ultimately need a 
single schema (can be multiple files with $ref's) containing all 
possible properties. Otherwise, any random property can be added 
unchecked.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
