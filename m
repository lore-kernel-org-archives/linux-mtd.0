Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8301CC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EpRNNS4wwD9nu3UDxgnpBzBzbnu8i5VVRSATWocKOrc=; b=B22ESb3nDbjrVk
	jbXa9mUEJWU7LYuKiWZDyU5DWT05cXQV6KUTz7C7vtIArGxxkdIJ9NnF05zZJfUkFnEy8n1MUJIjN
	mzJyQE/+SYpAa0//EzkNrWH4QCbtOQI6TXb1ccaQxz+QxSflaxAxyCYZglqOESnRcS4b4Ip7IV1xw
	URuUtKOx/qaOrHWMLxFUl4UI4ybfsTyWRBGVrnjZVBgvAoA8EQO3w/P31cfWCr9Z6KAGqKcDNiXG+
	oJ6h6MO2SF/SlXMFe9dh6zydtU3+xdygEfoMycTd/KdKWOgd3d0WUbd+WUDGcwRqHPLjFO2FDfjLy
	crzU+v93RP4UzU2ArbqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbN7X-00FCWR-9u; Mon, 04 Apr 2022 13:51:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbN5i-00FBat-Uv
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 13:50:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso7757085wme.5
 for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2022 06:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d8lIwh8tiIkMFx11fFktp0oGVk3nbpQUUWnZgWL5Jnc=;
 b=W+UEgv5UP7GXJYs7QCG6QtMn7aXfPo+PDkNKW5aMvKgZsee9uyRmczhK/6PCLslrKm
 tSzbF8FkOxo4jSezbxKMnPAHm/lARrn+xP0kN/gp6snbd9diecPFDLZmy5bU1lqRS+cQ
 iOFJp0xD4OiAfjWsb3KoT0vqhIyIwBq+QcdJjrIMveCI7SKroJ0jKwEXOFnLozRJWrf9
 7VVizkFvRzvR5UF/2b0g42XataFHeKD0pzFn+5W44xkDBWHaiOmNwtMW+K0/yjeAdZpZ
 8/J///8nE3oojWSxI1Kon5NFJP6beXJd57Zd8RrkepeKE/GgEdQaBrSmx3aDRP2wzM/X
 xKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d8lIwh8tiIkMFx11fFktp0oGVk3nbpQUUWnZgWL5Jnc=;
 b=VEbv5meZAWM4bOF4u0TdejH7SAfKhVqJzv1tD4Kgm7o8VHOd4SEhdrbNr/ZggevNCj
 pirV2B3AnFCW6vdhrIuOn/Da1n40xnNB1oKDwTOmDWI7dZA97cSnBkGiVNnPaU8qv5td
 VYH+6Kha4LvNnuQc7jnP/EUBw2JDCDTjfms4pa4xaSlXW2rabtwnXWQ+HH3qGEqpa3mL
 Kyja3YlpyOAOBQcF+5IAPnBFH6aSj6WDKfYTUYqTM0vlZNChbmGYmDNPrdBO/6/QNQgJ
 U+CkU5C5zBXVQLvuLtAbxj8EU8YC6aUsrNAqKCvBRPUFTRubcEVNDupw+8KQ23W/QH5a
 50Dg==
X-Gm-Message-State: AOAM530t8YPpfnW3mukD4aSFQ/+HebYE2HNatqzhfeozMYebiuPieUbJ
 2KIf5YrGRGdVIZQ61iAtOysD2A==
X-Google-Smtp-Source: ABdhPJx1C13/G0jo9mcTjjBok/lghKbqEZJvW3uyonaeOQWgDSX154xlSCC+Ip2L56ywjoSX1G9fSw==
X-Received: by 2002:a1c:7715:0:b0:380:ed9b:debd with SMTP id
 t21-20020a1c7715000000b00380ed9bdebdmr19498320wmi.54.1649080195394; 
 Mon, 04 Apr 2022 06:49:55 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 f18-20020a5d6652000000b001e669ebd528sm9306837wrw.91.2022.04.04.06.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 06:49:54 -0700 (PDT)
Message-ID: <f86a0be9-ab40-9878-82f0-d892e674d165@linaro.org>
Date: Mon, 4 Apr 2022 15:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
Content-Language: en-US
To: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, Florian Fainelli
 <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
References: <20220404040153.1509966-1-gch981213@gmail.com>
 <20220404040153.1509966-5-gch981213@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220404040153.1509966-5-gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_064959_052222_ED84397A 
X-CRM114-Status: GOOD (  19.69  )
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

On 04/04/2022 06:01, Chuanhong Guo wrote:
> Add device-tree binding documentation for Mediatek SPI-NAND Flash
> Interface.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
> 
> Changes since v1:
>   1. add a blank line between properties in dt binding doc
>   2. rename ecc-engine to nand-ecc-engine for the generic properties
> 
>  .../bindings/spi/mediatek,spi-mtk-snfi.yaml   | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> new file mode 100644
> index 000000000000..7d57570ad617
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SPI-NAND flash controller for MediaTek ARM SoCs
> +
> +maintainers:
> +  - Chuanhong Guo <gch981213@gmail.com>
> +
> +description: |
> +  The Mediatek SPI-NAND flash controller is an extended version of
> +  the Mediatek NAND flash controller. It can perform standard SPI
> +  instructions with one continuous write and one read for up-to 0xa0
> +  bytes. It also supports typical SPI-NAND page cache operations
> +  in single, dual or quad IO mode with piplined ECC encoding/decoding
> +  using the accompanying ECC engine. There should be only one spi
> +  slave device following generic spi bindings.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7622-snand
> +      - mediatek,mt7629-snand
> +
> +  reg:
> +    items:
> +      - description: core registers
> +
> +  interrupts:
> +    items:
> +      - description: NFI interrupt
> +
> +  clocks:
> +    items:
> +      - description: clock used for the controller
> +      - description: clock used for the SPI bus
> +
> +  clock-names:
> +    items:
> +      - const: nfi_clk
> +      - const: pad_clk
> +
> +  nand-ecc-engine:
> +    description: device-tree node of the accompanying ECC engine.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ecc-engine

Wrong name.


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
