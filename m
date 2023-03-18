Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6062EC74A5B
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Mar 2023 07:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KhEJcuskoWeW3PpXEs+BBxCt9gDTlYgdQPVp8/MzDU=; b=MmQHsRg7KwzGRj
	nodIDHP1sgO5UaQonJFwEhxcR8KEgtw9CxYPO4ZEbcpirC+9N9Dlh6R6s8KRSPscQITw9MQflOrSL
	+EZhsiLRrg8NWhx2/zod3086rYCeKtcfrEsNWhBi3bj/LOsnqSnKQQ3OXYfrYYYQ/Zi9/GooGPPJ/
	ax1s5ho6sFPwsHQaVEKcZIN2YozZSEXjyAdpRFJYYudxAdReyoR6cCJUDTWtS5QGsuTYWC0cYimAf
	E0aQR61B8rozdpJtjEcbvy5ZNcLpcSrPTWvIx3383fAlBMatKMULjiVhOUK5OBcYFVLXeX3dlqqIs
	LEY8XM42kdANXVhktGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRSP-004NER-09;
	Sat, 18 Mar 2023 07:58:29 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRSM-004NDc-0p;
	Sat, 18 Mar 2023 07:58:27 +0000
Received: by mail-ed1-x52c.google.com with SMTP id r11so28600409edd.5;
        Sat, 18 Mar 2023 00:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679126305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9kflyUcTWOTgsVwiqFTEkSUTt2K/ujv6iGh8wMMvAQ=;
        b=l8plMcCPzCZtCNBthUUK+41tDhVCAYgiH4aDsOcZpsnNoPr7C/IrE8GTOruwU897mZ
         JaFzYC1xuFQbMuOgq1+bng+0aR36hJWmPqLSFhmKuyOTBudmLiXxMFYXnwI7FqBkc0C/
         KijF8RsXZAnLuJNiYSZc3jjb1GsMOa3S4OuebkTMfdl14Nf2n+jgP6I0ts0jkMeR3Je6
         Qu5DXuVxIdUyOGz1tjqXbgSIwXHtwHblbzl6RD0Eb/yJSHYCABe5+OjPiUng6ZFyP3j8
         0PtPN7vtg6WQNAUlLzoNUBhwEl7KO+/nkOQIPGoSqM7aAr2o9PLP5/SQseXuUYl6tPZk
         dmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9kflyUcTWOTgsVwiqFTEkSUTt2K/ujv6iGh8wMMvAQ=;
        b=iw77iNAgikmuCB3G6DCAAmCsefJr6uFd29iUgu1hU0eRT+JQHvlkNRFMejGXMWTi5v
         ly9AUwbYpGxa6PaTDUpfOj42By6Q0Vf3bWicTis+j0UMdXm2MQhUAFAMqCKSOf6EXt0T
         9TzY+1rE5BD0xvX4PfTn6hA6UBwC2pMjehYPOEyi5xMl6ROd03DkAsnUgU5WQStyk8HD
         U6eG8uDcetJ2holz2lNQDXgoazVutCTrcsW6U4xRnzbQpRSUjYl14UgmS5IWZWXMUibP
         hwPUDxRfW02z3r9R19obFCHR5OrVotI475C/ciaEBoCQ9w8Ab6323+4bsVvjuRljhhwg
         MMmg==
X-Gm-Message-State: AO0yUKWXOSJnk4TWhwxQ7ZvKvXmupxvBaQD9khlDL4CKwW8iI5nrg3xH
	3aY67jR8tAX+ORYVo+AhBXc=
X-Google-Smtp-Source: AK7set/+wd8GvkU+GWt8EQFwAYDXiruK5Y/G5wh4Q6eZzERrvFCmP2DEItDmgOokh3JCyB3Wf3+HYQ==
X-Received: by 2002:a17:906:4c8b:b0:8b1:3131:76e9 with SMTP id q11-20020a1709064c8b00b008b1313176e9mr2597465eju.46.1679126304867;
        Sat, 18 Mar 2023 00:58:24 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o7-20020a1709062e8700b00933356c681esm374615eji.150.2023.03.18.00.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 00:58:24 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: mtd: Drop unneeded quotes
Date: Sat, 18 Mar 2023 08:58:22 +0100
Message-ID: <2275127.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20230317233631.3968509-1-robh@kernel.org>
References: <20230317233631.3968509-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_005826_292878_0CDC65D7 
X-CRM114-Status: GOOD (  10.43  )
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

Dne sobota, 18. marec 2023 ob 00:36:30 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml     | 2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/mtd/arasan,nand-controller.yaml       | 2 +-
>  .../devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml          | 2 +-
>  Documentation/devicetree/bindings/mtd/gpmi-nand.yaml          | 2 +-
>  Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml  | 2 +-
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml      | 2 +-
>  Documentation/devicetree/bindings/mtd/mtd-physmap.yaml        | 2 +-
>  Documentation/devicetree/bindings/mtd/mxc-nand.yaml           | 2 +-
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml          | 2 +-
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml    | 2 +-
>  .../bindings/mtd/partitions/brcm,bcm4908-partitions.yaml      | 2 +-
>  .../bindings/mtd/partitions/linksys,ns-partitions.yaml        | 2 +-
>  Documentation/devicetree/bindings/mtd/qcom,nandc.yaml         | 2 +-
>  Documentation/devicetree/bindings/mtd/renesas-nandc.yaml      | 2 +-
>  .../devicetree/bindings/mtd/rockchip,nand-controller.yaml     | 2 +-
>  Documentation/devicetree/bindings/mtd/spi-nand.yaml           | 2 +-
>  Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml | 2 +-
>  Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml       | 4 ++--
>  Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml    | 4 ++--
>  19 files changed, 21 insertions(+), 21 deletions(-)




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
