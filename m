Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31777C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:42:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52EF205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:42:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Phk7oqPq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C52EF205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y9mwwq1QyZbQnYu7b3cUHE7XJ8bnWc3UJHKI2wZPmew=; b=Phk7oqPqTpmF+fuWeUCn89lgU
	9/tWmC+8f+xZSdKCmu2oVNOyyDFOC+jy9vdnegCV+NAe5fMaEtsF4dSx50C+8itoU9RZw5oaLBDh+
	kdeBIjBekgfWGv7LwspEzX8Sky2ndGCQatTaFGFaJdEj/dS6J7Q68Sv/9Guk9zJampDYfW1hpKI+w
	a6q5QyX14Z5oakSTx8jpIHivv8dUh8pT1/F2tQhjo+A4SF+oZP9uUZyHGUjWrHr1oxBkKsf51bIMs
	Qf1VsuNlxItDGhpe/OfmSibwkm5cUqVrUU3we/FNxe35wqallnGK8UE3sW2STWEW27zAoENXvShuk
	GR91hpDGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOtx-0007ns-OW; Tue, 25 Aug 2020 02:41:33 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOsk-0007BI-Oh; Tue, 25 Aug 2020 02:40:20 +0000
Received: by mail-il1-f194.google.com with SMTP id t4so9178893iln.1;
 Mon, 24 Aug 2020 19:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DBbGNGBjMQHX+/0e9zWJwieDwZ+vk9KNeNFH7XE04vU=;
 b=L47Gu29WU1Ha3NoI3yCnfPK7/yuQIsDpC8/dYMciXtzNprt2rvM6yN+kFoseYXZFCi
 80PsiNf9dIoUHkXIP7v6/GrP9JTgK88A59PG67OPywe7tI5+9G48qkinP/TAf2pLYvGg
 q6B32vEb0Sq/LiQTsttSdj9MwABGHYOZRJfCTt+lR7bZXMKcChyZ6lJ5ZSXB5oCpuwV6
 eqGihoF4KPbSYLDTvSgqLSnpe5zt2elNmh2alntEXkhQ2R6EByXRDPYwWAmjhj+XdiQ9
 nK8+52j1S3Bov9+D1naTroSvyAObHAH/Sj4logzJqrWvuIrY9Oq9iukgLUh45GjGBPRP
 Q7Dw==
X-Gm-Message-State: AOAM530moFbQcUKDtdCf6RN921x3097YipREnMASUEyuoFD50xmnmved
 hQpVzKRHXz77csuGd6Z5eA==
X-Google-Smtp-Source: ABdhPJxkF97gjn61yOeKwZGd4PsRdtUbaNMPNP/yf7yzDKVCZ/CBJvhkxZR1uVkBoPp55VowvkrYIg==
X-Received: by 2002:a92:9996:: with SMTP id t22mr7169891ilk.216.1598323214649; 
 Mon, 24 Aug 2020 19:40:14 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id z1sm8310046ilh.13.2020.08.24.19.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:40:14 -0700 (PDT)
Received: (nullmailer pid 3840594 invoked by uid 1000);
 Tue, 25 Aug 2020 02:40:10 -0000
Date: Mon, 24 Aug 2020 20:40:10 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 15/19] dt-bindings: arm: fsl: Add ZII Ultra boards
 binding
Message-ID: <20200825024010.GA3840543@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-15-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-15-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_224019_246479_67565D7A 
X-CRM114-Status: GOOD (  12.60  )
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
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Will Deacon <will@kernel.org>,
 linux-watchdog@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
 linux-arm-kernel@lists.infradead.org, Fugang Duan <fugang.duan@nxp.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mtd@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 18:26:48 +0200, Krzysztof Kozlowski wrote:
> Document the binding for Zodiac Inflight Innovations Ultra Boards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
