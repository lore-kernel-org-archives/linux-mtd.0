Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50B5EB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 06:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCepni6yYsLHyqTzD1X5InbX2ok+HagYRHgAO0gszT0=; b=Lz9/nZk26zyFV5
	GcU7op/i/7VCPwPbFrsy1NJKRsrSEXPf1FZN473MIdkYneqG4nghlDhr7Jg8BySoHuJel34vnSCqU
	PPFbOmodrzhKHwFPNu1Z4mLiOicduEPrIULMAqV1HrAghGOgZvBfu9mDP0K/H92sd4MYE04l0QW10
	zh/WGDbzTQ84n8vt6nlbgNSJzZ4/G1MZSWfsHpWLH6daPa+YSp1m6v28DtR2NKSvzUZpTc4ZKLcCF
	X9Xr5ualBtpQ9ctxGZJJb3oU+e/txZ+NEIRffg7CClDDy/6VgIFCPf3GCzWfiVECt+TAdXM535GP/
	hBRSY9BfvfH3cg0MFbLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8jW-007d9M-0g;
	Mon, 19 Jun 2023 06:51:26 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8jT-007d8f-2A
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 06:51:24 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-970028cfb6cso522787766b.1
        for <linux-mtd@lists.infradead.org>; Sun, 18 Jun 2023 23:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687157481; x=1689749481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pyFlYK86pYvnrZnzArT+XeEMAZXdDH0qpd9nhJENlGI=;
        b=IdAkpaocourJKyKEXr68ccw2Rfoz2tR2lCED7W+YP8N8Gee2vcgPdx8oGD+iSIczKi
         7qlXXNk6t4usMaH/mkEj46HAmfnKCbkrTdJYJZNs4jo049m3ml4XglDOraJfIPU2+F+r
         t1auZnZq/D1Sf6cTNA1/9yO4N61Z8uEM975dld20mNEj9sY1aFB2T61SAsdHkv4LHObe
         d+hGub+MwoahsFzIlSzFe6nnKPPh3xx0iIVwQZoGorjNEnKUoXyzIpA9LPFwDxUjy1/e
         3jM9SbhWYUzGTcDK7s+3oYui4+/dlLKnB+kYCOpKt/MT6QS/xL6+ghg4UCR0MYPn3d3d
         4m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687157481; x=1689749481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pyFlYK86pYvnrZnzArT+XeEMAZXdDH0qpd9nhJENlGI=;
        b=Z/OKxP/QK9e2yWiPnHkuV1gbiL3GHUgPfNxeYce3QHUCPSozRTYYeWRiX1HcBl8i8G
         su9SlUvT/Hr8BrFAwOR4mfeL6iJ8S1w8iXR55KypivgheeohBM+xicPLwXnSAbCKLWsl
         i84ZgvbLWL2AFKRmqLMs8hsSq0xWitXD3Edr1etgPdyFepP1IvSna8o613wWTKewxgcJ
         WZ92Yo/J2tpAV9ngPLX/+kXVkAj7uzybLIFjzalTl3kv4281CLrJIiaSNjLTK/KCn8GX
         Xbp8tAOCv2mlJczvt0M2HrwVPAiItEs5kdGVwRmEDfEnnx2HCgyOc1e410dQsU2JGxw9
         vi4g==
X-Gm-Message-State: AC+VfDyNl9UhPKjNzoUgHT7ZCv5HwC0rbsyfANc0Bslegg+yvQ+M2Jc7
	jBD+yWL4JXy4p7tRcQCB7b5V8Q==
X-Google-Smtp-Source: ACHHUZ6YzLBk+wzBh0dt4/lKE800oJPPeuZm8wIQ/59KwyiAdeIrF92IkoGBLVrWzyoOaMagXpiXaQ==
X-Received: by 2002:a17:907:a42:b0:985:34b:83b4 with SMTP id be2-20020a1709070a4200b00985034b83b4mr9289735ejc.10.1687157480992;
        Sun, 18 Jun 2023 23:51:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id j21-20020a170906831500b00986d8722e46sm3562105ejx.17.2023.06.18.23.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 23:51:20 -0700 (PDT)
Message-ID: <81e33e8b-499d-b67c-a142-85fd8743cb49@linaro.org>
Date: Mon, 19 Jun 2023 08:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 04/17] dt-bindings: mtd: Describe nand-ecc-mode
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-5-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606175246.190465-5-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_235123_801924_44AD9C79 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

On 06/06/2023 19:52, Miquel Raynal wrote:
> This property has been extensively used for almost two decades already,
> a lot of device trees use it, this is not the preferred way to configure
> the ECC engines but we cannot just ignore it. Describe the property,
> list the exact strings which have once been supported and mark it
> deprecated.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
