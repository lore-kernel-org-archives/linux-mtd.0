Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8F5C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 20:43:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A8FF207CB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 20:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XDfbrrzb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A8FF207CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=od1SWPOAqJnohysWfkYLZ5Pw0tHENOOey3EQkdDo808=; b=XDfbrrzbBtYpKf
	j9S61BSqb5k4P1NLG0mGm7al/84Lh+GEp9egJPHDnkTl3wI6DRhjW5B3ggMpyxxLgxor19Nfi6CmO
	aZVCCJ7mQL49e1U2po0BqDmuX/nmYSn656skVbMeiSAd+S1LpLbL5HGdAxxPLv+Mf/18dnTltwf/D
	KxpMu4i8LVg94z9Xmike/8J/9ZYm0qRXIKkWtn6oV5ei0EFodwMRHoRqbVD+gMeZbOpjgf0t0SijY
	pSeQM2ZRh9dE3/Ny+lq/lz+vnNjln7Z9CpuXVQ4us6pPR/UshIxmiuq3/zErVqjzFwv33jjjKjkIB
	qFgPgQ+Gter8cQoLAKrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdgPr-0006VQ-0H; Tue, 26 May 2020 20:43:15 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdgPn-0006Un-VK
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 20:43:13 +0000
Received: by mail-io1-f51.google.com with SMTP id r2so13267518ioo.4
 for <linux-mtd@lists.infradead.org>; Tue, 26 May 2020 13:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=05fRtb3l7CU2Nk1q80iQghWcohiFEtAdOdLPDPtrgQM=;
 b=XESRZX77B2kjCs5DiYOB0IESGA8imR+AFWJ+r/w4N/ab8MRBA0dXxl8DvDYWaXSUfk
 JzHNi6zmLubq/f8P98OXzOpGZNQmtHYyVN2GhaHmPi7TITPvn5NynOinRYAjnfH2FEcN
 je7bjTFJF9wQwLO1ur+gPT4F57tKyP7XsVbr0MdR8XvIe71GfVwapuOnnXNT5U+QI1KX
 Sn3JAmZ3M60fXkn+/KJXI5eP11au1W59Kf41Faruq/poFFQSAfNFgrcT56tX/QyYTSK+
 plDmUSp3UG9aiG1RMf2iyvSoSpftdrDKxleviHlEhgfILl9tBkCSIQY5c7459V7cm/s0
 GYTQ==
X-Gm-Message-State: AOAM532ryz9SGT9Sl9Z9AosPkZ78tJbaTQS4p5vWDoFDxi/0RW0XIHwx
 Aj609o/cVYcZ+DBkS2fKZw==
X-Google-Smtp-Source: ABdhPJxxQMajEHw93bHjLSQCqQRRc4712FyKVp3vy1T0XvKvvTb5ijKU9eVHfPZ2tLAlUqaZQiKdzg==
X-Received: by 2002:a02:c4c8:: with SMTP id h8mr2848837jaj.64.1590525789124;
 Tue, 26 May 2020 13:43:09 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id w70sm531218ili.78.2020.05.26.13.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 13:43:08 -0700 (PDT)
Received: (nullmailer pid 335891 invoked by uid 1000);
 Tue, 26 May 2020 20:43:06 -0000
Date: Tue, 26 May 2020 14:43:06 -0600
From: Rob Herring <robh@kernel.org>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [RESENDPATCH v8 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
Message-ID: <20200526204306.GA224630@bogus>
References: <20200520000621.49152-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200520000621.49152-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520000621.49152-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_134312_007370_AF9864C6 
X-CRM114-Status: GOOD (  16.33  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw,
 andriy.shevchenko@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 20, 2020 at 08:06:20AM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> new file mode 100644
> index 000000000000..cd4e983a449e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0

Still not dual licensed.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/intel,lgm-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel LGM SoC NAND Controller Device Tree Bindings
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +maintainers:
> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> +
> +properties:
> +  compatible:
> +    const: intel,lgm-nand-controller

Still doesn't match the example. And the example will fail when it does.

> +
> +  reg:
> +    items:
> +       - description: ebunand registers
> +       - description: hsnand registers
> +       - description: nand_cs0 external flash access
> +       - description: nand_cs1 external flash access
> +       - description: addr_sel0 memory region enable and access
> +       - description: addr_sel1 memory region enable and access

reg-names?

> +
> +  clocks:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +patternProperties:
> +  "^nand@[a-f0-9]+$":
> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 7
> +
> +      nand-ecc-mode: true
> +
> +      nand-ecc-algo:
> +        const: hw
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

Not documented or should be dropped.

> +  - dmas
> +  - dma-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    nand-controller@e0f00000 {
> +      compatible = "intel,lgm-nand";
> +      reg = <0xe0f00000 0x100>,
> +            <0xe1000000 0x300>,
> +            <0xe1400000 0x8000>,
> +            <0xe1c00000 0x1000>,
> +            <0x17400000 0x4>,
> +            <0x17c00000 0x4>;
> +      reg-names = "ebunand", "hsnand", "nand_cs0", "nand_cs1",
> +        "addr_sel0","addr_sel1";

Not documented. And needs a space after the ','.

> +      clocks = <&cgu0 125>;
> +      dmas = <&dma0 8>, <&dma0 9>;
> +      dma-names = "tx", "rx";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #clock-cells = <1>;

Should be removed?

> +
> +      nand@0 {
> +        reg = <0>;
> +        nand-on-flash-bbt;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +      };
> +    };
> +
> +...
> -- 
> 2.11.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
