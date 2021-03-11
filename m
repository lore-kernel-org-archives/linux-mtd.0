Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0BAC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:32:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C0D064F3B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C0D064F3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ii2vqgCiLqJgJqJ87W3aP023P+g6jonrE57I3dwFtc=; b=HYbq8VQhqYNmsjofU+lmbJtzV
	O8i4T+aJFhfMCMGG3fjs+UgMAVWVkX9afS/iP82QrDI9AmgL/zJ7/GS7zA0ugb+YdBBpG1a9wn+DG
	26xKPQz4NO5yO2hzqyAIsxx4/kNiziipJrcSytj+bA0gebQQ5IMn4bzZ61F05xPlGW/c9T+dPWgS7
	DjiM6AQ3hXW+0afgW8S/Yxyzqcui45xLqZCxVwWnE7dgLXl2vqSY5E4lmaBE5uuLTVOaxXCirYkWY
	5XYqve8XeEVSkcFLIX4dtEjHK1Jen+NpoROBJqzQAk0CAyTCp2vdEhSDHAR/Xwjuy9ugaDtuxUQXZ
	4GqBLI+KQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKPAj-009jd9-Ud; Thu, 11 Mar 2021 17:32:30 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKPAf-009jcL-PX
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 17:32:28 +0000
Received: by mail-il1-f177.google.com with SMTP id p10so10255ils.9
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 09:32:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mciBxnYC8ZTMruTsj3A3327ldspmTar14yGRG/X9ADw=;
 b=f9QNqLTX/KMC4Ud4dSYPfqsVIih9oImaWXtmn5Z124yWPHK9UJ/EtfiBaIHg3tUcww
 AKnEfE/qqE8odLAXEJ8E8ElBTFYlueloQVbavlZK0cc5a8t3/nfbx0XXLTuM+pimgo15
 NG7he+rEnHMvwksOQNmQyI7r/aBNqdKvhNbp8kvFwvAWG5o0N3mL1ChtxuoPbcCl7NJi
 hbPkXSj0rV7zOBX0VWQG13WNZgb1PocwUlO9uHKztx1Sw3LF+bAXFcVLqjW8AityKv1a
 29BoQd29/DxOrMGiLyUZC9l1fls24/C4exWX4SA16NSUMC94RQEWKBOisBMG0CMgim6Q
 EOng==
X-Gm-Message-State: AOAM530/IvwVqKYhwwZ5o67YoUhS2n2tY4j9aBlfBBV8klZ5rPvcu6Bb
 MS3jpdyGstHG0sMaB+oyXQ==
X-Google-Smtp-Source: ABdhPJw33c7UkDeD10+NXNJn3sij95d8ma7Y6H5nWgbBsMNXhiJJlw09dJacyGQlFWCO5FIIUqgIYA==
X-Received: by 2002:a05:6e02:152f:: with SMTP id
 i15mr8130601ilu.277.1615483944718; 
 Thu, 11 Mar 2021 09:32:24 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m9sm95215ilf.53.2021.03.11.09.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:32:23 -0800 (PST)
Received: (nullmailer pid 920025 invoked by uid 1000);
 Thu, 11 Mar 2021 17:32:21 -0000
Date: Thu, 11 Mar 2021 10:32:21 -0700
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Message-ID: <20210311173221.GB866234@robh.at.kernel.org>
References: <20210311051309.16789-1-ansuelsmth@gmail.com>
 <20210311051309.16789-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311051309.16789-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_173225_953469_0472CCC5 
X-CRM114-Status: GOOD (  17.30  )
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

On Thu, Mar 11, 2021 at 06:12:48AM +0100, Ansuel Smith wrote:
> Document nvmem-cells compatible used to treat mtd partitions as a
> nvmem provider.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../bindings/mtd/partitions/nvmem-cells.yaml  | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> new file mode 100644
> index 000000000000..b53faf87d4e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/nvmem-cells.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nvmem cells
> +
> +description: |
> +  Any partition containing the compatible "nvmem-cells" will register as a
> +  nvmem provider.
> +  Each direct subnodes represents a nvmem cell following the nvmem binding.
> +  Nvmem binding to declare nvmem-cells can be found in:
> +  Documentation/devicetree/bindings/nvmem/nvmem.yaml
> +
> +maintainers:
> +  - Ansuel Smith <ansuelsmth@gmail.com>
> +
> +allOf:
> +  - $ref: "../../nvmem/nvmem.yaml#"

I'd rather have the 'absolute' path:

/schemas/nvmem/nvmem.yaml

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +properties:
> +  compatible:
> +    const: nvmem-cells
> +
> +required:
> +  - compatible
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
