Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96362C77B75
	for <linux-mtd@archiver.kernel.org>; Fri,  5 May 2023 21:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9R72iHVKawAi2BxXGaqnTCwA/QZ+FQ9tUnnyozDYc8=; b=pgXYEqWSwyqyZZ
	r3wfnNRT574+sxQ25ReMZXNB0/nVuSEp0jBkxZb68izbxymfylskz0+dc2KoTR1q0N6vZ2oq9oZQz
	Skz+0RKfZ0wrXxyiZDInhef2sEVOhrIsB/XXKSysUIpWgPXt4K2WBAB9u2f4XIh4L+b+wOmD7QABG
	sTe759gzocRCB7QJu3Fq4S1wbukgGeviCjmK5zhdznUbhSFsdBrmkk3M6Be85O9qUIyvq72WHtcsa
	FhAYzqO0xgGVGUSNA/0/d64unEOp11JnUBC6DSG4qx9fCRzLkNbEfq1gMQiVHnHqbtpb4WEikFirz
	pCtvIweFfZMEmFRD+4Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv3PU-00BvKF-1T;
	Fri, 05 May 2023 21:56:16 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pv3PR-00BvJf-1V
	for linux-mtd@lists.infradead.org;
	Fri, 05 May 2023 21:56:14 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6a5ef2c2a70so1603975a34.3
        for <linux-mtd@lists.infradead.org>; Fri, 05 May 2023 14:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683323771; x=1685915771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNSzvzZVt7UhzIY8EoLz5e+V2L8esY8YLcJw3l2ZqdI=;
        b=kKwAWzMcbu6DOLdggt9CpVKBAN5YW88huWsGNgAP3POFusjsrJh/RpofGnfhhZ9fEl
         QQ5xEPnp4O37lC/J6LgIrY7UcT8OTs+jhGqrmXQdZ57QD3ZCobATyyf1w3Hxc2GwfUM0
         GPfgk2iTHbm92q7XsBdoWzO0N/zYPRgExoAkMzVcYIM4V//r/tYB9g4GExQHzFJenTep
         beUreDelswWNJQjq5MLTv5ZNpw6ueJ9OvJNf6Cihe5kCsmP7q7+Ce57BVitXEX3DpnfB
         nReGHLDBRq+EeFi8nQNg+7SesIY/m3J/D3pcO4VstoLD4xf0Ssn27mU55HlWa3NN6CVG
         78rg==
X-Gm-Message-State: AC+VfDxHUl761luBlbPcnMFTOy8c6ukk2P2x1bPEFBxlJPgxqMPg9Pex
	pwJpDHTlzTyAPIfBPe1F2g==
X-Google-Smtp-Source: ACHHUZ5zgZU6g0y02V5jdYf6mrjFieqefFlz1SVWsfrF5XzkkX8aQBWc1/4RPWTq7PD4kohrvqcyNg==
X-Received: by 2002:a9d:5909:0:b0:6a6:23eb:728e with SMTP id t9-20020a9d5909000000b006a623eb728emr1298665oth.29.1683323770900;
        Fri, 05 May 2023 14:56:10 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n4-20020a0568301e8400b0069f0a85fa36sm1348780otr.57.2023.05.05.14.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 14:56:10 -0700 (PDT)
Received: (nullmailer pid 3630402 invoked by uid 1000);
	Fri, 05 May 2023 21:56:09 -0000
Date: Fri, 5 May 2023 16:56:09 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Zhihao Cheng <chengzhihao1@huawei.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: mtd: partitions: add linux,ubi
 compatible
Message-ID: <20230505215609.GA3620855-robh@kernel.org>
References: <cover.1683043928.git.daniel@makrotopia.org>
 <faa0ceb4470f7160b05e892932d20b4a540c5955.1683043928.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <faa0ceb4470f7160b05e892932d20b4a540c5955.1683043928.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_145613_505419_A1919371 
X-CRM114-Status: GOOD (  18.02  )
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

On Tue, May 02, 2023 at 05:48:39PM +0100, Daniel Golle wrote:
> Add bindings for MTD partitions to be attached as UBI devices.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/mtd/partitions/ubi.yaml          | 49 +++++++++++++++++++

linux,ubi.yaml

>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/ubi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/ubi.yaml b/Documentation/devicetree/bindings/mtd/partitions/ubi.yaml
> new file mode 100644
> index 0000000000000..aa02fbbd50716
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/ubi.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/ubi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Unsorted Block Images (UBI)
> +
> +description: |
> + Unsorted Block Images (UBI) is a volume management system typically
> + used on NAND flash providing bad block management as well as
> + wear-leveling.
> + Any partition containing the compatible "linux,ubi" will be attached
> + as UBI device.
> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +allOf:
> +  - $ref: /schemas/mtd/partitions/partition.yaml#
> +
> +properties:
> +  compatible:
> +    const: linux,ubi
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
> +            label = "bootloader";
> +            reg = <0x000000 0x100000>;
> +            read-only;
> +        };
> +
> +        ubi@100000 {
> +            compatible = "linux,ubi";
> +            label = "ubi";
> +            reg = <0x100000 0x7f00000>;
> +        };
> +    };
> -- 
> 2.40.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
