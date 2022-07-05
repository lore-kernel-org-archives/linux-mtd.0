Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F256C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 09:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FdOpnhLd3GXCGMTVrZ+jmdqzLGvkzMkt7PH67nLtdI=; b=GXYrRhjpaxWib5
	0tx/ezXh6tnG/NgItn6DYVzhc+Q2/lkQJlQ+dxJ5t/jSXRYiRiF32S0OTKql99JMNsMwDwEQvFq7Y
	OlUZ9L/wSW7EcZkk+qskCyXuIC/LG+vNbLp5IySsPJDqtUvoXPwaK9c4MuslZr9LA2Ze4CqiWznqW
	gm+7EKZ4Z7jTIPziYjoUL5iS3CVUY+cLVVyOplVHg9qiCIn80B1MXhO92v3vG5WZNus4q2AHLsasm
	L5HuWIgh/I2n4dHt46xcKRFWbpjgrWdQu4ZH7WtWcl6EvgVsi5Pg9v4tIko+ScH69D/Xa/vvtjy/7
	jLhM02iTli/OvTgWSnfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fC5-00GvIp-IT; Tue, 05 Jul 2022 09:50:09 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fAL-00Gtxy-L8
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2022 09:48:23 +0000
Received: by mail-lf1-x134.google.com with SMTP id z25so2055257lfr.2
        for <linux-mtd@lists.infradead.org>; Tue, 05 Jul 2022 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ahpvfjUdXTR8WSsjap+PAgVIzJ16qJ7M8PATGfTPtFI=;
        b=hXYh3ispdpHgB9k7Iam45wMwEKXDESJJWiotYpXkdeS9eJapOErB2G7dIMxlYFRta9
         MVodOWys9y/5TNwtIFzRWNutDMqOVTytJ18zQRoWiUWqYemL6igs7DK5kAQP0IQlJmDN
         qEkfNJ9I/NINevOP+1+Vi0CeWGUtA0GzV2DafPHBe2k/r3fHUXoZFRnmL95uXJ8GFGGS
         s3FES0TubM69HkJDeS0E0drO0lEo6RTrjYGMFgigqsWW6HAuqeZUSM+4UEA5qZa9ZeVE
         ma8btURFm3pDjuQPBqDiDk5RQYh8h+SfTLRpi/BqEjRq2yZriwDiyi6iVB/st89b/HIU
         REgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ahpvfjUdXTR8WSsjap+PAgVIzJ16qJ7M8PATGfTPtFI=;
        b=epBLaleUEnFNA+npzQAQWeEy47c3N5giPbCH5VFpbMWe0QgDthTl0n2Rg5+Tf05lJQ
         yKIxYpofn9+9OgOUzO5P5VWOgs4nW4hEXOknuDX0H2q+M7MxfFgQPF+ki0MmUIlm89k/
         CVlf93xsqBGunY2Q0yIcecr4MsshcPGE0hhELS2u9tleXat/gYL2Z6FPpx0riOthBjaL
         rM/jWjgI+8wVH92eBsYnqQ+QM6bDTzHoND5E3DF1mjd/xdh9BEdgsxBP38Dy/0xYb6aP
         n00HEaHjYh+Lq3FiAXB/Dow966jMOvUegqzgkRzQCwDN3xe1/C2+oLWjhb8eTRmGpHQ7
         9XgQ==
X-Gm-Message-State: AJIora/rda7IQyRD931cuy+he6NZw1QcnGdEn3CX2DW3mZMa1OvONNEH
	FQEj+4SOxFpg0bB9SSX00KLw4X370i20Ig==
X-Google-Smtp-Source: AGRyM1u721+7xpKSxN/uYG1ugKxyjBkKJ+dK71jGvPOj3htzgCrnsBaya92MI59e4jlypYIxOOnQkQ==
X-Received: by 2002:a05:6512:3d89:b0:481:bcf:cecd with SMTP id k9-20020a0565123d8900b004810bcfcecdmr22709190lfv.511.1657014500137;
        Tue, 05 Jul 2022 02:48:20 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id bf26-20020a2eaa1a000000b0025d2f556e6csm401559ljb.14.2022.07.05.02.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 02:48:19 -0700 (PDT)
Message-ID: <ef676df1-77e0-b8ee-3950-97eade8ddd5b@linaro.org>
Date: Tue, 5 Jul 2022 11:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/11] dt-bindings: spi: spi-nxp-fspi: add a new property
 nxp,fspi-dll-slvdly
Content-Language: en-US
To: haibo.chen@nxp.com, ashish.kumar@nxp.com, yogeshgaur.83@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 han.xu@nxp.com, singh.kuldeep87k@gmail.com, tudor.ambarus@microchip.com,
 p.yadav@ti.com, michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 festevam@gmail.com, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
 zhengxunli@mxic.com.tw
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
 <1657012303-6464-7-git-send-email-haibo.chen@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1657012303-6464-7-git-send-email-haibo.chen@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_024821_759031_DEAC56A2 
X-CRM114-Status: GOOD (  13.31  )
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

On 05/07/2022 11:11, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> Add one optional property nxp,fspi-dll-slvdly
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-nxp-fspi.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-nxp-fspi.yaml b/Documentation/devicetree/bindings/spi/spi-nxp-fspi.yaml
> index 1b552c298277..6bd61565686a 100644
> --- a/Documentation/devicetree/bindings/spi/spi-nxp-fspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-nxp-fspi.yaml
> @@ -45,6 +45,12 @@ properties:
>        - const: fspi_en
>        - const: fspi
>  
> +  nxp,fspi-dll-slvdly:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Specify the DLL slave line delay value.

What are the units?

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
