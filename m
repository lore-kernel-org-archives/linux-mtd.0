Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B639C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2WV3yVTnyK3zwyzyC8GaAMEtw82gRT4Scf67F+okRE=; b=4Oy2rt8O58sFAM
	xqzUtIDW1rcqNihxLWHTD51qGEm2UNz4+81Rbam4BIIyU+ReLDK4o8nyzmnEzVQDBqsiXDEhUCHtT
	ijOtJoML3iJoz1/4HqdPE4AdTAJwxyiZ4Ibq0js+ZJKB8tvnoMW+pLLGTxN/siXGWLGGC0K/uDroc
	to7OKq1HJHmWgRjSYj/1c5E6s+v58trLVADdXWQwz4IWAWwJtiWkmmrqmQ2U6b6mCUmLyKA0Ux8m0
	K3W7GqiKC/aEUlzlM+jdiK+e68k3Kqwtw78osWNtmXx5LGTXsgmRkYocO51Zk3949rd/Z/1Un8k1i
	TnLBtmooFDfTlE3Y/laQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oza4V-000U6H-Uo; Mon, 28 Nov 2022 09:05:04 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oza4T-000U2r-9L
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2022 09:05:02 +0000
Received: by mail-lf1-x12d.google.com with SMTP id u27so5295992lfc.9
        for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2022 01:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A55aTUx9um1awxaJwrSFbAQ2B0+UBrA3NMiv8IfADq0=;
        b=S72uyT2NmmapvIzFBlVuuVu0Rj7I4DWGK7uN5lPNwFlu0h/1xHqfc0w1ekc4I5t3Uc
         EN1EyLvMqacGCEyoAVBLE2K5WwWW7b3QhzeHSt96fjPRHdsIcBipIoipMdiiwv2KLMKF
         4jRN/hMdKFY1tCOyS2B1azQZzCvJ4VqiGQ1gKE4FLqK3KOY/tB4uwWsoppviePTHGj0I
         xVFArXGbIddcVz/WKsB70I0stTDLANjS0MD/cELNNmuhiNaxpmNVJ0t77XYWD8eX6Ptt
         DPn9UqhkeYxwgnaF/NCocPrBYXR5aGK3rgOKaYtBrYcmlo9DtCVRy2H/GR/W6qgBGkuG
         2Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A55aTUx9um1awxaJwrSFbAQ2B0+UBrA3NMiv8IfADq0=;
        b=1fQrAbb/ZMeTg7P5IWa3GqUTdaizoutVal/JbPO+nvkCRkdASWloQKuvn/i7E4w0/6
         0bZFhph+xO+mSFV6Clx8JJQ2oAg1PCz932zzf7jGtClU7m7hMREpL/UDmaHwszmj5i6v
         KQvi/mEAlvTOzU2miUa28ylwmhIWI7HBC/BrkBCrB4V4W1xf+Nv3rrq4N6qMRg6pTr74
         rBaTQDX+goJ4qLQAHpbogaQd8waryDmMxMHgL13zHtUPUk0709GYo4FyIYmM/4lDf2St
         DEK1faI1y3SNN5EDYTR451NdHmlYM0zkwFeVpomQpPubpMTMVWqe5ZbclrkY4BlU1fxx
         nR/w==
X-Gm-Message-State: ANoB5pnAFryaX1PbQwzscwhhPi3TOP2BkrwXzZZ/weaxA+P5qFxk4Zbz
	omXY8MRCFJu/edAicLdtKLL23A==
X-Google-Smtp-Source: AA0mqf690hCzqZNxg+ZuHnfgQ+jA8Im/PCMuhGme2XTYv6jky84sgnUWOjjTeaDuaJus+Yq5DlEr3A==
X-Received: by 2002:a05:6512:2987:b0:4b1:61a6:fc45 with SMTP id du7-20020a056512298700b004b161a6fc45mr11308428lfb.224.1669626299613;
        Mon, 28 Nov 2022 01:04:59 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r30-20020ac25c1e000000b004ac088fdfd2sm1645536lfp.85.2022.11.28.01.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 01:04:59 -0800 (PST)
Message-ID: <9985d44e-977e-d7ea-0932-4879a3ccd14d@linaro.org>
Date: Mon, 28 Nov 2022 10:04:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 7/9] dt-bindings: spi: mtk-snfi: add two timing delay
 property
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-8-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128020613.14821-8-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_010501_370964_694BDC16 
X-CRM114-Status: GOOD (  15.88  )
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

On 28/11/2022 03:06, Xiangsheng Hou wrote:
> add rx-sample-delay and rx-latch-latency property.

Start sentences with capital letter.

Here and in commit subject: property->properties

> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>  .../bindings/spi/mediatek,spi-mtk-snfi.yaml      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> index ee20075cd0e7..367862688e92 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> @@ -55,6 +55,22 @@ properties:
>      description: device-tree node of the accompanying ECC engine.
>      $ref: /schemas/types.yaml#/definitions/phandle
>  
> +  rx-sample-delay:

No, use existing property, don't invent your own stuff - missing unit
suffix. See spi-peripheral-props.yaml.

> +    description: Rx delay to sample data with this value, the valid
> +                 values are from 0 to 47. The delay is smaller than
> +                 the rx-latch-latency.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Drop $ref.

> +    minItems: 0
> +    maxItems: 47
> +    default: 0
> +
> +  rx-latch-latency:

Same problems. Did you check spi-peripheral-props.yaml or other SPI
controller schemas for such property?

> +    description: Rx delay to sample data with this value, the value
> +                 unit is clock cycle.

I think the unit should be rather time (e.g. us).

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +    default: 0
> +
>  required:
>    - compatible
>    - reg

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
