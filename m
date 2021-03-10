Return-Path: <SRS0=h6Lp=II=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A814C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 02:59:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A06C264FE8
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 02:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A06C264FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lOjZzvMzaNiKBXfe9nUd+sbas6Jm43BIXrjUb3qSVso=; b=kMCo65oJpIsHkcZ4q+pYikYJT
	tFWrRXxSSl5hLmW6Fcwqr9lM5440zJqnHev/9oEMjDxItpWTbSRDhVP1YZd89qBLwKMJXwYUswxrF
	pXkK+iIVo4XOjAF9C2X5j+LEK/TIfboACmLDAquGIbYU7aMvZyyo0/TDpRSEGy6MAa5yBWD5+CEx+
	nWN/VexywMt+KTmvZ8/Qd3JfBHSetO1zLTd3vBUTSc68DXIwQ7JMsOMmyyQn6ke5FHzAoT9eeipWY
	ekaoT5SGgoCe0EzRoaJJ6entrhjPaGIegmosJUl1ZHnVkJlMAtayMjpi8O6SYjAeqDkg1IAqboi9Q
	HjDI5ublg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJp3e-005qnJ-59; Wed, 10 Mar 2021 02:58:46 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJp3V-005qkd-8a
 for linux-mtd@lists.infradead.org; Wed, 10 Mar 2021 02:58:41 +0000
Received: by mail-io1-f49.google.com with SMTP id n14so16349745iog.3
 for <linux-mtd@lists.infradead.org>; Tue, 09 Mar 2021 18:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NvJfFHHjSXrZPelJXpOGfvsgnRgrEictZAVxjsaxjas=;
 b=l6u9NXhoL/xccY7/KncAMfaM6jxTfBRWC5D1iFAZVg3/rlJZTJQmDy/ygP0xYEALat
 FOLBHM8fvl08yWKyBAutgewNpMTySofGUrvQwNyknyZJmW6i+tmzpB0rm3ntKyyfnCU9
 e1KPlDq6TcrDn6nVKIj9h5VNMtjasKtxWSGQ4E/Em7zeG2YdZ5hvLOwiNGBByfqNLUpn
 chODSNBx7BgeipWGuT5CASC1mZN/f7l7jrw/WGZhtmb3K7Nms69SqMYeC215ZkW0dpGT
 IAl/WJ25FYGWVdZj9muH1iZY74KcPbQYSqZU2VPPcLmFTdExcnnChBk0CxtkUfs9NN4D
 NKMA==
X-Gm-Message-State: AOAM530Y27QTM8HCt1HkdPov5ZMZyzR8Bwgo7vWbr0i4lgWZeGwm6cup
 GSLaq5axC9BarLcjmsbq5Q==
X-Google-Smtp-Source: ABdhPJw0dsp1wd3hNPwCczjvlSXXqWBrXy3V0hN2TVom21FlXwsJ7NadVMljd7bSQbl+chvYmUU7Ow==
X-Received: by 2002:a05:6602:1641:: with SMTP id
 y1mr1016044iow.34.1615345116172; 
 Tue, 09 Mar 2021 18:58:36 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id y3sm8341675iot.15.2021.03.09.18.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 18:58:35 -0800 (PST)
Received: (nullmailer pid 1660968 invoked by uid 1000);
 Wed, 10 Mar 2021 02:58:33 -0000
Date: Tue, 9 Mar 2021 19:58:33 -0700
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Message-ID: <20210310025833.GA1658557@robh.at.kernel.org>
References: <20210308011853.19360-1-ansuelsmth@gmail.com>
 <20210308011853.19360-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308011853.19360-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_025839_623120_4C55C4FA 
X-CRM114-Status: GOOD (  19.87  )
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

On Mon, Mar 08, 2021 at 02:18:45AM +0100, Ansuel Smith wrote:
> Document nvmem-cells compatible used to treat mtd partitions as a
> nvmem provider.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../bindings/mtd/partitions/nvmem-cells.yaml  | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> new file mode 100644
> index 000000000000..4ed246b27985
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/nvmem-cells.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nvmem cells
> +
> +description: |
> +  This binding can be used to treat the specific partition as a nvmem provider.
> +  Each direct subnodes represents the nvmem cells and won't be parsed as fixed-partitions.
> +  Fixed-partitions bindings described in fixed-partitions.yaml apply to the nvmem provider node.
> +
> +maintainers:
> +  - Ansuel Smith <ansuelsmth@gmail.com>
> +

I think this should reference nvmem.yaml. We can drop the $nodename 
restrictions in it.

> +properties:
> +  compatible:
> +    const: nvmem-cells
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +  reg:
> +    description: partition offset and size within the flash
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - reg
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    partitions {
> +      compatible = "fixed-partitions";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      /* ... */
> +
> +      };
> +      art: art@1200000 {
> +        compatible = "nvmem-cells";
> +        reg = <0x1200000 0x0140000>;
> +        label = "art";
> +        read-only;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        macaddr_gmac1: macaddr_gmac1@0 {
> +          reg = <0x0 0x6>;
> +        };
> +
> +        macaddr_gmac2: macaddr_gmac2@6 {
> +          reg = <0x6 0x6>;
> +        };
> +
> +        pre_cal_24g: pre_cal_24g@1000 {
> +          reg = <0x1000 0x2f20>;
> +        };
> +
> +        pre_cal_5g: pre_cal_5g@5000{
> +          reg = <0x5000 0x2f20>;
> +        };
> +      };
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
> +        firmware@100000 {
> +            compatible = "brcm,trx";
> +            label = "firmware";
> +            reg = <0x100000 0xe00000>;
> +        };
> +
> +        calibration@f00000 {
> +            compatible = "nvmem-cells";
> +            label = "calibration";
> +            reg = <0xf00000 0x100000>;
> +            ranges = <0 0xf00000 0x100000>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +
> +            wifi0@0 {
> +                reg = <0x000000 0x080000>;
> +            };
> +
> +            wifi1@80000 {
> +                reg = <0x080000 0x080000>;
> +            };
> +        };
> +    };
> -- 
> 2.30.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
