Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74408C433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 22:26:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC552086A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 22:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xgkIfcV5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC552086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CSlbdDRLsf+vr+QQqESsebDEh9NW9lktpEMlSr4gzvY=; b=xgkIfcV5Z7DSLTWxDVpAFhKUd
	LNLkaeH/JQNBAcwtpgNUKXL1pNqd3IPFksRrE9vDz4AkjWb0pFlIv1l2E1p9B1xzraiVVEM8envfx
	B9Gjwei7SxeuYXUHiRs9Bi8snuRSnIe8eSoK7meVPRa7aIouMQSfTGpo9dPJJfYvUqBKimOXSRLcs
	fAqX5RNlBZ3gafqj9XqYtcbfAnoyV+ZSJzpNBaKXsHSNaYT83laX6ToyEyo5RiRzeCTp5SDRd+0aU
	aX0ga4K0YhRx3ii4ByY1QyDPU5U6Xks0gGwXc2Re3I2Q8DLS9W1Iu+ObPCB4140jGkR5MkhMzfsAr
	krwNTtLUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBmp3-0005zJ-1s; Fri, 28 Aug 2020 22:26:13 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBmp0-0005y3-9R; Fri, 28 Aug 2020 22:26:11 +0000
Received: by mail-io1-f67.google.com with SMTP id j2so602187ioj.7;
 Fri, 28 Aug 2020 15:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4duqBmGrOIE5h/MJFYsH8A08MjLB2XqWQDb7B6Dfs74=;
 b=Y9xYQBwNNhmRFSOsDWDznwKue6/VZ7gDbZWX6Zymn4EP9H5qMLVlm//aw7YGXywoPu
 /8lxQBlt1Us35eka8qJjB35qk7FpA6nCgyglKHCE7bvxWU3vdBIkU9aJyESCyz88kr+I
 h4fdwvWXwwko/+ljCAi2C6gR+rK1ozrVJyQc6M8qUCmc3rfN0DyD83eYQAqFQj7g4LNb
 B1wgos23Ff4O6+pWaCvtGjrs9PSqqyaghqvkmMPiyfFOk9XcJgQwFY+DlyKoge+J8ur/
 HnhbKzOpTwpOetLDpF4IJ5ap4cI0baKUf40fL26RZQdo6iaFS4bXMpB0Ph3PlsWCqsCH
 g+zw==
X-Gm-Message-State: AOAM532bQPT0xQfcFKWreYaTG/e6PT0InFDRgzv4KJ/dAoHHS0jxFrl3
 PXkUwRNeylpq/fnw1NDLlw==
X-Google-Smtp-Source: ABdhPJyWo64sqjslBZ2g1+ACJ1BfQG2GiCxOUhoNMkowfb9iLK/cF8i/5RAnmdqpHsTGdOTEKzSrEA==
X-Received: by 2002:a05:6602:1589:: with SMTP id
 e9mr699348iow.85.1598653569509; 
 Fri, 28 Aug 2020 15:26:09 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id y8sm255986iom.26.2020.08.28.15.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 15:26:08 -0700 (PDT)
Received: (nullmailer pid 3514602 invoked by uid 1000);
 Fri, 28 Aug 2020 22:26:04 -0000
Date: Fri, 28 Aug 2020 16:26:04 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 13/19] dt-bindings: nvmem: imx-ocotp: Update i.MX 8M
 compatibles
Message-ID: <20200828222604.GA3514520@bogus>
References: <20200825193536.7332-1-krzk@kernel.org>
 <20200825193536.7332-14-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825193536.7332-14-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_182610_425615_DCDE6DE1 
X-CRM114-Status: GOOD (  12.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <frank.li@nxp.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 25 Aug 2020 21:35:30 +0200, Krzysztof Kozlowski wrote:
> DTSes with new i.MX 8M SoCs use two compatibles so update the binding to
> fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000: compatible:1: 'syscon' was expected
>     From schema: Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000:
>     compatible: ['fsl,imx8mn-ocotp', 'fsl,imx8mm-ocotp', 'syscon'] is too long
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000:
>     compatible: Additional items are not allowed ('syscon' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Remove moved compatibles.
> ---
>  .../devicetree/bindings/nvmem/imx-ocotp.yaml  | 38 +++++++++++--------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
