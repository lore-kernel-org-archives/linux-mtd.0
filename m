Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA16C77B7E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 08:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CgXsHfYIm/Ewt6GI3k+vMeALsO6XfRkHP8c6qHmeP4=; b=jK09oNrTlwYmt1
	8yvmV8QicpyjbemNKeep80OdeCDGpGQSk/bAE7m+8VPmB8pvsOrTP2l0o7hAe2U6Lc8zu4tpwQ8nP
	bf3rnQ3fHS9WLRYuzLMn1flR1dLm4rICV3x89ZrWYRwxO/7tfiDRci55ebVvtfZwjOdAJGoAKX8cS
	6WvMTXC6xzdI+D3dPc+JaFXsbE6czShS1TFUwYh1gqJ7SlU3tsQsL0IjtDtk1QWnK9HYg47KH/DHE
	spT8hfp5PmIAgWiJX+uNItfoOUDOvllG+avxa3XsAtzYqphF3nU/PQnDHw5ENK/4KtJL6lv/1gBq+
	smIMutomP3imxIAju+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4dPZ-002Uu6-1g;
	Thu, 01 Jun 2023 08:11:57 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4dPW-002UtE-1W
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jun 2023 08:11:56 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-514859f3ffbso887618a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 01 Jun 2023 01:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685607110; x=1688199110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a/aAPNbwdm0BPn5PUgLp4hktWQaK2+uFNT4kN1UiiV4=;
        b=noBu4GFo9o3K31KSzM6zLXaqNSmfMChm9oSwgyqduSqkh+q29FAY/1uCqxBNWnDE43
         d36A38bwZ64J5xryHZzKKXCirlaQPolkLgkuTj3Pb7gf1KSetTMW6TL4DCTmrrW0YJCJ
         8kFPneS+nrSiGsbgg1frnaP32OKmvDUSmXcwWQsIkWpQG7F5TJEHIb9rX8VXJf/dwQo+
         uIOloDXkzuvmT7sLEkHBgH1woFhKHNTWj/nNRvpvGNJ3RenBcG6vT5LEoOrU5+vWiYMM
         d9ozFrKUIgtc++4ieYsff8RQrU482JbaPkGCCgQC+n2nE72CBBvN8GvSQCLHXoIKZM6O
         D8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685607110; x=1688199110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a/aAPNbwdm0BPn5PUgLp4hktWQaK2+uFNT4kN1UiiV4=;
        b=Rx5swNIunLB8jQ2IzQWTXBfG/uNyjONwTOLEYT/0bB7PHFKS5UO1YkkXhANFScjAKZ
         uX7RaYSmu2FMrf766ozwisnheYpkNgnzkbZrznqLcyGENo4CwuuYzX5QlAfF1ge3TXRN
         7zkmJO1mqzHrUpj1YFuOhVGVJWCzeLB2EkoKSu/0JxNqnqTPt0s8evEBTgwG8WK4D+4x
         wahYm0I0ALh28p+PCZ4SfiAuDJg9+W3feaymAV/E2gYDKuuM0iup/MbXNwBHQ9dlE5Nd
         Ge1VKTYLwQyeBlXkm3fx+b8yEriNqdt1ZGVGNYhrwM3Y+byGaF9B1WP28ASwzjTIq6an
         az5Q==
X-Gm-Message-State: AC+VfDyUqM1aU93o070nouWfdyNqH4QxjfjimIaDgeulkNptHZZ0YbGF
	NTb0mlllOZjT4i5GqbQPrZwXJw==
X-Google-Smtp-Source: ACHHUZ59OUxz1x6flGeMGoLbNndoi2EK6EwfZcyjgNCpA1L9+RbhXlv0PBwyXltBSS9baZu1GRh/2A==
X-Received: by 2002:a17:907:7b92:b0:96a:52e:5379 with SMTP id ne18-20020a1709077b9200b0096a052e5379mr7774277ejc.63.1685607110379;
        Thu, 01 Jun 2023 01:11:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id l17-20020a1709067d5100b0096f72424e00sm10129750ejp.131.2023.06.01.01.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 01:11:49 -0700 (PDT)
Message-ID: <65124d19-474a-ce95-2cb3-bb8273a8e3b7@linaro.org>
Date: Thu, 1 Jun 2023 10:11:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 23/43] dt-bindings: mtd: Add ts7250 nand-controller
To: Nikita Shubin <nikita.shubin@maquefel.me>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Michael Peters <mpeters@embeddedTS.com>,
 Kris Bahnsen <kris@embeddedTS.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <20230601054549.10843-5-nikita.shubin@maquefel.me>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601054549.10843-5-nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_011154_516150_3B2C99E4 
X-CRM114-Status: GOOD (  17.35  )
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

On 01/06/2023 07:45, Nikita Shubin wrote:
> Add YAML bindings for ts7250 NAND Controller.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
> 
> Notes:
>     v0 -> v1:
>     
>     make it a nand contoller
> 
>  .../bindings/mtd/technologic,nand.yaml        | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/technologic,nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/technologic,nand.yaml b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
> new file mode 100644
> index 000000000000..26d1d9c3331d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/technologic,nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Technologic Systems NAND controller
> +
> +maintainers:
> +  - Nikita Shubin <nikita.shubin@maquefel.me>
> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: technologic,ts7200-nand
> +      - items:
> +          - enum:
> +              - technologic,ts7300-nand
> +              - technologic,ts7260-nand
> +              - technologic,ts7250-nand
> +          - const: technologic,ts7200-nand
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells': true
> +  '#size-cells': true

Except what Miquel wrote - drop these two.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: true
> +
> +examples:
> +  - |
> +    nand-controller@60000000 {
> +      compatible = "technologic,ts7200-nand";
> +      reg = <0x60000000 0x8000000>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;

Incomplete example. address/size cells do not make sense here alone.
Finish the example.

> +    };
> +
> +...

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
