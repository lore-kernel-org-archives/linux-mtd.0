Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BB2C001B0
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jul 2023 16:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaUBTF+WqCsDpPvdiHEriGKKt6ygAwXzL1oVSusmtaY=; b=LBBl8ogM4YpNca
	GR3goLf00hJT2q7bCLELzEQy6la/LounIbft5vOrBI+uOuCMNQXUKNHF3/0teqCEPOs8gvxdvMM0c
	pEd4IbyzTmcpab1p5PlED4A67gy6MbkBvgMG8+spWDLBH5ykPJ0Cw8RCO2FkF1bS0hPWmH8Gi+XWV
	Jn1cYpmqT7W1nRnZ7c4Y5GOimXrvXpaiA0ZvD83qubiIC16ZKh3tpeZtze+jjMrCPl2gg9rg5Y8Wh
	a6CBXrDQZJiApHckj2zk5lptrFB0jFuJOzxQWYnYX1eV2mp1iTgqcMn+s8d+S5xORCZEqllm7Qc/5
	YhqkNQ2fRew29GC2jkJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKLWx-006dLb-0E;
	Fri, 14 Jul 2023 16:20:31 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKLWt-006dKp-2O;
	Fri, 14 Jul 2023 16:20:29 +0000
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-786bb09e595so73532939f.1;
        Fri, 14 Jul 2023 09:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689351625; x=1691943625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ks/N8qO3TGYZSSU8M3e1qV+E67ZahtCJLwxQg7T5z6Y=;
        b=KG/wQZymf9zHeUAWg6IpTYkdX/i8afhsqFd7FSEqpjRNGhtt9wZbKwenT56ITnnL9n
         Kd+lfp41YbQR9ok6uI/JXVC91U9kfNF0Yw3Jc0v5mRvEX6dENL6BIRyrGtlBdvU6ySD9
         txVvXfO4eVGzBAaxkVEExNibDUxMITkJw6V3WXuRtHUWbPTekodhzEQgzCPhqGs1cdlz
         WR5mhyoFO10NO3+xlIMt6RHLWbEmYIYYUyQreVelhSFCQaQwbV9sBmt+N7jCMyNX02xp
         Q9sdTGnESppaGecxCtPGhCcySYwMZpNBuULSC0UVZiTlgz3nWca3yhYraceVLMwbTIXh
         KaVA==
X-Gm-Message-State: ABy/qLZKXme56m7Gw3ZQmLtWNAemtrLS/HokI6INyC3hZ+IXL7cLZoFU
	to/TvaiSx1Jjg+wkcmwcs/DaeIg3Tw==
X-Google-Smtp-Source: APBJJlHfUJOPb77/ZakiHQ7/15o5r47CcF5ODwjLT23eGq28ZdiCY+FAsp/pZrrMo8lGwTb9HK1bew==
X-Received: by 2002:a5e:c602:0:b0:787:147b:b54f with SMTP id f2-20020a5ec602000000b00787147bb54fmr2243528iok.3.1689351625671;
        Fri, 14 Jul 2023 09:20:25 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h2-20020a6bfb02000000b0078680780694sm2744063iog.34.2023.07.14.09.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:20:25 -0700 (PDT)
Received: (nullmailer pid 3945795 invoked by uid 1000);
	Fri, 14 Jul 2023 16:20:23 -0000
Date: Fri, 14 Jul 2023 10:20:23 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Hauke Mehrtens <hauke@hauke-m.de>, Vignesh Raghavendra <vigneshr@ti.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: mtd: Add SEAMA partition bindings
Message-ID: <168935162277.3945742.14750868917438308947.robh@kernel.org>
References: <20230713-seama-partitions-v4-0-69e577453d40@linaro.org>
 <20230713-seama-partitions-v4-1-69e577453d40@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230713-seama-partitions-v4-1-69e577453d40@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_092027_776978_030A7D22 
X-CRM114-Status: GOOD (  12.22  )
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


On Thu, 13 Jul 2023 00:16:41 +0200, Linus Walleij wrote:
> This types of NAND partitions appear in OpenWrt and
> U-Boot.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Drop false flagged cells etc.
> ChangeLog v2->v3:
> - Drop reference from partitions.yaml again
> - Drop select: false
> - Use unevaluatedProperties
> ChangeLog v1->v2:
> - Fix up the binding to be childless
> ---
>  .../devicetree/bindings/mtd/partitions/seama.yaml  | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
