Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16472C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rjJsmgvj+ZtVPveSuLhwtjfQvoxLBKWtNkDpIDZ2XA=; b=cRiNO4qK0z41VO
	fU11y9SWyQRi6KN0UyZ81fHQgp1kHiD/eMFJMQEu5lkcqd4M4wZXw68OR/w+N4MoDHUi4cKBvlA8S
	0riCwCvr/81oiCVX5AFtVdHp/pXmvwqVjCuoZOf92TXNrEsg3v9B14EXeBHB/qlsQ+BsO6jfNsqcK
	7NOyMPduA/OeeL4r2bh2hMbzKfrAnFLtu8kyiX+Z39OXhNNnIp5yc6u5xzUJTrsHqch4ltmCqAEkL
	KeEksYAv1tL8q8EwlzaqKS1ehyHJN5C1c/NK5nIiYl7Uk11siqrGzFP8LPxT8nTtYEYOG7JUgAF6m
	ambmILMmfl0xviNrblwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZzx-000Rz7-Ne; Mon, 28 Nov 2022 09:00:21 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZzu-000Rx1-WC
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2022 09:00:20 +0000
Received: by mail-lf1-x12e.google.com with SMTP id b3so16310266lfv.2
        for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2022 01:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxQ4Op4wJkfy+E4USfATcQwka4uMnYgoKUlk7fhdGSE=;
        b=vYdb5XXPSaGwuCoLSVoXRdQxnPaAziy9sgNBD8ranp2ceRSNgedYCPqR4S0vLEMnU5
         P7HmMByv0VoBFVxh3uq65mFCK6MQA3c0f560kARTzEWaiHCOOyVKCJTkHV4l3S0g0eq6
         vyrw/O9/ZX1QkVXD18yE6C+NWMpaloiZ48EArn/TOG2veHbj9d1Vcemour9Z1xigBKa3
         RpQk3CTgz6qadxdn6IuvgcjwozjTQ3KcPOCBhwr3enogTDQR0PzTks2bn9+1k7OhHpBq
         tbyLx/EFDgvPrd35WmKItzN43WvkclKutLtUhhSEvey4QSfvY342K6flzqPRcf5xJC5F
         updg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxQ4Op4wJkfy+E4USfATcQwka4uMnYgoKUlk7fhdGSE=;
        b=tRFJ8O975YAyCGQtDLvvrQwiO48ZxaKedtSH/WFpIEg8CWlhwkgR67zDmcnShkXwTX
         9KzSd1+rVN3ZuT1odggYPxR31qYw9fKAK5dGIWYPxvn9Q9teFKMTh0nrDE0SSDTyZaMQ
         x4wYGijRkoyFSzeWtyuOLuewqzqEuQDkWSFT03IOOPjo3SbR7mcq7rTTUYR4YrB9eSW5
         DsGB9yBbqGfe1gTDpQlQKW4E4gr9T/+o/y0xwSB9J+oOKbDLAwZC5XIfnjMdinzGGp/S
         RC5PBCVZGGzc5vdj8M1SPOdR0sckGpmr9MFWfjGl2vcoUf+ajympRtjWRQwf3b9q1rNJ
         OqIQ==
X-Gm-Message-State: ANoB5pmVdC49qiiuZDgi+CxwxeNoLLqCwad+fMyzzBDqhnC3+THHzqs7
	KN8yhaY7BCguhO/5h3V8Ohl5gQ==
X-Google-Smtp-Source: AA0mqf4yCrmsZoHkLNUdgjrfnhNmrW+jAyoF8Yth5MPBnrKTzOxQXVV9S2/fv4YTu9XRNKVY+0RP+Q==
X-Received: by 2002:ac2:52aa:0:b0:4b1:fc9:429f with SMTP id r10-20020ac252aa000000b004b10fc9429fmr17759584lfm.84.1669626015128;
        Mon, 28 Nov 2022 01:00:15 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v28-20020a05651203bc00b0048a757d1303sm1655307lfp.217.2022.11.28.01.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 01:00:14 -0800 (PST)
Message-ID: <8b8e4b23-a3bc-7e3d-199a-e8f591d05d71@linaro.org>
Date: Mon, 28 Nov 2022 10:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/9] dt-bindings: spi: mtk-snfi: add mt7986 IC snfi
 bindings
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
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-6-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128020613.14821-6-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_010019_071670_EF668B9C 
X-CRM114-Status: GOOD (  15.51  )
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

On 28/11/2022 03:06, Xiangsheng Hou wrote:
> 1. add mt7986 IC bindings

Subject: drop second, redundant "bindings".

> 2. add optional nfi_hclk property which needed for mt7986
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>  .../devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> index 6e6e02c91780..ee20075cd0e7 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> @@ -26,6 +26,7 @@ properties:
>      enum:
>        - mediatek,mt7622-snand
>        - mediatek,mt7629-snand
> +      - mediatek,mt7986-snand
>  
>    reg:
>      items:
> @@ -36,14 +37,19 @@ properties:
>        - description: NFI interrupt
>  
>    clocks:
> +    minItems: 2
>      items:
>        - description: clock used for the controller
>        - description: clock used for the SPI bus
> +      - description: clock used for the AHB bus dma bus, this depends on
> +                     hardware design, so this is optional.

Optional for which variants? For all of them?

>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: nfi_clk
>        - const: pad_clk
> +      - const: nfi_hclk



Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
