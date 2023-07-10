Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D434EB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jul 2023 15:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRgdgk/6A3PMG5mfwQXEgHskG1CDjqj0dvlVg0naUVk=; b=Qfn1yD2X3thVQ3
	V8Oue8ib1/XB9/Aae+qP9chm7SRjfLxpeF/2JupAqvuGN+LgA8SnHesIWiPTX8Sn/tLVUCHcoMvlP
	wNsV5ljjYdh2VSmSlIdHM+R1Wa7vqCdUDtNhYISeSANZXt/vQDr+77Lql4s5nOh175YYToRTzjvoW
	hYLhbaimgAWGaQZIc54FW51S6i2QUYMYMJ1g3o6zx7NUY5ukz29OOpqDLc9Xi+tVMizEkE/+dfPla
	A5c/dZW8QNbUKnh5RwDd9PEtGUzU5VWU3eywcIPhUlwP/8ocmf37JQn1PrZFGf1dgXUbUOb8tzjAR
	IRG71FsPLUsJ9ZxM3BHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIsQy-00BxOI-2A;
	Mon, 10 Jul 2023 15:04:16 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIsQv-00BxN2-2l;
	Mon, 10 Jul 2023 15:04:15 +0000
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-345f3e28082so16453685ab.1;
        Mon, 10 Jul 2023 08:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689001452; x=1691593452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nyrFjxJo8+g4BJMVmJMgw4xbVv526rn8ok8HJOe1Dk=;
        b=K1h/6YyBw7DayKFm3Z+J6iW3Cl3rKUqjLWvfIl+sXQVWYjSwXjMX1JKOXo932yMZDK
         3+6APCNAp6joVQjN5pGiVbsIWhohlIdUjvE8cUbup1z0DH1OBVWqY7Qo0LTtv8BwDoUP
         NHl8Ln7f+UFcBpOxjeKl0rr8de3qAV+nukxIky3M0s83on5Ah1bQw6w59c3OfdWYlWAi
         ZlX2+QOMBNBLJCnz9eDGePwQqUZdcFNtVpXrz7z40QV96uL1Htt23FQzEGul6EjGPBzq
         0mFy33nLZOF/sR4TMnSolDE4NZB/J9HVvnzV0ZDv7LekO7BDZoCufGIGJjJA/HIN0czz
         aRwg==
X-Gm-Message-State: ABy/qLaHyBbXuMlbYU+b5pPqnNqfi+TkdnKpHn2Gfhs7vsdjqKNPrrA9
	4VQRlSCorm0EBq/rYKFk7g==
X-Google-Smtp-Source: APBJJlHILVVVbEy7Z0A3dEGkK4q7KE8RtZL3irR2tEfjkqh/qlzx+dnpggNF1X/hPL3NTTjAH46O9w==
X-Received: by 2002:a92:d5c6:0:b0:345:cdbe:833a with SMTP id d6-20020a92d5c6000000b00345cdbe833amr12468140ilq.15.1689001451880;
        Mon, 10 Jul 2023 08:04:11 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id r17-20020a92d991000000b003459023deaasm3610496iln.30.2023.07.10.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 08:04:11 -0700 (PDT)
Received: (nullmailer pid 1975341 invoked by uid 1000);
	Mon, 10 Jul 2023 15:04:09 -0000
Date: Mon, 10 Jul 2023 09:04:09 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: Add SEAMA partition bindings
Message-ID: <20230710150409.GA1959130-robh@kernel.org>
References: <20230707-seama-partitions-v3-0-6aa9391b46bb@linaro.org>
 <20230707-seama-partitions-v3-1-6aa9391b46bb@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230707-seama-partitions-v3-1-6aa9391b46bb@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_080413_916232_EF7C4EA0 
X-CRM114-Status: GOOD (  22.25  )
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

On Fri, Jul 07, 2023 at 07:42:40PM +0200, Linus Walleij wrote:
> This types of NAND partitions appear in OpenWrt and
> U-Boot.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Drop reference from partitions.yaml again
> - Drop select: false
> - Use unevaluatedProperties
> ChangeLog v1->v2:
> - Fix up the binding to be childless
> ---
>  .../devicetree/bindings/mtd/partitions/seama.yaml  | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/seama.yaml b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
> new file mode 100644
> index 000000000000..5105d1a6a44c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/seama.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Seattle Image Partitions
> +
> +description: The SEAttle iMAge (SEAMA) partition is a type of partition
> +  used for NAND flash devices. This type of flash image is found in some
> +  D-Link routers such as DIR-645, DIR-842, DIR-859, DIR-860L, DIR-885L,
> +  DIR890L and DCH-M225, as well as in WD and NEC routers on the ath79
> +  (MIPS), Broadcom BCM53xx, and RAMIPS platforms. This partition type
> +  does not have children defined in the device tree, they need to be
> +  detected by software.
> +
> +allOf:
> +  - $ref: partition.yaml#
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: seama
> +
> +  '#address-cells': false
> +
> +  '#size-cells': false

You don't need these 2. You'd only need them if partition.yaml defined 
them and you wanted to disallow them.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
