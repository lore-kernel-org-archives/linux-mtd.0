Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60232C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Dec 2022 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+CphWpfZVK2eh7tzklRlv8VT3B1TETSqGhwPgeV3ZA=; b=MwjHd1ZPbUmSTt
	ShufZFVqfhOUiAztnDF8TfF2D/cHbtkILiIVGzHadlF2ITphXL9weBlnX2ZPmWRz+rqbUHqs6k3mj
	CIyz4GuqavA4WU9UTkb649Cx8mBSe40HTbCG76EKNdS/iN2RqsqelwSgMLq1dqZ92miW4z+mOEywC
	XXPGpgE+pFD+TQZ6CmmzdL0STEgc1eMcwtYYQANm5ufb5/1a+rH0xm6pPWEs33dJ2QkxtcA9HPUfR
	HlXFYnoB8CKH/tFD43XzG4vgT8R7PD8t2aBQS7Bo2wXI3CuQDzEjtS3+O3XZFQX8kVnHtIHPIoXir
	3J655kr6uhGNR0h13BfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Ji1-00GaE3-RD; Mon, 19 Dec 2022 17:13:50 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7IE3-00FUuc-Dp; Mon, 19 Dec 2022 15:38:49 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1447c7aa004so11914022fac.11;
        Mon, 19 Dec 2022 07:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOiCy0WjVxH8DVieLn08mRiczm9EV7y8BSE0KN+iAsY=;
        b=lBk2hQU2NtdiOZxSxWh++lUvfeJzRO+YxdwRadsJHPaPvLix/yyNaOeCX15JYYpNLY
         H4Bmjec8bCAzZjx9IrvdH9d/B98to/6jFKBWfZSBxbx2t6soCz/3Ql+v7a72sSYExzdF
         +0AfRQP8QHF/tmm6OhwlDB1GolupcFtSXSQKwV4aRFEY3v1lLeYBg6u2UfzBcPHzgaMT
         Sxz4AKzoqB+Sm1yi0/Hz/vCfwyH2RuAOFNIevEPRnLO5qyfi1nd+fHyxMvxjIR7etylX
         cgGUb1iTE4pqf51R+m3h40gVDGUvO4FDXnFBnX+EEcKSjlBh6aeH46fupPwCKaYbd5X3
         Os2w==
X-Gm-Message-State: ANoB5pk4N+DMb0oFEr5ibwDqN30+cI8jhAWgf8eOCuzHr7O1skbEQpcT
	GRueops21OwwsdRzGQ6BFQ==
X-Google-Smtp-Source: AA0mqf4x/VJvpocUXMYkW+FznjpJCn7AIX+ML2f8QWtAFUzzyWkj/yArsDdRcpF8jQ89ySsWI3scNA==
X-Received: by 2002:a05:6871:784:b0:137:3adb:9149 with SMTP id o4-20020a056871078400b001373adb9149mr20697434oap.16.1671464318860;
        Mon, 19 Dec 2022 07:38:38 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z21-20020a056870e31500b00148316f78fesm4870553oad.2.2022.12.19.07.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 07:38:38 -0800 (PST)
Received: (nullmailer pid 1431223 invoked by uid 1000);
	Mon, 19 Dec 2022 15:38:37 -0000
Date: Mon, 19 Dec 2022 09:38:37 -0600
From: Rob Herring <robh@kernel.org>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, benliang.zhao@mediatek.com, bin.zhang@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 06/10] dt-bindings: spi: mtk-snfi: Add read latch
 latency property
Message-ID: <20221219153837.GA1426412-robh@kernel.org>
References: <20221219024019.31974-1-xiangsheng.hou@mediatek.com>
 <20221219024019.31974-7-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221219024019.31974-7-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_073847_605451_EE12516C 
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

On Mon, Dec 19, 2022 at 10:40:15AM +0800, Xiangsheng Hou wrote:
> Add mediatek,rx-latch-latency-ns property which adjust data read
> latch latency in the unit of nanoseconds.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> index bab23f1b11fd..1e5e89a693c3 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> @@ -45,6 +45,9 @@ properties:
>      description: device-tree node of the accompanying ECC engine.
>      $ref: /schemas/types.yaml#/definitions/phandle
>  
> +  mediatek,rx-latch-latency-ns:
> +    description: Data read latch latency, unit is nanoseconds.

Doesn't the common 'rx-sample-delay-ns' work for you?

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
