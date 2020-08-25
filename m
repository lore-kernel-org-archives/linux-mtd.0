Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE25FC433E5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:34:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C7DF205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n1huVZj4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C7DF205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pbQo0hiGtXmFHvOryqzDyqmxTc5JsRUSe5NuJUsqEcg=; b=n1huVZj4QGYZ+7LvuPjLYiO+5
	ghMUUQXeAxVn7iblxTAGkdfAxG8TfL/cbZfTP9Hy4e+UdYKwVUM50FeFf1kV+F2tbAoUoLg0gkTEu
	bQzTCHbzyunk6C+3nLx2qXKO3BJMfweyDrqYZEMfqa1qZ8k7YxcZiWJz1o1hBSVuGy1Cy0R+ZjbWN
	okUXkYXOgggcU3p6+bKE2pihF8ZkPk+vxxNMhOHZVZgTQC7LIa2ED8UOdvT4AiwNi8nrpyZOHrxfM
	FQ2ndO4TQQmez3v5SXdrlgYfQ8BE2QocQcm+AT9FKwagikGDgDorU0BAHQfCbWqw3PGNe0qWhYac5
	C29I49fgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOmH-0003l0-S0; Tue, 25 Aug 2020 02:33:37 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOmF-0003k6-Sj; Tue, 25 Aug 2020 02:33:36 +0000
Received: by mail-il1-f193.google.com with SMTP id v2so9155540ilq.4;
 Mon, 24 Aug 2020 19:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n6zcl9nCoEQ0u0eLSFawMmRGQMStZIBzVgwtuG2w1Uk=;
 b=lO3s6HiXyKvm8UID3KdwbNmiya70WXi5xH9J+drOHZPjMmkM5t4nfDyLW9RpIAfPsK
 TyTIgGQlS4w+0AvG3IiwKXoTytVvUHThSGRCyRVJHBE7rntV2QDW+CHA09m8v0+Kj8IZ
 RD5Av2TKwHiSAYDrOece36not8MWT51fqeE/wcVIJinCwlppudiw/IxS2h86bGolj4WC
 YqauoS5TSGIgijwfW9rwhJ21g0+rkM3gArZIlLGCXeGHzZaJzy36N4Wp71SfFUDlKywK
 vlqxC8itFwtQ6dfZS+P2WUXIsshnAVnckvtDPkcbMZYIpqda5p/9my2BTEE+v7YubDEh
 S2vw==
X-Gm-Message-State: AOAM531ZJUZdDjPUv55/ZGXyNOCGPTZ6FYcsIISOaBQvm0d/E9z76P0k
 /AET2N6W3c5d9FHZYy0lKQ==
X-Google-Smtp-Source: ABdhPJxzDQD6UJS360OlRuKUPGDi0iweRSbnDXeLDCx5d6itJYQulbCHh6htCI6mNplUOHjpRzWzMA==
X-Received: by 2002:a92:c502:: with SMTP id r2mr7831142ilg.223.1598322815457; 
 Mon, 24 Aug 2020 19:33:35 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id c90sm8514073ilf.30.2020.08.24.19.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:33:34 -0700 (PDT)
Received: (nullmailer pid 3829020 invoked by uid 1000);
 Tue, 25 Aug 2020 02:33:30 -0000
Date: Mon, 24 Aug 2020 20:33:30 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 04/19] dt-bindings: gpio: fsl-imx-gpio: Add
 power-domains
Message-ID: <20200825023330.GA3828938@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-4-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223335_962912_66D6E525 
X-CRM114-Status: GOOD (  12.99  )
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
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <frank.li@nxp.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Will Deacon <will@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
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

On Mon, 24 Aug 2020 18:26:37 +0200, Krzysztof Kozlowski wrote:
> Parse also optional power-domains property to fix dtbs_check warnings
> like:
> 
>   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: gpio@5d080000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>     From schema: Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
