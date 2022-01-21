Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AA2C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jan 2022 01:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmaNaOm62vB3BjwvWECPBzqU0PdLJzTPFyKuXPmFEnU=; b=IDez6XsYaO/l4x
	g7PTkQoiMvo8G4nZ0u6e0oLbrtXqc6+k2+QLAuXo7F3p5x4jh24iaOtYFt2ADh8/NiKzQTx07k+pz
	cvall6iL6Y6zcujkIHwCbQx1l/TVryOCBqIp3aFKiEjbM8mo6XBQedIAtEprR/x0YvMf/Mr8yABac
	KA9hNgqhX8Oz4RCiJe0lL70VBclBaLf3D9f1ZLyNVx+FgoNmFyWs0cIXWn8v4zuubMxe9EL/7pwri
	VM0u+1UwK4kI/HP+nMQh9covi4NQaguXb6+bWeMlPVF5z6LOiPHAQU0ooNL/BYHdlggyjmb4kZrbX
	aYhryl2Bi3KD3h4E0BwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAj3U-00DZCF-8C; Fri, 21 Jan 2022 01:49:32 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAj3Q-00DZBv-Nw
 for linux-mtd@lists.infradead.org; Fri, 21 Jan 2022 01:49:30 +0000
Received: by mail-oi1-f169.google.com with SMTP id s127so11626447oig.2
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jan 2022 17:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5sobOilTW6v8xilz4tZ45KrTnGC9z7mamXeHGoMLDbg=;
 b=3cdR7dUQwtojBAoe9+KnfiGp38+mgVzul5PzkGfmjtLlXaZ8f3aSIeVMSepn8Na/nD
 LvxMhmChdtT7Mac7kZ/4v7jiTgVvr/dOQERr17dxwr52bKn1zhUoWUy9mMEk3S0NY10p
 hzxOA37IeeJW7zYvBO1W4MBQmHvqKmrz8ROMnJCL9YRyDtkICEZMF6l/HoX4OUmuKgo5
 8cjJLudha08H8Zf1fiIJmQ92Nfjl3tDBdD8M2eLGBfuvQ9hXBR57sLsusUCBAwkXhBIQ
 tf1XlDVgRQroeexJ4ogAoABjdACxjmg8hDQ+/cNLiYGORAG4uoLHJQW9oKzcUvqBjPgH
 AFoA==
X-Gm-Message-State: AOAM530pIMrGgdK4xdAfcNtvKBViT+GLs/AUwBhyQXOIZ8dImgc13Wqb
 TTznoDDLDPY8KIJul3JNlQ==
X-Google-Smtp-Source: ABdhPJzzlOCamMojh5k4oRwg23pIHtOaXP/PGM7aOMQoTKqRCSgDPwOQGdv7YHEXQ3lIzH6y6GICQw==
X-Received: by 2002:a05:6808:1490:: with SMTP id
 e16mr1483948oiw.84.1642729767615; 
 Thu, 20 Jan 2022 17:49:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e23sm439611otp.42.2022.01.20.17.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 17:49:27 -0800 (PST)
Received: (nullmailer pid 2331686 invoked by uid 1000);
 Fri, 21 Jan 2022 01:49:26 -0000
Date: Thu, 20 Jan 2022 19:49:26 -0600
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: partitions: Document new
 dynamic-partitions node
Message-ID: <YeoRJlTbILNtZgoW@robh.at.kernel.org>
References: <20220120202615.28076-1-ansuelsmth@gmail.com>
 <20220120202615.28076-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220120202615.28076-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_174928_827290_5DD9E2A4 
X-CRM114-Status: GOOD (  21.96  )
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

On Thu, Jan 20, 2022 at 09:26:14PM +0100, Ansuel Smith wrote:
> Document new dynamic-partitions node used to provide an of node for
> partition registred at runtime by parsers. This is required for nvmem
> system to declare and detect nvmem-cells.

So you have some discoverable way to find all the partitions and the 
nvmem cells are at an unknown (to the DT) location, but still need to be 
described in DT?

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../mtd/partitions/dynamic-partitions.yaml    | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml
> new file mode 100644
> index 000000000000..7528e49f2d7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/dynamic-partitions.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dynamic partitions
> +
> +description: |
> +  This binding can be used on platforms which have partitions registered at
> +  runtime by parsers or partition table present on the flash. Example are
> +  partitions declared from smem parser or cmdlinepart. This will create an

Some information in DT and some on the cmdline seems broken to me. Pick 
one or the other.

> +  of node for these dynamic partition where systems like Nvmem can get a
> +  reference to register nvmem-cells.
> +
> +  The partition table should be a node named "dynamic-partitions".
> +  Partitions are then defined as subnodes. Only the label is required
> +  as any other data will be taken from the parser.
> +
> +maintainers:
> +  - Ansuel Smith <ansuelsmth@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: dynamic-partitions

This is useless. This tells me nothing about the what's in the 
partitions.

> +
> +patternProperties:
> +  "@[0-9a-f]+$":
> +    $ref: "partition.yaml#"
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    partitions {
> +        compatible = "qcom,smem";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +    };
> +
> +    dynamic-partitions {
> +      compatible = "dynamic-partitions";
> +
> +      art: art {
> +        label = "0:art";
> +        read-only;
> +        compatible = "nvmem-cells";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        macaddr_art_0: macaddr@0 {
> +          reg = <0x0 0x6>;
> +        };
> +
> +        macaddr_art_6: macaddr@6 {
> +          reg = <0x6 0x6>;
> +        };
> +      };
> +    };
> -- 
> 2.33.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
