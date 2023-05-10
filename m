Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18828C77B7C
	for <linux-mtd@archiver.kernel.org>; Wed, 10 May 2023 14:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3brhmDrHoWFmL8GHf5WM2mpnF6xerU60f4gdjibjCg=; b=kxjDCeC3hHCrOP
	f1GzCL4uAhnaaxlUJe6hp4qvjtU2sKtv7okd7R2wvcrIGnNHgOjdw6vFT4hZBtzU1BKbh45Mi4QK5
	Z5hwXg3nZ59tCLghgrfpZf103j3lzCXcTTa4sdY+/m1Q2lErF4L8v0JZHLIGuxxUyT77qW1WMHaOp
	hR3H8YGmuhOyfFUiTy1TCgIdDxGRK/O0rSRB/keqjbFuq/63WaNS1p9nD4drAQfn/zqNlErRKiZrc
	IudDpiygIENPm5FiCPk3MSMQh8Ye/Mmta4hLqHUkxDkg1Qg3Iv1+gjge5jQecWLiu2MbXWhQ8q+h9
	wgTuHXkgPG+t3AQsA9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwlG5-006Pm0-06;
	Wed, 10 May 2023 14:57:37 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwlG1-006PkX-0w
	for linux-mtd@lists.infradead.org;
	Wed, 10 May 2023 14:57:35 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9660af2499dso1034794766b.0
        for <linux-mtd@lists.infradead.org>; Wed, 10 May 2023 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683730649; x=1686322649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gGKIDnp5BcnMW9gCpRCUAYeE1qjMs1lyP7Vbjiy3irY=;
        b=l14bycRfrRlZbpxmWjdd9s/MZYHJ9DwLn51cx+fW8/aKCO5bN4RQY4P9sZc/VWqyHc
         LUVBCcAqC0+To0VuR3CRZj4rphtpF8RFVibo8CaEPG3Z4bUJai9QA9bCGb2799qhhYUA
         gdtMrr4W7bQFgQWiKr1oZVB49Z2LVAOrfenh1bEtPZA3lA0L3mxjTxEQaqVj2lKCUYxA
         IK8i62rMzgx22Anj7I4QuGMEnfJ//oJtMwgU7whvbcLeMlPg2GrV6AaHbHW1I0Kj/dzx
         4CtTvWDgKNa8PxFBCzrV3eBb9xlutfJgi+bR8pUK0P6KL/Gn6Z+1LRToGihau6Fl1Hg4
         +ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683730649; x=1686322649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGKIDnp5BcnMW9gCpRCUAYeE1qjMs1lyP7Vbjiy3irY=;
        b=T7qI74DVcSd7ujPL2ydWuxGJD6PecAMVzjTq3Po13WmPwc614jPzEIjfANWN6z2G1/
         ymU+Mj+0mZITPuugIEbsKMCDQfmuuLG2teYofJLd6S74O2qZyEWYSLifM4kqoCEbrEzM
         cYYp2sVFx7TMCskxZYfS8xTxUW5KWrjeKXQg5RzqELrMahHchuFkrEIh7+gHHKlEiLFa
         lnbHd6OmzpdIpB4jv0GAN+94CzgiNBljFS1p/yZqOQ2rkwxYUubF9VNQhmedi3hNkAj/
         Xw2ibiQ3MG3gFLYg0FsXQsqneoFVYAlnxAj5n6eDJmMnmxJ2ZZ5/Hcps6E34n0eVs0WY
         ZWcA==
X-Gm-Message-State: AC+VfDw5q44cXbMDlJHmYgGQPGClz8QWkLVNfaRUr8ScSDmDgQ0ByEVm
	Af7en0pqEcjwvUWj+INdEMLNbQ==
X-Google-Smtp-Source: ACHHUZ7yADfN3NfDdk+MGaKfjHxbNijO2SdsdYQ3qjq9eAyKgll64Pb46yoHy2sfNGTo4FIilvALFA==
X-Received: by 2002:a17:906:9c83:b0:95f:4889:412a with SMTP id fj3-20020a1709069c8300b0095f4889412amr17648241ejc.33.1683730649389;
        Wed, 10 May 2023 07:57:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id ci17-20020a170907267100b009682b2b3d66sm2731221ejc.197.2023.05.10.07.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:57:28 -0700 (PDT)
Message-ID: <96c63925-91d5-994a-a531-2d7bdb3b642a@linaro.org>
Date: Wed, 10 May 2023 16:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: mtd: Add SEAMA partition bindings
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org>
 <20230506-seama-partitions-v1-1-5806af1e4ac7@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230506-seama-partitions-v1-1-5806af1e4ac7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_075733_330591_2F5CD8A3 
X-CRM114-Status: GOOD (  19.94  )
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

On 06/05/2023 17:29, Linus Walleij wrote:
> This types of NAND partitions appear in OpenWrt and
> U-Boot.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/mtd/partitions/seama.yaml  | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/seama.yaml b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
> new file mode 100644
> index 000000000000..352f008ffdb1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/seama.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/seama.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Seattle Image Partitions
> +
> +description: The SEAttle iMAge (SEAMA) partition is a type of partition
> +  used for NAND flash devices. This type of flash image is found in some
> +  D-Link routers such as DIR-645, DIR-842, DIR-859, DIR-860L, DIR-885L,
> +  DIR890L and DCH-M225, as well as in WD and NEC routers on the ath79
> +  (MIPS), Broadcom BCM53xx, and RAMIPS platforms.
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +select: false

You miss update to partitions.yaml. Anyway, for your testing,
temporarily change it to true, to see errors.

> +
> +properties:
> +  compatible:
> +    const: seama
> +
> +  '#address-cells': false
> +
> +  '#size-cells': false

You have children, so these must be true.

> +
> +patternProperties:
> +  "@[0-9a-f]+$":
> +    $ref: partition.yaml#
> +
> +required:
> +  - compatible

address/size-cells as well

> +
> +additionalProperties: false
> +
> +examples:

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
