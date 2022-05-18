Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5FDC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:To:From:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gs+y6hM2EEa9SaR4yYpReR1Q9+M1zw1tPlfJBzoGi5k=; b=MbxnZBw7pBh38G
	0h9izpyNKuwXkGX0cnh9QJPvRRzKMgO7Xw1f9K7r+r6m854k4p0SJzRWy/6SGAWLPpC/Jk/Z4YAxM
	8O93TmhnC+z/auQocuCmNgv5HcpDHSlB/tqlYnyk+aZHmvJ7dShCmsFVkLVrzaMaAlA0AErOBCiYy
	3+dtUJF/q3/W6OAmBcFaE2/8hPPXxdX9EdKegtEZfRkLqFJgFbjJOaifLQ1L+81b1P2mhNCCAVtOw
	TeX6oDUx4SnwfxMMtYJ8/C3XKGSYcNUiG48ahbfT/UV5xSEWZ2WlEwl3wI45IR7twzZroKjH9lYpL
	FMDNWu01DiVMrbEXluWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrOvn-003WqG-NH; Wed, 18 May 2022 19:01:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrOvk-003WoN-ED
 for linux-mtd@lists.infradead.org; Wed, 18 May 2022 19:01:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 k126-20020a1ca184000000b003943fd07180so1522276wme.3
 for <linux-mtd@lists.infradead.org>; Wed, 18 May 2022 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:from:to:subject:references:mime-version
 :content-disposition:in-reply-to;
 bh=rBZnRO68NWo3V5gqiqABKmLdz8NjuPd3CbKCN2Cz/cM=;
 b=gKUIj8Ge35wSfOVwEdHduPahXbAzwGd8SskUVAoHshrofyjcZoeby0X7wFdYx7u1q8
 MnbWe7PLjcF5/CnGMS41f9DC53DH+5qoAeYYlIkqoytoWRxweNxNTiGES5owVyfgnGie
 YGyCANJ7NxqfnedK2/FbZJJA8f7z83WKsux1pm01qs71XM2H3r4LnuBhTmcDUYP574qX
 DRuaxngNaxTLeBEnEQfIf6fnYRfNWn0LzBXBugzHN6JXFO578ctmVEH1QFd4iL3GVvp1
 8Ocn4Ab8dpl4tfiIKOf+dt9ZFVFi87cX/21EU4X2wVXZ2eZhJoCLJ9emamYoWlfOHgr/
 7YtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:from:to:subject:references
 :mime-version:content-disposition:in-reply-to;
 bh=rBZnRO68NWo3V5gqiqABKmLdz8NjuPd3CbKCN2Cz/cM=;
 b=71/eRRJmpyMqlkI1T2dT4Bg222ERn1pBKpDmKFzw2XlqkMoOlR9Lx3AHcOVo3WgjBz
 XqJ73Sp1aDQehEJkkwQqfNv5t3KyPlgvBsl/j9CKP6Ok33LyvOl712apLXnkbtjHcsad
 ROW48PhiKek5sCh2ccAZ/mghmyBvA0NeZsPoscteDLJwNkKTd0I5j6Kc+g1Hik9BQt8N
 70E4CUtMD523SyJoCwdlSrC0HD+kZiFx2oxsJha4+tv1+RQ3qUcaeBYHZFBpnZpGfD+K
 AtNY7GYaw8n5HBxnXviM3Pl7DS2I9lweSlXrgkbxg8o8egJvYVlTOuJh2Py/XXQzgxev
 dx7w==
X-Gm-Message-State: AOAM530QYGe27O8lQ4kihufcBMTavqnlAgzKWMaD0Oa3ReffXiNHmw5E
 aYL5/F1BsGq8K7wMT5EU2/8=
X-Google-Smtp-Source: ABdhPJwFABL9st5eY1kCZPAqEZTG5BH2l111z7uQRFbd2WAbEua6u8ho/o92KmJ7E6hl6JcXlsiVqg==
X-Received: by 2002:a05:600c:354a:b0:394:8fa4:73bc with SMTP id
 i10-20020a05600c354a00b003948fa473bcmr1186452wmq.37.1652900512510; 
 Wed, 18 May 2022 12:01:52 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a05600c0a4e00b003942a244ec4sm2527846wmq.9.2022.05.18.12.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 12:01:52 -0700 (PDT)
Message-ID: <628542a0.1c69fb81.8800.d06a@mx.google.com>
X-Google-Original-Message-ID: <YoVCnbKs3xgDNnzT@Ansuel-xps.>
Date: Wed, 18 May 2022 21:01:49 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: mtd: qcom_nandc: document
 qcom,boot-pages binding
References: <20220518184256.21238-1-ansuelsmth@gmail.com>
 <20220518184256.21238-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518184256.21238-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_120156_514474_75731156 
X-CRM114-Status: GOOD (  20.47  )
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

On Wed, May 18, 2022 at 08:42:56PM +0200, Ansuel Smith wrote:
> Document new qcom,boot-pages binding used to apply special
> read/write configuration to boot pages.
> 
> QCOM apply a special configuration where spare data is not protected
> by ECC for some special pages (used for boot partition). Add
> Documentation on how to declare these special pages.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml   | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> index 84ad7ff30121..3b8244db2ae8 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> @@ -102,6 +102,30 @@ allOf:
>              - const: rx
>              - const: cmd
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq8074-nand

Ignore this revision, this is wrong since this should be ipq8064...
Will resend tomorrow v4 with this fixed. 

> +
> +    then:
> +      properties:
> +        qcom,boot-pages:
> +          $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +          items:
> +            items:
> +              - description: offset
> +              - description: size
> +          description:
> +            Some special page used by boot partition have spare data
> +            not protected by ECC. Use this to declare these special page
> +            by defining first the offset and then the size.
> +
> +            It's in the form of <offset1 size1 offset2 size2 offset3 ...>
> +
> +            Refer to the ipq8064 example on how to use this special binding.
> +
>  required:
>    - compatible
>    - reg
> @@ -135,6 +159,8 @@ examples:
>          nand-ecc-strength = <4>;
>          nand-bus-width = <8>;
>  
> +        qcom,boot-pages = <0x0 0x58a0000>;
> +
>          partitions {
>            compatible = "fixed-partitions";
>            #address-cells = <1>;
> -- 
> 2.34.1
> 

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
