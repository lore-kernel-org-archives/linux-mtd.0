Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFB3C00140
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Aug 2022 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlQQv83iln9qgeJkKuGLrKHtQiiqDZ3keNLE+XxlbhU=; b=GCgYEdyUlJACbM
	62Dc2xLNd0i9oWoQvmQAHBJ283ryZBdt8wFcNJfVBS1kCKO5V6N6nh9e/m+QhnsZFbOeXcV11oDum
	7bsLNJwR9sEWDuUqmM0bNyXEI6So2fPLUa659CrZk+5OJo4GDtJM/P0fpJ0NhaSILnYvqAn969frQ
	7FYIfk1RYghgP8Pt0xsFqTzHOFcjVA5GweVMcZXs0ZaY+nnS6Gh7Ltx0Dx4zElQSHmg5ielb+eSdF
	bjc1n8tdbVBJt141dwaawlobVP1CT9NmrDC6moeWKY7r6IDLK4Iku4zpWYtuJHMTsCwzq6J4aLAK4
	FW/5FElnaBdogriiadVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIvIW-00G0Nm-L2; Tue, 02 Aug 2022 17:03:12 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIvIO-00G0HY-W3
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2022 17:03:06 +0000
Received: by mail-io1-f52.google.com with SMTP id 125so11099189iou.6
        for <linux-mtd@lists.infradead.org>; Tue, 02 Aug 2022 10:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=2FklMCvsf+IFL6IdQs89s38JLwJsvCdwCA9uElrwbhs=;
        b=PyDscrXfOHylh360L9hfsw2zqLquAtbKLaTeTlObZ4OJPvWuaySYBNsV0u0zFJHeVm
         HL221hB89VauWlI4aqZD1sjP8tzYDJjQYLjOIUlf1tXj6qHqdr3CKnevh2No7SGCH022
         i81o+lQNB0qRUMlBC/VV69z68gVPHUZa4PMit5501RmsMH5c7YUCt5YBrJpnkc/6SnZ6
         69Looyb1PGCXN5loTSikPr5Z7x+sohH1LaeXqniwT1usSzNPgbK4xHFq55ohfDEU+usG
         WnEA1ihZN4kzC5Ol05UjKVMms0IGN8QWcj8m0HyJN6mBQ7Q1qTvnmWtwopByA249/kOT
         odWw==
X-Gm-Message-State: AJIora+P2LsUxXYIX0jlDSk4FmBEGF+muLmkPQFDM3GRMKs5rIk8477e
	Cy4nZ0CPDrBPguWJrDgTFhNYU/UH6g==
X-Google-Smtp-Source: AGRyM1tbaN1sLhdrNh2TVrQLtic1f6Uc7wVbQREu84ol+jGbAI7KqCctkaE8hw2JA3Air2u+MzttgA==
X-Received: by 2002:a05:6638:d54:b0:33f:8e41:a3b3 with SMTP id d20-20020a0566380d5400b0033f8e41a3b3mr8841580jak.251.1659459783371;
        Tue, 02 Aug 2022 10:03:03 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z7-20020a926507000000b002de08fef8c5sm5721525ilb.43.2022.08.02.10.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 10:03:02 -0700 (PDT)
Received: (nullmailer pid 297736 invoked by uid 1000);
	Tue, 02 Aug 2022 17:03:01 -0000
Date: Tue, 2 Aug 2022 11:03:01 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Heiko Schocher <hs@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: microchip,mchp48l640: use
 spi-peripheral-props.yaml
Message-ID: <20220802170301.GA297672-robh@kernel.org>
References: <20220727164148.385476-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727164148.385476-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_100305_058309_C663E95D 
X-CRM114-Status: GOOD (  17.29  )
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

On Wed, 27 Jul 2022 18:41:48 +0200, Krzysztof Kozlowski wrote:
> Instead of listing directly properties typical for SPI peripherals,
> reference the spi-peripheral-props.yaml schema.  This allows using all
> properties typical for SPI-connected devices, even these which device
> bindings author did not tried yet.
> 
> Remove the spi-* properties which now come via spi-peripheral-props.yaml
> schema, except for the cases when device schema adds some constraints
> like maximum frequency.
> 
> While changing additionalProperties->unevaluatedProperties, put it in
> typical place, just before example DTS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Technically, this depends on [1] merged to SPI tree, if we want to
> preserve existing behavior of not allowing SPI CPHA and CPOL in each of
> schemas in this patch.
> 
> If this patch comes independently via different tree, the SPI CPHA and
> CPOL will be allowed for brief period of time, before [1] is merged.
> This will not have negative impact, just DT schema checks will be
> loosened for that period.
> 
> [1] https://lore.kernel.org/all/20220722191539.90641-2-krzysztof.kozlowski@linaro.org/
> ---
>  .../devicetree/bindings/mtd/microchip,mchp48l640.yaml      | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
