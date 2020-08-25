Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5DBC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:37:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D79520738
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:37:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pxAnBDvI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D79520738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d+tUja2Pnk58WYHrzOl3aEZHbylYbsqf93d9cs+F9/g=; b=pxAnBDvI0Cfv7luSuSVaRsykA
	52DtI+0grUn2ubFvLLCAsRIsQ82/c71kaUO+26FqLNVSTtHCvSDuxiRK3JjA3NBPbr+tlZel0Lex6
	ILxAqs8EtGtGH5EgBO2CvRMc5fIJSzMQl1cI+skk3hRcrveJQQmhecBjzgabEMJ0jLikBpv6RUl0o
	d/g7N3hWjYeADTd8n8vt5nlFnk3Cw/i7wBIkkV4HmNIkggg0jQK5+vQQaW0E2gm1K9NJV9hZzastu
	4aKIzfGC8+xmMiUbRj87gRSq+6+46D5r8kKMZdxvL1I5Z7oVjfHVu34TG5oWJiskGjVnHMURO3nQA
	ypewO1VLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOoh-0004yt-M4; Tue, 25 Aug 2020 02:36:07 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOoc-0004wK-D9; Tue, 25 Aug 2020 02:36:03 +0000
Received: by mail-io1-f67.google.com with SMTP id u126so10913540iod.12;
 Mon, 24 Aug 2020 19:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mQ/f/ktHuo1XxTsZxthGryHuQelRFo2/zrEV3gWiCCI=;
 b=EwPr6QkNhYM6u+hdWPDxMT5Cl48COf1xDzQjOR6TfhNoEFkqGJVOJkYtveVFxc43WI
 aVkR8nWwa6x00WH6X2p7E6H64uei6eAKat5MLcPfmC+5AtNKwr9dFzW+PlxsoybzNy72
 jE8PBxkU6VNAFL+dEf9cg4E1FG6FzvBMHMd+VmvrXks0KtKIY305db473ua5mMQSedjC
 KIX/m6Hc8cRFTZOOypOL/KZrJg1xNB4dgUhWy/iYM5TvTz8jQsprWvztP5bxEMMzcALa
 MMCjUPH+aKDzbNVzTKV6DzQD1hwDgVHWV+ZYOD2WvkGyASjbZSLlgV/DQ9n/2s/3/aRo
 Xabw==
X-Gm-Message-State: AOAM531S8kkr7o5QW/7vrrwenY+Iqx84McqU1D/eBFLB42qGF/qkfbss
 /dgG++44r8rxvE8/aUOcIw==
X-Google-Smtp-Source: ABdhPJyqr+8XB4kd9Ht8ECj8oo1spWYjkt5y3c5arw85YNAcQmOqVROEEoEukdDbTOXBxw8fo47EXA==
X-Received: by 2002:a5e:df42:: with SMTP id g2mr7297543ioq.117.1598322961781; 
 Mon, 24 Aug 2020 19:36:01 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id s143sm8568791ilc.14.2020.08.24.19.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:36:01 -0700 (PDT)
Received: (nullmailer pid 3833404 invoked by uid 1000);
 Tue, 25 Aug 2020 02:35:56 -0000
Date: Mon, 24 Aug 2020 20:35:56 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 09/19] dt-bindings: mtd: gpmi-nand: Add i.MX 8M
 compatibles
Message-ID: <20200825023556.GA3833348@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-9-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-9-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223602_592659_3EE99F10 
X-CRM114-Status: GOOD (  13.25  )
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
 Fabio Estevam <festevam@gmail.com>, linux-watchdog@vger.kernel.org,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
 linux-arm-kernel@lists.infradead.org, Fugang Duan <fugang.duan@nxp.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 18:26:42 +0200, Krzysztof Kozlowski wrote:
> DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
> to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: nand-controller@33002000:
>     compatible:0: 'fsl,imx8mm-gpmi-nand' is not one of ['fsl,imx23-gpmi-nand', 'fsl,imx28-gpmi-nand', 'fsl,imx6q-gpmi-nand', 'fsl,imx6sx-gpmi-nand', 'fsl,imx7d-gpmi-nand']
>     From schema: Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: nand-controller@33002000:
>     compatible: ['fsl,imx8mm-gpmi-nand', 'fsl,imx7d-gpmi-nand'] is too long
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: nand-controller@33002000:
>     compatible: Additional items are not allowed ('fsl,imx7d-gpmi-nand' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/mtd/gpmi-nand.yaml     | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
