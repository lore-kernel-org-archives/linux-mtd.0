Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8985C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Apr 2022 14:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+sFjAAUgbQ2dO9oyLQvOgBTrdw7D2/MAwLELl1WKoI=; b=j5NG6hzjmtIxe+
	Rt9sImfZIfgIeMYjhf+iz57TVpb1Htjwu+l4vMSsK+v4HS2AVsMgCa3757AauNU5+id1r55BY+G+A
	H3PBzriBJLVQ8/HDcUKiMUZo+1yzVCWYlo52QGvp8BU1vrEFoF0j/NJsDHlTsp/6lILne4qbVRdvj
	IJ8Jf2l0x0F7oRQBF3J/+KR8O7qOtxk3FuZfR1crdaFyAecC9fWAWmwQqOZuC17zWErFoo+s82qCg
	+5UfOkr9OPGjnvvTCoD1pNy9yYI6bbq66OCvDH2V2MGDtamAGjnr7entgsrOLb7OcP8wqsJb9Qshn
	bCkkyczmMqVvrQX4ybOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkoJj-00EVrB-QF; Sat, 30 Apr 2022 14:43:27 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkoJg-00EVpd-Uk
 for linux-mtd@lists.infradead.org; Sat, 30 Apr 2022 14:43:26 +0000
Received: by mail-ed1-x52b.google.com with SMTP id b24so12056281edu.10
 for <linux-mtd@lists.infradead.org>; Sat, 30 Apr 2022 07:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Ae7sNcHPWMn0vQt8ktazZVFlpIwIv2WIixfHk4+kCCs=;
 b=R03VAAwVTDiVdVvlB4UrMenl7xp/UpjZLcoRbp4/jp5vDn6wjTFrjllooWfuKDUy4C
 mNrMBFMThe2AtywO46d5WROs0dtF4F6lMQm6Hvp1jC4xDt4EViOJ5quaGM2kSY1C16gy
 9r8ojzX34iXZKf1bql7rTKVqClqgIvmFa8JfGZRyZZR2nR/8eumAWVKR6P7PPwnz9lZu
 MdBjsLya7QzRlZmWxmf9TWxTXZsIDmmIA3G6lMhapcvM/479Kg+UBhtoxzJ4WZymeqkP
 4fesp6bFshwwuUpjHQvYyUj3LLLG4Sjsa64FPNPrgw/RBjnFI1Oirhl8n3eCs8Y251BU
 11fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ae7sNcHPWMn0vQt8ktazZVFlpIwIv2WIixfHk4+kCCs=;
 b=bde4Nv4xJi8UipIDaOkDtaLYW8Aq5bGT23STbIOOs0FfMCftmzf8OOfNJ8+utW0t7C
 WbqJ5vNMbdVrSoeJhKMkdTWtSVeA1IKiOYC4TCrau+fOVZ7Cp4Ct/aic+UH9WldFd0Ba
 uhMFH5Bbw+Gg7BfE4WnuhlVMfB9fU88s9KxfYMt+c8pOtAgEaehDZZdSboIOfJY2TlUN
 v8SFbtkHRX8rsr4Y1ujlzRWhPQIfwwR+dcuAezQvFXEXM65lf9YW+dpizPF6arYSE6/+
 C+2PC2zerLDKXfRbDgB1LFaKm/np3ixAcj2u99rUINDr3VjnaL3xxdIRgczNfVEAhdXN
 1zKg==
X-Gm-Message-State: AOAM531cch1fOkSdmOuUPmNL3bguIE9we+3HrnEqwL6UtJ8gjHHhbwDc
 QohnrcBWZ2q9xfyOQvKygovSYg==
X-Google-Smtp-Source: ABdhPJw/sjjJ325eTLjgrvQ2SuNf9g5yd69OBocxHWeT36O4SGf1AKPyCMPkC1ksmQ5yoT6VPZtWwQ==
X-Received: by 2002:aa7:cb4d:0:b0:425:e24f:96ba with SMTP id
 w13-20020aa7cb4d000000b00425e24f96bamr4755602edt.214.1651329802286; 
 Sat, 30 Apr 2022 07:43:22 -0700 (PDT)
Received: from [192.168.0.180] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ck13-20020a0564021c0d00b00427afbbf5e8sm527102edb.11.2022.04.30.07.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 07:43:21 -0700 (PDT)
Message-ID: <62709b53-392f-2463-8124-e109f2d810dd@linaro.org>
Date: Sat, 30 Apr 2022 16:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] dt-bindings: mtd: qcom_nandc: document
 qcom,boot_pages binding
Content-Language: en-US
To: Ansuel Smith <ansuelsmth@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220429211630.7812-1-ansuelsmth@gmail.com>
 <20220429211630.7812-3-ansuelsmth@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429211630.7812-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_074325_044998_F0037BD7 
X-CRM114-Status: GOOD (  21.49  )
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

On 29/04/2022 23:16, Ansuel Smith wrote:
> Document new qcom,boot_pages binding used to apply special
> read/write configuration to boot pages.
> 
> QCOM apply a special configuration where spare data is not protected
> by ECC for some special pages (used for boot partition). Add
> Documentation on how to declare these special pages.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml         | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> index 84ad7ff30121..ef243109689d 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> @@ -78,6 +78,17 @@ allOf:
>              Must contain the ADM data type CRCI block instance number
>              specified for the NAND controller on the given platform
>  
> +        qcom,boot_pages:

No underscores in property names.

> +          $ref: /schemas/types.yaml#/definitions/uint32-array
> +          description:
> +            Some special page used by boot partition have spare data
> +            not protected by ECC. Use this to declare these special page
> +            by defining first the offset and then the size.
> +
> +            It's in the form of <offset1 size1 offset2 size2 offset3 ...>

Then it look like uint32-matrix.

> +
> +            Refer to the ipq8064 example on how to use this special binding.

Property does not look valid for other variants, so it should be made
false for them (in allOf:if:then).

> +
>    - if:
>        properties:
>          compatible:
> @@ -135,6 +146,8 @@ examples:
>          nand-ecc-strength = <4>;
>          nand-bus-width = <8>;
>  
> +        qcom,boot_pages = <0x0 0x58a0000>;
> +
>          partitions {
>            compatible = "fixed-partitions";
>            #address-cells = <1>;


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
