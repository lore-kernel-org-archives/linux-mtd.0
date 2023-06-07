Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB186C7EE23
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 18:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L375HCRDkV3RfWuFBzvdPHaa5Bc3nuJ3lQgTh0o1O0E=; b=F8RdhLl3mhBtyT
	ZZ+zEQK7vCyQgnF/G4SFhaP0wSpatZVOTkhX995zXHjhLlSGWBVZXqPzfbMHAod3JeP3Do76libmU
	WI0U0uTAM7rsWTi7YUm5XS+wXja9HvTUGEle6p0aQ7bPo8i+evzLFJOinZrK6u0MY3gIx2dfyJ8fp
	/9YFCbOpqT5ssfaRisu14U+I8riUrOTS4B+qvxYBC4GTwZBaY3J8CABDdJGLHdQXnw0uL7xsqgpjK
	2vTVcTElAbVVANMlYxbjkoyo87VhegcWQqYH8mrDLB1vet2tTP7J8dHZoMg8IkAq7h2E5pkXxxXJO
	IIQVt7d+UYWnaUKZSPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6yDQ-006tPV-0K;
	Wed, 07 Jun 2023 18:49:04 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6yDL-006tNa-1G
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 18:49:02 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-973bf581759so1262810466b.0
        for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2023 11:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686163738; x=1688755738;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dcinz4Do6XCJqn5XwIXIMVUlGePC0aOBOdBvUi6kdLw=;
        b=bfXcSg3kn+4GdMtsDqNEJZW4MJHFDMZ8aieK+DbyIay74cXxHQA7bZiqKq+FCPKxff
         OvipYXRDl4A4+HcdhZT/W6U/Sr9sTW5sn2uc+bOA2NpFsD5oip4jooiXu5r8Z2aQ4Afz
         V5Q9IKftt58iYfhRGtwAVNAhZ7me542bryZ0mFfxNKwRe1IC/R+ITAejnkesOHEqOoM9
         k4dtUTUaf71wTe2GaDRhZLV7Qn+W3ho8K23kgA5O4bRKTuAMySmbVwR8c9vf2sTCajNK
         yMc/tP6wd2kXDClqkM/BT2/RqObtXZ+oeoDXuSV7GbIpxJ1/KEXgvMqwxhqHUlQoydzY
         kJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686163738; x=1688755738;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dcinz4Do6XCJqn5XwIXIMVUlGePC0aOBOdBvUi6kdLw=;
        b=FoMmM8VklrL57YMoT8jDNisYJlaE8RDru4uSEVE+oSW8cmjdKk7mDVwHFZ72wMf3D4
         t9aIYmRBpWpemn4AvrVRD6Gdizk2xFUAbUSZQhyksSJgGKYVlWEP2Kex/Dybl23ebklp
         qsnCdfP4RqQAnDrpkwZsV4q0Zj5crr087OVwFbVEQYtva4aCVacAJdMMvIkR7UUvjXR5
         Y4pdYS7ACnkfkV0EeuI/AXhk8r8PLS9NSvoUyehkuoyEPUfGRihTK03AzCXaMWJTaIOv
         sSL/TzpkzTI7Dn79P2IcAy18sX9sguMsdVghOSfnBvCL9y29cMKbe/e1Tri+eUtRigg/
         Ox/A==
X-Gm-Message-State: AC+VfDwM8ImtI39CYXtQlaHsdZMfAdF+Y/uQgtWMmJpePhRBxV6YL3qW
	VkI0httKzP8KfNPV1rfqC18aNg==
X-Google-Smtp-Source: ACHHUZ7T8jA0UZN8Cs+lehRF26n5FdGaiEIBvkEKcP1rFRIEg8fCpognrs6b98qjf+uh3D3/Yki6TQ==
X-Received: by 2002:a17:907:2d08:b0:94e:116:8581 with SMTP id gs8-20020a1709072d0800b0094e01168581mr7665387ejc.5.1686163738005;
        Wed, 07 Jun 2023 11:48:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id x22-20020a1709060a5600b0096f6a131b9fsm7193130ejf.23.2023.06.07.11.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:48:57 -0700 (PDT)
Message-ID: <758c36be-5240-44a1-bebb-93d608a336ba@linaro.org>
Date: Wed, 7 Jun 2023 20:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1 1/2] dt-bindings: nand: meson: Fix 'nand-rb' property
Content-Language: en-US
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230607145026.2899547-1-AVKrasnov@sberdevices.ru>
 <20230607145026.2899547-2-AVKrasnov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607145026.2899547-2-AVKrasnov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_114859_433494_FCCA2C92 
X-CRM114-Status: GOOD (  14.11  )
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

On 07/06/2023 16:50, Arseniy Krasnov wrote:
> Add description of 'nand-rb' property. Use "Fixes" because this property
> must be supported since the beginning.
> 
> Fixes: fbc00b5e746f ("dt-bindings: nand: meson: convert txt to yaml")
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---


>  .../devicetree/bindings/mtd/amlogic,meson-nand.yaml        | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> index 28fb9a7dd70f..54208a4191af 100644
> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> @@ -58,6 +58,12 @@ patternProperties:
>              meson-gxl-nfc 8, 16, 24, 30, 40, 50, 60
>              meson-axg-nfc 8
>  
> +      nand-rb:
> +        maxItems: 1
> +        items:
> +          minimum: 0

Drop minimum. It's uint.

> +          maximum: 0
> +

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
