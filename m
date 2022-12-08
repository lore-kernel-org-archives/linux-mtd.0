Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36F4C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 09:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDQwsYxNtEFWAvt7C3aEHnXtxutNvq7TddVnOE9KsJk=; b=EVZ8hC0N9/oN/2
	id+7WBzbA0N3oHt+ivMraBYG0ogJLV3ofwG+3iTJmgn2ax77rYfZ/QuZflSXrXYrzSTIUZkWDwoOu
	Fc1E+2qn0IZ6ivnMKRb7YHwgB3pTHAsyEyxC02Xx6cOlQW6u800HarJeXhD1lzH3bhqjNntuFO/bA
	4iUdqsHyzN92sC28NX7URjJRyRCRNCAWEil6m0YYIQ5PfX7hoiu/5GcnSxq9wTBj/NMttJAopXIIR
	i2aBWiFGdt7gE0H0Vr8gm1lVL/+XqiCe0CURwWNlBZ3WRJ8gCC3hjI/1lkOaT3vGIwtf3ZHtwHUBZ
	LOb3Xf1DQv/4RUwHY46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DVR-00BCKY-1F; Thu, 08 Dec 2022 09:47:53 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DS1-00B8ZU-2o
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2022 09:44:22 +0000
Received: by mail-lf1-x12a.google.com with SMTP id b3so1216865lfv.2
        for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2022 01:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tR+f/+3nybjrz985QuJTlkfFuvKyHlsK8G2EHEYD21M=;
        b=NvP+hneTcrJLq5aKAbWBlzRJJD/2srJe9IAT/Pq2hUX9OAuJ1vz01KfcttkSjfGWq6
         MkVQq1uw8kaTQSnVB8uX4rSsEPLC1n/PxH/go/ginVJgW0kAhDGkoNoRs1nCQHSk4/ck
         94ktgccj6TDjOHMk+TlN+wvvuCtzqnhdW7+fA1IExI/sPZyyW9qQ4IwDE45IaqKWgC1L
         fz0+PgDy6EuN18RY7i+dTcRX5m1e/rFaC7S5djIFlmkXMFDMfb3lBRwtf1W/F9Vre7Gh
         5Y9A7wMqnRq2lIyDogonPN6I6vu4NSaPH0jxR54Lwuur/QSXC6XPAOQghUC7UTeLNFms
         ZW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tR+f/+3nybjrz985QuJTlkfFuvKyHlsK8G2EHEYD21M=;
        b=Fs3rsArEFE6g+6P3/809whEQ4PenUikf+hgD0dAPGdN5oocNcY80WCglRqdWwR5baC
         DzQhkxykQhwvRYJtlvCkiB+UnREbjE/2MObzxYxmASC2xZWfYIlFY/Dra8GFZJU4EfK6
         MVkkvutyE80PHJ/bk1/cW4upcZVgc6WWaB3a31T9THNEf7MoHwd3qmzUwh7XpvZzbHtR
         U+QLeAnXZIkrm5Clr6OOGLql5jLUmtu0vip76W3OMznOBGIgcWCt+gw2bOr34tb4Hysa
         o5MC2U8XcsGUkHkaH5TNVDWLbYmnPFg1tTVe7QAsfI9dq5TTmh2NCvKnobSD4DVRJx1u
         GV7Q==
X-Gm-Message-State: ANoB5pkc2h6HRKyleBrMnWJ6R1tzQAJAn7ijnsBRwornUnt7GOusxLbh
	I2YW6UsxS8fGtqBsRZPMyl2FXA==
X-Google-Smtp-Source: AA0mqf77vkoDAk7e+na4oDIjnlgURFAAvORsW7EKDtnaXGZNkHzBFx7iahF6vIP8MxlwXav31qtCag==
X-Received: by 2002:a05:6512:31c5:b0:4a2:3ca7:3a44 with SMTP id j5-20020a05651231c500b004a23ca73a44mr26614010lfe.23.1670492659337;
        Thu, 08 Dec 2022 01:44:19 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d23-20020a194f17000000b0049482adb3basm3257906lfb.63.2022.12.08.01.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 01:44:18 -0800 (PST)
Message-ID: <fe70d964-229a-8bda-a414-e009dd955e5e@linaro.org>
Date: Thu, 8 Dec 2022 10:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 7/9] dt-bindings: mtd: Split ECC engine with rawnand
 controller
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221208062955.2546-1-xiangsheng.hou@mediatek.com>
 <20221208062955.2546-8-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208062955.2546-8-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_014421_242855_BF20751D 
X-CRM114-Status: GOOD (  17.55  )
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

On 08/12/2022 07:29, Xiangsheng Hou wrote:
> Split MediaTek ECC engine with rawnand controller and convert to
> YAML schema.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>  .../bindings/mtd/mediatek,mtk-nfc.yaml        | 154 +++++++++++++++
>  .../mtd/mediatek,nand-ecc-engine.yaml         |  62 ++++++
>  .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
>  3 files changed, 216 insertions(+), 176 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
>  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
> new file mode 100644
> index 000000000000..eb1a44c7ae4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek(MTK) SoCs raw NAND FLASH controller (NFC)
> +
> +maintainers:
> +  - Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-nfc
> +      - mediatek,mt2712-nfc
> +      - mediatek,mt7622-nfc
> +
> +  reg:
> +    items:
> +      - description: Base physical address and size of NFI.
> +
> +  interrupts:
> +    items:
> +      - description: NFI interrupt
> +
> +  clocks:
> +    items:
> +      - description: clock used for the controller
> +      - description: clock used for the pad
> +
> +  clock-names:
> +    items:
> +      - const: nfi_clk
> +      - const: pad_clk
> +
> +  ecc-engine:
> +    description: device-tree node of the required ECC engine.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +patternProperties:
> +  "^nand@[a-f0-9]$":
> +    type: object

This should be instead:
    $ref: nand-chip.yaml#
    unevaluatedProperties: false

and then properties below (due to current dtschema limitations) should
list properties from nand-controller.yaml:

      nand-on-flash-bbt: true

Optionally, we could create additional schema - nand-controller-chip,
which would be referenced directly by nand-controller and itself would
ref nand-chip.

> +    properties:
> +      reg:
> +        minimum: 0

no need, 0 is the minimum.

> +        maximum: 1
> +      nand-ecc-mode:
> +        const: hw
> +
> +allOf:
> +  - $ref: nand-controller.yaml#
> +
> +  - if:

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
