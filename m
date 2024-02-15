Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13ECC4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCpIBjQvCpb37FnOBJHFtyBn6uba2JDSWflNYVBHocg=; b=Hn7mmK3OVMHYAQ
	/xE0mCycU8lGsTt2D/lcXiIUwKriqCriYa7Glo259AsocquKfxLcZdrVxTDYUia723dblE/lQVRRb
	vb6XwQ3/ERZlEpwoifitYUr0NmaNSS4Dcgi0cM1fVW6tWX+9DIYw2p66Hka9xGHnMQrjM/gme0jZ8
	AYQKIsTGPuZq8ou9H5aDwrYGZm48Dsak0VXVZU4w8llQb33IpyBj8l6wwVV8MAyqukoKblOU2/OwJ
	bSyXMDfaks+1xmJipq2To7ovcdFOy7tiUGRdjuehxr8DXurSpfhXsL0TWlpZW0eH9OMiVNwhsIooE
	4Zdke8z1nXmcgg/cUJJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rah0G-0000000HRPi-3zlQ;
	Thu, 15 Feb 2024 19:02:36 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rah0E-0000000HRP8-16xQ
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 19:02:35 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-51178bbb5d9so1404772e87.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2024 11:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708023752; x=1708628552; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WINM1CAiAfhoXZ192uGwEElhM4Prco8Dh6+uC1Zs1Sk=;
        b=Hif5q5bph25vLoLsGMV8tPohEy05GpVB0US9upAhYXPUS9d+zs0O/ORpUlKmA92Sp0
         C11la73yAC8OCXGWLqAX+qIF0WxIAbPK89B7OyYWTbrfndWuoNoR2Y8uyOAvhgGcCT0S
         /NfN1z8AyCbfZj/Rhxh8US4xBS+gjz0Y0i3I13NCtzMsDuf1YRKON377PJTdhGl+VJQs
         9h3UyHor4xdObOWlh0oaLHm5UopG5ZGuTvseNqDp3boWEgi9Abtp4P0YfGDg0PPH+y52
         Pif/Kg91kxr8lAARq/GOBH31ABbZk7RcBDToXteM55uqikwVbJC0C4rLH6/8C2QtRBZy
         cxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708023752; x=1708628552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WINM1CAiAfhoXZ192uGwEElhM4Prco8Dh6+uC1Zs1Sk=;
        b=Yv9puyUl1j1rURx9YEAeS/Lvgi+1g9zyk2iLItY1a+E0bJeBmGeypqSdZysIdCmucW
         EDYoNo80c6dE1ycpJ+CjsFwUuihxw0MBknqJpSp319xOCB+kn0DgwV9ZAmuSNCVjOlUh
         oV9+S++2WNrtvqRk0d+PJyxx8cS9b2v0qhJyghnNUuNXt6bu0DseOinvxhWfmYynIMNu
         yXIJxinVkmLiMMRmsDXvwwdX39yQmC2eHBHWb03ViAJV9JS5DnqWVSKYjkO+x9N46KCf
         bKEjlTCTR9WsKWeeoWiALOVsVeLyYli5VUxKQhUXiTf5v/aikOwqCsB+lQd7v6+VLWv9
         qNbg==
X-Forwarded-Encrypted: i=1; AJvYcCWPL3rNtOI/fdtvScJwoTrP1TaHpqsk4LTSx30TPH7vilMNlE6J1uFPrxkdDDql2NoOzwnE+F1Ab1MfpX44wpdq4n2K3eE9ro9Yc+6eew==
X-Gm-Message-State: AOJu0YzeFZb9aJtmFlaqu5bjeCgBZvi39VotsLKJjn5mvypSuA7Kgzpb
	Izae6WYCtyBL3gxSz/KgC9O51qAfzeCxxtL6/JGMNlhrv3UmS4YWSlghCcP6tjU=
X-Google-Smtp-Source: AGHT+IGPISWatCsmdezcsFzOVFA1u++4PVNjsFb3qToyHec4nyciHsccN+lriRsa3TovwxGoo4rxVQ==
X-Received: by 2002:a19:ca42:0:b0:511:66f0:8287 with SMTP id h2-20020a19ca42000000b0051166f08287mr2120743lfj.28.1708023752222;
        Thu, 15 Feb 2024 11:02:32 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id au2-20020a170907092200b00a3cf5450b28sm820024ejc.189.2024.02.15.11.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 11:02:31 -0800 (PST)
Message-ID: <8c3d8fc3-2c1e-4ece-abb1-b427a909ad39@linaro.org>
Date: Thu, 15 Feb 2024 20:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] spi: dt-bindings: add binding doc for spi-qpic-snand
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, broonie@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-2-quic_mdalam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240215134856.1313239-2-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_110234_354497_57BD47B4 
X-CRM114-Status: GOOD (  14.83  )
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

On 15/02/2024 14:48, Md Sadre Alam wrote:
> Add device-tree binding documentation for QCOM QPIC-SNAND-NAND Flash
> Interface.
> 

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
>  .../bindings/spi/qcom,spi-qpic-snand.yaml     | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
> new file mode 100644
> index 000000000000..fa7484ce1319
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml

Filename like compatible.

> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/qcom,spi-qpic-snand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QPIC NAND controller
> +
> +maintainers:
> +  - Md sadre Alam <quic_mdalam@quicinc.com>
> +

Provide description which will describe hardware.

> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq9574-snand
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3

You must document the items (could be sufficient in clock-names if the
names are obvious).


Why the clocks are flexible? This given IPQ9574 has variable clock
inputs? Please explain.

> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3
> +

required goes here.

> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#


> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq9574-snand
> +
> +    then:
> +      properties:
> +        dmas:
> +          items:
> +            - description: tx DMA channel
> +            - description: rx DMA channel
> +            - description: cmd DMA channel
> +
> +        dma-names:
> +          items:
> +            - const: tx
> +            - const: rx
> +            - const: cmd

No clue why it is here, move it to top level.

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
> +    qpic_nand: spi@79b0000 {

Drop unused label

> +        compatible = "qcom,ipq9574-snand";
> +        reg = <0x1ac00000 0x800>;
> +
> +        clocks = <&gcc GCC_QPIC_CLK>,
> +                 <&gcc GCC_QPIC_AHB_CLK>,
> +                 <&gcc GCC_QPIC_IO_MACRO_CLK>;
> +        clock-names = "core", "aon", "iom";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flash@0 {
> +            compatible = "spi-nand";
> +            reg = <0>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            nand-ecc-engine = <&qpic_nand>;
> +            nand-ecc-strength = <4>;
> +            nand-ecc-step-size = <512>;
> +            };

Fix indentation.

> +        };

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
