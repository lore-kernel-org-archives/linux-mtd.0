Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D454EB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 06:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSr1jTVcSFwYaLmiakOsdSZsM8eQgM/P0ITPVHnhXA8=; b=e6waozIPs1Gw5h
	RU5snq4eawPe39/BNVutKy+w2xMHLG/dvyn7nuc4ub/ps78LJ+0LmcW85bwpHZZd9EowRzy/BURMV
	7zELd12EWum+vgcMn+HXiRjYjKl9UKcj0r5cGzFXkn9oVabIN8hKOhlu4aifm7QoEY475Joj00u98
	ML/CjmL63L8Z193Ww012dCzLFi/ZteimtM9UWoNp+Dw9etZrWajWPXKn8iHEMPzpYyw/N4ZtO8aid
	GzIvUGADDfdASgF6XzY5ykLjVlUtt5tbAsUfD2mzC/naaEDi0kAZ+cUB7Z2FRp02bQ8A9nDzKbCLj
	G5roDJo1kIfCbtpaZ1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8mL-007dde-1S;
	Mon, 19 Jun 2023 06:54:21 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8mH-007dd7-1z
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 06:54:19 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51a20138617so4542065a12.2
        for <linux-mtd@lists.infradead.org>; Sun, 18 Jun 2023 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687157655; x=1689749655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RFA1s9sPOFLDHeM8JVLNOmdOT3KqlEJ+F62ywYBEaQ0=;
        b=qX+5sH+TD7rVDXh9VU49bJ+fOR/OAYB60qZOHcjwrEvoakbWgtbKU5zb4Yq5x42kZb
         lewccwmCTPQkmzp3Hxo6G9Py+Ofy0Kpo8gGkagg/SMlIAuxkNgLbopKVeTxZDgK30yJM
         zVIBEBnlJjAWHT/pMCmsJU2tML1JlOcKBpc/c5KoGJug+QZrgRGCWtf9KdqR++lRy01S
         CT6fKlswtrQzFqgAp3CxyWdRDCapoQX9tR+HmFBHcTkmVLJI7H1eOI0fMOr9WUlLu8bj
         UDDGWqnZUWn8P6ZDM8yDCMag8AAUZXtKogXW1TTdgrjyk7NBE+R/dUFKTbHYYtXzwRI3
         qHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687157655; x=1689749655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFA1s9sPOFLDHeM8JVLNOmdOT3KqlEJ+F62ywYBEaQ0=;
        b=WZHFQ2/ad6nSU+DpKgnfFXUx1UJgMXfVyGzVzMUaqOmPqYxqCMsLrQTEoz5E8uBsS2
         m3K4JhwIKwFCXFrraizIsnpc4OHGmNZuwABg7CWmdV7fS1dfNydYiJVxU/r3anTEjli/
         O7ES2YycGddT8YcVI5IAaY1b+8xRe7jWxWoAhoGxG5pPKG23cwycah+Vwwa2AmAtXgXm
         tPvwnvMLOidjtlwjUAQBL6Veyh6bjxSo1F73O0Gw7iQxp1/rNynmDWadLtRxs8hWc1Ae
         TXay52f/5s6nI+RKZN/WXU4gab++PgBc2dCKnYR65Q5INqhTaYYFvN6A4EmeyNIb2ckZ
         41+Q==
X-Gm-Message-State: AC+VfDy/AwaQ5K39AfGp2wykHRf/sTkBDsShEnSsYibKEPpzFf4qpO1o
	gxhEg9o1uzo8qdx9uMtsTpA5lg==
X-Google-Smtp-Source: ACHHUZ5n2hJSkj0ukICFCKD6/N41Jxo7jlDoQvCWYtTHsTcv+0CGrU9F2qFqs/Zmh+golRi+maGZwg==
X-Received: by 2002:a50:ec8f:0:b0:514:a0a7:7e7f with SMTP id e15-20020a50ec8f000000b00514a0a77e7fmr6287357edr.2.1687157655554;
        Sun, 18 Jun 2023 23:54:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u3-20020aa7d543000000b00514bddcb87csm12966752edr.31.2023.06.18.23.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 23:54:15 -0700 (PDT)
Message-ID: <3f4f4beb-4136-312a-be0b-5ec018b4329d@linaro.org>
Date: Mon, 19 Jun 2023 08:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 05/17] dt-bindings: mtd: qcom: Fix a property position
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-6-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606175246.190465-6-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_235417_685930_AB29EE61 
X-CRM114-Status: GOOD (  18.28  )
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
> qcom,boot-partitions is a NAND chip property, not a NAND controller
> property. Move the description of the property into the NAND chip
> section and just enable the property in the if/else block.
> 
> Fixes: 5278cc93a97f ("dt-bindings: mtd: qcom_nandc: document qcom,boot-partitions binding")
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml   | 41 +++++++++++--------
>  1 file changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> index 07024ee45951..7217d8a64d14 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> @@ -45,6 +45,22 @@ patternProperties:
>          enum:
>            - 512
>  
> +      qcom,boot-partitions:
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        items:
> +          items:
> +            - description: offset
> +            - description: size
> +        description:
> +          Boot partition use a different layout where the 4 bytes of spare
> +          data are not protected by ECC. Use this to declare these special
> +          partitions by defining first the offset and then the size.
> +
> +          It's in the form of <offset1 size1 offset2 size2 offset3 ...>
> +          and should be declared in ascending order.
> +
> +          Refer to the ipq8064 example on how to use this special binding.
> +
>  allOf:
>    - $ref: "nand-controller.yaml#"

Also based on some old tree.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
