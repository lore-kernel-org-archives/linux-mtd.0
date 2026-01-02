Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0476BFA3752
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7IxFUuXLRogelfwhmmyEo3x6+qUCIz6+iugT7DMBlw=; b=uyso08tLsYlOS6
	Bfk1MRH4Z5todMJVUIPsd9CrNQX9PYZvcdJXZjSy2yW196SJq034pmkdH0ZveVS0Sot+vuFopR/sY
	BOkn/Zgl3+1KUHe5z5X1/o94u/drZTkmjFgreCINyagSmcykxuYRxx40DBUZmEfuPLE9xOsFG9vli
	E53f5mPLMtLt4I+PnWt1bJFl4HaNs/3iB/w78oXbTjUoQ3gEsVOsRbGcn+APKzBhjUNG9befFJB5I
	p2jab+vgB0P4R1UfdQyuuMEbIL4U5+zJGytr/onKdds1gh7T/0IPRWTWi48OnqQJ3MggARdhZaXMM
	g/puxBT3ht8jvs4VrjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhY1-00000008T4l-3jVr;
	Fri, 02 Jan 2026 15:58:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhXz-00000008T4I-2MOv
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 15:58:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2765408EC;
	Fri,  2 Jan 2026 15:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F92C116B1;
	Fri,  2 Jan 2026 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767369518;
	bh=PPpDFLKy+MzvxXHjluPSv/KXPSJTNW+J04zNHdxiXE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lg5xcQkFX76bBotONUpLGc6Wei1S7UNg/nZ3yvWe/MQ234Q4YalthRijWTFUdP2rH
	 NJYHaJdgMQdgItxpEqYC6EKNytLGJYMmRJ2M6ncFlAJG5CnXp245f6pGeE+XsfxWqP
	 70FgYgV2fRp1Wm5Br6JLHcUj5jj9Je0eAVyOR7/d7HS+5iDQMrZkKZSFCIBFFCmeiw
	 qQIh1R2KqoVZY9l7kM1p4MaGcNLRMRAVgbZgzZ8WmhXD69kIAhKMhoYs05RNdotU2m
	 cNcGycccxNIUtznysD2a6JAkKZbRm5O3GUxfH76gjSqd3o2bEaN+r4vSzExoxltg1Y
	 ypsasO1Z0gKNw==
Date: Fri, 2 Jan 2026 09:58:37 -0600
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Message-ID: <20260102155837.GA3840725-robh@kernel.org>
References: <20251231-nvidia-nand-v3-1-2e67664d3674@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251231-nvidia-nand-v3-1-2e67664d3674@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_075839_643181_6B7A98C4 
X-CRM114-Status: GOOD (  20.71  )
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

On Wed, Dec 31, 2025 at 09:29:32AM +0000, Charan Pedumuru wrote:
> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
> Changes during Conversion:
> - Define new properties `power-domains` and `operating-points-v2`
>   because the existing in tree DTS uses them.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
> Changes in v3:
> - Removed pattern properties for partition.
> - Used single quotes for nand string in pattern properties.
> - Modified maxItems value and added minItems to reg property under nand child node.
> - Link to v2: https://lore.kernel.org/r/20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com
> 
> Changes in v2:
> - Edited the commit description to match the updated changes.
> - Modified the description for the YAML.
> - Removed all the duplicated properties, defined a proper ref for both parent
>   and child nodes.
> - Removed unnecessary properties from the required following the old
>   text binding.
> - Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
> ---
>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 103 +++++++++++++++++++++
>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
>  2 files changed, 103 insertions(+), 64 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
> new file mode 100644
> index 000000000000..632cfd7dc5e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nvidia,tegra20-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra NAND Flash Controller
> +
> +maintainers:
> +  - Jonathan Hunter <jonathanh@nvidia.com>
> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +description:
> +  The NVIDIA NAND controller provides an interface between NVIDIA SoCs
> +  and raw NAND flash devices. It supports standard NAND operations,
> +  hardware-assisted ECC, OOB data access, and DMA transfers, and
> +  integrates with the Linux MTD NAND subsystem for reliable flash management.
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra20-nand
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: nand
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: nand
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2:
> +    maxItems: 1
> +
> +patternProperties:
> +  '^nand@':
> +    type: object
> +    description: Individual NAND chip connected to the NAND controller
> +    $ref: raw-nand-chip.yaml#
> +
> +    properties:
> +      reg:
> +        minItems: 1
> +        maxItems: 5

Sigh. I gave you the exact schema to use. How is 5 address ENTRIES 
valid? Again:

reg:
  maximum: 5

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
