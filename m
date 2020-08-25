Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E1CC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:41:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C110205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JNBShE9u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C110205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=owf3kEWQKv8NY2otKth64rO1afaSxoT2kTPceWkQDjs=; b=JNBShE9uMoyyAUxXYpDB1RHQj
	STuI382TG73fcVDIBAKWNAgbCfWXZwwQD0Q5uKcdbpnwI7nQw+xzJoGqd6vXAq6bee60HW3gnl0vl
	M7hTgPHs3hu77a/tvC1wBilh5vfRe4/g6moQwtqelOPMNPf00MgwGVh+nlIM7UNVUSqzbBbFct+9Z
	CtAR5boGEO137JM3Yud3UklweTtqdjXEqPu7KZDbJUM/Jcqv7ONCoippKTlEFUt+VwEMI4o1goNeB
	9tj7ReXLQrGq2OTZSBlUxQTgRLs2zsFbm+bDwEhHZ/5sBo7Ycv+2KefNrzp5gdoBcAu/gCgbS3Qx9
	fojpWY+DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOsb-00076L-2w; Tue, 25 Aug 2020 02:40:09 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOsK-0006yg-GU; Tue, 25 Aug 2020 02:39:55 +0000
Received: by mail-io1-f66.google.com with SMTP id g13so10942781ioo.9;
 Mon, 24 Aug 2020 19:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kXuWnJNB67f0o67uiEbC7HbpqwuSzXePhD/ymnLVPqY=;
 b=XW0tBBG4VFqkiVqdMsUWpkuAoIPW7Fi7CNeGF2QLVkg6oQPoZ4G7/7FxIQztZ9VZpd
 +uIK7P4gQIEkU607uXywwN6SFIC9YAotDi4qbKDsoXls8q4ODo5LpbrrfZVusdLcaBmi
 CrhENx3a2DD+SXhSpq1BPAQJjQU89pE9fPxzl2jvzM1+unP+9XrdjaZApryNsunOEtID
 1pNYFZeMEwPkFB7wmA5qa0WBjJTErnCcqX573RSe0e0+E8ahLoejj3xziJQuB9f4sojI
 cVvmajQpoqZSq3RfIMTSUxRHdyndLmls3JpzSeZZvpzsgRSljfmFHXL2nSr56o0E4blF
 9Zpg==
X-Gm-Message-State: AOAM533uDthMbdt2iuJbF21Z6o2znNWHYNPEcbl1zWoyAE8XjLKRSGb9
 l4UfRQ0ux3E+nwCH1f6pzg==
X-Google-Smtp-Source: ABdhPJxunBFaPfYMd0plcVp+IODN52lxJO2aO8iTYtSEHhuOcGJcr0KWWpF0lNocgFZ9g/NcpWXOog==
X-Received: by 2002:a5d:9e59:: with SMTP id i25mr6647752ioi.99.1598323190334; 
 Mon, 24 Aug 2020 19:39:50 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id q17sm8274459ilt.10.2020.08.24.19.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:39:49 -0700 (PDT)
Received: (nullmailer pid 3839847 invoked by uid 1000);
 Tue, 25 Aug 2020 02:39:46 -0000
Date: Mon, 24 Aug 2020 20:39:46 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 14/19] dt-bindings: arm: fsl: Fix Toradex Colibri i.MX
 8 binding
Message-ID: <20200825023946.GA3839685@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-14-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-14-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223952_676572_5B4E032F 
X-CRM114-Status: GOOD (  12.93  )
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
 Will Deacon <will@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 18:26:47 +0200, Krzysztof Kozlowski wrote:
> The Toradex Colibri i.MX 8 Evaluation board has two Toradex compatibles
> so it needs separate entry.  This fixes dtbs_check warning:
> 
>   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml: /:
>     compatible: ['toradex,colibri-imx8x-eval-v3', 'toradex,colibri-imx8x', 'fsl,imx8qxp'] is not valid under any of the given schemas (Possible causes of the failure):
>     arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml: /: compatible: ['toradex,colibri-imx8x-eval-v3', 'toradex,colibri-imx8x', 'fsl,imx8qxp'] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
