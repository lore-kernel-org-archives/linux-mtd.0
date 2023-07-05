Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810B9EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 19:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsEF406OgNVJtMxZ8vlf/rmpYL0LmaTsQ/twQ8yfo5U=; b=T7Qdeo8UDmQWYg
	mmNkcj2h7SGE6hVTXdn9dNLxkSrUBD0afptLkdUESoEVX+qZJnL5L3coXsIJxqcM1GEMc7Qj9e3e+
	kcuCJbxaDGyiVmMRSSL6ARyOab7V2HlckymS91n7RsS0Zko4LXAhcFKsHcgThOwD/L9vT+FVTqdBl
	q5/p099RZtbeUjf7hgmqAP+w92wFic2Pcx+kVdn15f8s+saK088Rq1qiWucDqftm7dhH6qGhyAgMb
	J4tIRp9kg2Jf2vx165U4bDiK2tki9ae1cqYRP84YDw0X96oFk0lS+ACd0EdQbTc3o44VJbL9JQGGy
	jVMrNDd7qkazwMQlrDqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8Xh-00Gx3o-1r;
	Wed, 05 Jul 2023 19:52:01 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8Xe-00Gx3H-0i;
	Wed, 05 Jul 2023 19:51:59 +0000
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-77acb04309dso354062639f.2;
        Wed, 05 Jul 2023 12:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688586717; x=1691178717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgxCgI0UhXaalrd8FtZ3lKHjbHQYR+CHqoq8oQgcBj8=;
        b=EvuP3ga2tqxVMgx6y451lLZgza8cVYUL1SoyuMBrUXsR0iGIGBl46VwO7N3lKqAtlF
         FMUmwfPsVP9ljVaenbflLbgkdqk3TlkxWLbRwvtgHGxNrf34/Mskqoh+H35T0AqLllf9
         ZxyVuFwG+yP73OrmHfG3gQscaxmHs2l30koNNdyDbgu4ND4X/Zq4wNysYTPoqZwNZKbN
         u5n8zQfzuLXXosyokDnO/2PbwXOstRHIvJNzPFzKurN725/Ke95Gq7W0fZPOh6S6x14m
         2vuPBUBMm91APYuTenkjlvqFQvfTwYtGaYQaOAXrfGM7OVfr2NLrX9U8FFyux2knvtzM
         RNbQ==
X-Gm-Message-State: ABy/qLZlaBkP1+uhHG1SbvuZbrwj2CnEC8MNn21rvcwxKi6rhN+4o+eN
	B4lMU9HDPpKZmjy51fErjg==
X-Google-Smtp-Source: APBJJlFfE26pMmnc4X7bL1ZeGdt2/p9FLN9uM6KgYidS2YWs2WUaDK7eEf0pVgwqz52ouAz0T6SvXg==
X-Received: by 2002:a5e:891a:0:b0:785:ff35:f340 with SMTP id k26-20020a5e891a000000b00785ff35f340mr118432ioj.14.1688586717448;
        Wed, 05 Jul 2023 12:51:57 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h2-20020a02c4c2000000b00411bdcdc488sm7729558jaj.173.2023.07.05.12.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:51:56 -0700 (PDT)
Received: (nullmailer pid 1730881 invoked by uid 1000);
	Wed, 05 Jul 2023 19:51:54 -0000
Date: Wed, 5 Jul 2023 13:51:54 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: Add SEAMA partition bindings
Message-ID: <20230705195154.GA1702900-robh@kernel.org>
References: <20230705-seama-partitions-v2-0-9d349f0d5ab7@linaro.org>
 <20230705-seama-partitions-v2-1-9d349f0d5ab7@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705-seama-partitions-v2-1-9d349f0d5ab7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_125158_258378_867B642B 
X-CRM114-Status: GOOD (  26.32  )
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

On Wed, Jul 05, 2023 at 12:17:46PM +0200, Linus Walleij wrote:
> This types of NAND partitions appear in OpenWrt and
> U-Boot.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix up the binding to be childless
> ---
>  .../bindings/mtd/partitions/partitions.yaml        |  1 +
>  .../devicetree/bindings/mtd/partitions/seama.yaml  | 50 ++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> index 2edc65e0e361..9bd0a8d800da 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> @@ -21,6 +21,7 @@ oneOf:
>    - $ref: linksys,ns-partitions.yaml
>    - $ref: qcom,smem-part.yaml
>    - $ref: redboot-fis.yaml
> +  - $ref: seama.yaml

I think this is in the wrong place. These should be device level 
partitioning schemas, not an individual partition type. (Though nesting 
is possible)

>  
>  properties:
>    compatible: true
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/seama.yaml b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
> new file mode 100644
> index 000000000000..5ed7764bba69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
> @@ -0,0 +1,50 @@
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
> +select: false

Remove this and your example will fail. You need unevaluatedProperties.

There's a problem in partitions.yaml. It never gets applied, so this 
schema never gets applied. The default 'select' is generated based on 
$nodename or compatible, but it has neither. This needs some more 
thought on how to fix given the variable way partitions can be combined. 
Probably at a minimum, all the 'select: false' need to be removed. 

> +
> +properties:
> +  compatible:
> +    const: seama
> +
> +  '#address-cells': false
> +
> +  '#size-cells': false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    partitions {
> +        compatible = "fixed-partitions";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        partition@0 {
> +            compatible = "seama";
> +            reg = <0x0 0x800000>;
> +            label = "firmware";
> +        };
> +    };
> 
> -- 
> 2.34.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
