Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CDAC4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 09:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UvrdK2iJFks7QKmsxJdmQVWIXQi6mLpVMsRmaVCsaw=; b=Qhla6jzvJY/UkI
	8h3uKI8v5FxXamnTR7vguHSI9owxrAfcY39tv0zOmMK2y2zWewb6gJ5SEpxF/3l+vPlkpK24+1dpI
	SAP9W/4yBAAjcbjsynuykcodLwQ6Aw+/6v/3ujCd8Zg/WQ1F30m0txfX3Sd9iJ9iRbiB9LVnEinvr
	zFkMjSb1fxrjAgodTfJfR1EHxDgcI2ssH/pxPMgaTLLU72QKQYptReiMI4siIt9mJRj9Bhve6YtNT
	Kiz8wjH9KuJSaLD2dxElKXtD6kVlzciRhv1eB5sAHB8zkwbzDoe8zqEeBu/0Fk91Q6Wmcw8VI0Q5Q
	Mev7sBCGBFjszxUHCMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27QE-00GnJx-96; Mon, 05 Dec 2022 09:05:58 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27QB-00GnHl-Ga
	for linux-mtd@lists.infradead.org; Mon, 05 Dec 2022 09:05:56 +0000
Received: by mail-lj1-x232.google.com with SMTP id b9so12768997ljr.5
        for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2022 01:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GqNU7BdzxXArJ1hxutAZbvizBnSeo/vOF+Ym8qXlYBw=;
        b=ml1UTgwnXNIPc0W8ib4GfMRsHG60XL9gSKPj/qRbbV6GJkzlUj1At0dMUzoOFb60iW
         tb6annGiyDBjRt7m54+FeXCJAG1k6zyZpV4PZGuHxYm7VptGQ4HE5z/sdf0nd4XNnbM5
         mqZTLznBvYZ9IvNHoVEltgkurJq2dZTDmC3DBg6SerflSf29uDbJtRwzM6t2VzZKZeKH
         W3Hdrx+z2zDRhEmNvWjcF8C5cjMzT8oFOD2s9Yr7hkx7NoDA25fDHiauNl77Q6m3BHlu
         /XzYeQvCP1vLSSqEuf2R0EKAZk20F6w17K7jjdophOvRCEg7i+u82iAK96sKUi78Hro0
         PT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqNU7BdzxXArJ1hxutAZbvizBnSeo/vOF+Ym8qXlYBw=;
        b=Qc7tigcT6QXUq5IZ3/1zMwvdBjofX4gvxAUtL3qX92NQCyX60SYU0invam3AY7zU91
         LZl5cS3zalHILIJY5IMwDCzxTxrwv8XLTtCB3PrzWMrIRHBDIERqAq0dCRQGeVK0qHIf
         CrfUYV4lChiSZ0lxpGfuW/PMShsfnihD42LHH2lrub4BUfzXJ7kgMYNkWa8Rs8I0gU7e
         pb9vyoCmhAE/do9Te28KipSxaktLjtJV4/agq0IlkJ/kx/N2/eSH+wFl2hNkeskuUMHb
         iVEwROnqnBMH1WdW3EMPVXLc5/zkxssrQdQkYlds0OjdJnb9Jm6I0EpnmN97vWCdwHfU
         GbbA==
X-Gm-Message-State: ANoB5pnp5O3mEiHhYafuFxCUkosoBaFW55gaet/19Z+5HuWqjfDYoO/n
	uUV8qTGUvI3LrcBK4+rpZ4TmSw==
X-Google-Smtp-Source: AA0mqf70Cu3Bsc7Sg6w1pGgBN0DBMF+g70wtdk9SSpETzjM7LJKRxqb71DhL1ffyntt/+W0ANkRx6A==
X-Received: by 2002:a2e:a881:0:b0:26f:a855:c415 with SMTP id m1-20020a2ea881000000b0026fa855c415mr12377855ljq.443.1670231152713;
        Mon, 05 Dec 2022 01:05:52 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g22-20020a2eb5d6000000b00267232d0652sm1322528ljn.46.2022.12.05.01.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:05:52 -0800 (PST)
Message-ID: <3e141d37-497b-e9dd-44af-22ec57881b04@linaro.org>
Date: Mon, 5 Dec 2022 10:05:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 5/9] dt-bindings: spi: mtk-snfi: Add compatible for
 MT7986
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
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-6-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221205065756.26875-6-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_010555_614840_8500BD59 
X-CRM114-Status: UNSURE (   8.97  )
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

On 05/12/2022 07:57, Xiangsheng Hou wrote:
> 1. Add dt-bindings documentation of SPI NAND controller
> for MediaTek MT7986 SoC platform.
> 2. Add optional nfi_hclk property which needed for MT7986.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
