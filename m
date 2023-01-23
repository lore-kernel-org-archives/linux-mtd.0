Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970D9C38142
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qjAY33nA1WrPcs6bp92Bgb6Vx2nn3AJPMyCkdcF6nE=; b=KnbAbO+CfJvIIi
	LF/bOmOhsIZ0gyc16HxI4t6wgpaxF6O2IvELKQnxmp6hFaxf+23hi1Emw47kzRzCOOJaGDKsd6E0P
	LaZlRG3N4gT/51RaAskt9f3m/Dc+BUPW2TZ1is9GMjoPsglAmlukea3GaYgspVWpb/XgAL11jdmQy
	IaVf8Ype/Ku0UHP1uAwyA0IxJP6Dl0bzoJH+5mZl29S702a6yoSi+WKlptIKhgOVIXLw8hDCOZPCV
	MyszSitLRJ4g+iPQ1ZoOJ9Qq49rhETs2CU4dcBeLadXejLrx0wzV8RbtuqjJdM8f/LWaegPEmHs3w
	khKQQQlySR2VNtlP6KFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJrww-00GJWs-Vc; Mon, 23 Jan 2023 08:13:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJrwt-00GJVN-Rh
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 08:13:05 +0000
Received: by mail-wr1-x431.google.com with SMTP id d14so6277283wrr.9
        for <linux-mtd@lists.infradead.org>; Mon, 23 Jan 2023 00:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vmftNUH4lJM4o0fNkA/Mo2hyPMGER9tgtwQaLax718=;
        b=CEmcLOfj2uvDlsYOFfECG5QQo4JiI2GmtU0n2XxyqOL1bKFVNhfJ1/+xG9c7Gdn9LR
         5WwlQ7E8XLdqIc9GgYHkGSOFz5wBs2OMXwVD82N7gP7gQj04Ivlt99ERv5AUh/UZDsNR
         g3dOMhaO/2LOy8qXRrQPLe0HcSFLVLis05909Xe0Agfyn5QqxRzxc6ofRoeYgjaX0XJh
         fq7tNfnzb7n891YjupRGBvu4HUgA4zVFs7BwZsFnNZMTAPLZcOwzetuKwbGqGM/cFXTh
         flK1UERpj2Z+YpqtvJwleYtcFX9c2NWvvDSuVUBwZ0797nRn4xn7RvPt9YZdGxuAfQkZ
         ykvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vmftNUH4lJM4o0fNkA/Mo2hyPMGER9tgtwQaLax718=;
        b=7+S69W3i3F4U+3dXJ4LAFfEEHwpkQG2jheZRDncVzkLoSzevULU4v2yhcCyPQnhyO6
         LozeEJNOE51t558+WJhClGpWC0N/aqFEujwGi4LkInGvBqoPkE11pof/sR9GbgQTqXTi
         p48FVqt8u2PiIJ9voFmXLcwsj7Kyg7Ea9c4fzLOm4pkS7wwSMKN1PtASmo+tBTQcZKaj
         hX/H71gW0BnVsnlrhCnv3Esz8+aiGYZ7Rh0ApgKF29CFWRW8QsZwkXHectqmtoqyievG
         z3iYmgcd/UJFI8spPoVimkqpmEK5Yt4yktVWcKUxYSg5amdY0rrE5jDzjkt+rfkLJM8j
         M6ig==
X-Gm-Message-State: AFqh2kpnRSoxe7yNrlrhGjwKXZelUj2haNEI14fY5GKm2paPbmGJnVnc
	bvrp4VTsZMbP/XmPYdYC2GiQ3A==
X-Google-Smtp-Source: AMrXdXuwG3DQj4QQEJp6l1ReLzlEPBchCHBIwvu+r6Zfs2PgFt87jgzGiZo4ZgAND9u0Z90u0jypyA==
X-Received: by 2002:a05:6000:1b83:b0:2be:34f5:ac05 with SMTP id r3-20020a0560001b8300b002be34f5ac05mr14935369wru.0.1674461582432;
        Mon, 23 Jan 2023 00:13:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c24-20020adfa318000000b002366e3f1497sm4719097wrb.6.2023.01.23.00.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:13:02 -0800 (PST)
Message-ID: <f6545c08-3be2-523e-db21-81b2b9233743@linaro.org>
Date: Mon, 23 Jan 2023 09:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 11/15] dt-bindings: mtd: Add binding for Ambarella
Content-Language: en-US
To: Li Chen <lchen@ambarella.com>, Li Chen <me@linux.beauty>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: "moderated list:ARM/Ambarella SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20230123073305.149940-1-lchen@ambarella.com>
 <20230123073305.149940-12-lchen@ambarella.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123073305.149940-12-lchen@ambarella.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_001303_967246_0FCD36DD 
X-CRM114-Status: GOOD (  16.00  )
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

On 23/01/2023 08:32, Li Chen wrote:
> Ambarella SoC contains nand flash controller.
> Add compatible for it.
> 
> Signed-off-by: Li Chen <lchen@ambarella.com>
> Change-Id: I4108699a0678ba45e5d4347cbd860bc552dd91dd
> ---
>  .../bindings/mtd/ambarella,nand.yaml          | 77 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/ambarella,nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ambarella,nand.yaml b/Documentation/devicetree/bindings/mtd/ambarella,nand.yaml
> new file mode 100644
> index 000000000000..7c2e7c2ebc7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ambarella,nand.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/ambarella,nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ambarella NAND Controller
> +
> +maintainers:
> +  - Li Chen <lchen@ambarella.com>
> +
> +properties:
> +  compatible:
> +    - const: ambarella,nand
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 1

All your patches are weirder and weirder. Do you see such syntax in any
patches before?

Drop minItems.

> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 1

Drop both.

> +    items:
> +      - description: fio irq
> +
> +  clocks:
> +    maxItems: 1
> +    description: reference to the clock for the NAND controller
> +
> +  nand-on-flash-bbt:

OK, so this was for sure not tested.

Do not send untested patches.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
