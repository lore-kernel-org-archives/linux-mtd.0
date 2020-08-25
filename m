Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB44C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:44:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73456205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ukwBvpNr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73456205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z46DVxb+W2ObQOg+4JKynIrxvTRXPpy7wo1VafYHdZs=; b=ukwBvpNrx/dN9eZ5Qs+LupxPC
	rLbyDcHu7tPvMBwgP6GPjqH9Xqabfruq5oL0dUC2cIc/qtsKZTdlVnl/EpFiiILtEvxjMSWen1WeC
	xcyqP96XyQpzq5ivyrB8O6ANU7o4nfx9AFdWYPetZPgNr5FOTkmybJxKcafPmwlYuk4JKfIbDP1kO
	kNy5eWXotrxMl+YtEII67pp6cPguKJ0BL+AtiUq+OxMw1bPypTTQgDa8fOGRwKdoA7EdzxIt6ZOVH
	I8H/45/y/zBuCsk1As4uOgfbhkc3dB5x0hrisJYttPGdcLgzIFsumBqixiN0Ez237FkziqV5Gu8WC
	JokrjJ17A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOvV-0000Fb-0i; Tue, 25 Aug 2020 02:43:09 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOuO-00085R-R0; Tue, 25 Aug 2020 02:42:03 +0000
Received: by mail-io1-f66.google.com with SMTP id b16so10969485ioj.4;
 Mon, 24 Aug 2020 19:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8qJ01SWGuBbiIyJmwzW9cEQYUGRbCtsSrpYWxMtrlig=;
 b=qZDrrK+1UbIRf3vS8y1yXddsu3VSlQH61s9vkMeR9xvEtXmstjFmz0bzzq+hQAoi9I
 pu2ihMfG4W1gOOfndIPeW98nunHAa3/AZC6UKGc7Gl0AfvZfW4irHQSgeKBrpikbK1jH
 VS8pCtHlAWTvnjU/1lOF4AUDDAvafe390Bobyg9tSXgtiHQhkotItESpj61QzQlxdiRF
 EFXR6Fv8f/hKDmkJvX0zSObXrZLFPRE8sqfBRPG/4gtYubLq8kfybNg/P+WjsYp7Phg2
 EVo/YOYAOjyKIPYKLyZ5zsVePCv1NulBrneKpHswrRDLskqBPuhYg8QVRs1TIo6z3i7p
 F1hg==
X-Gm-Message-State: AOAM532DgwngBZcQD6lBZMzIG2RrHB8tsaRWLbmao7K+uxMvpbNKIae+
 tbn59cGpMgaCrOQWdxwhwA==
X-Google-Smtp-Source: ABdhPJwIoAEUIJKIMwDQPWHs0k21rGkfs3GgLpmxkM2yHKbA+qx6fuPAbJw+Rlnd/ohVZnSP58F7NQ==
X-Received: by 2002:a05:6638:130d:: with SMTP id
 r13mr8168767jad.89.1598323318518; 
 Mon, 24 Aug 2020 19:41:58 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id r2sm8321197ila.22.2020.08.24.19.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:41:58 -0700 (PDT)
Received: (nullmailer pid 3843521 invoked by uid 1000);
 Tue, 25 Aug 2020 02:41:54 -0000
Date: Mon, 24 Aug 2020 20:41:54 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 03/19] dt-bindings: gpio: fsl-imx-gpio: Add parsing of
 hogs
Message-ID: <20200825024154.GA3841561@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-3-krzk@kernel.org>
 <20200825023306.GA3827348@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825023306.GA3827348@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_224201_083567_F1BF10BB 
X-CRM114-Status: GOOD (  13.40  )
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
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 08:33:06PM -0600, Rob Herring wrote:
> On Mon, Aug 24, 2020 at 06:26:36PM +0200, Krzysztof Kozlowski wrote:
> > Allow parsing GPIO controller children nodes with GPIO hogs to fix
> > warning:
> > 
> >   arch/arm64/boot/dts/freescale/imx8mq-evk.dt.yaml: gpio@30240000: 'wl-reg-on' does not match any of the regexes: 'pinctrl-[0-9]+'
> >     From schema: Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> 
> The below change isn't going to fix 'wl-reg-on'?

Never mind, saw you changed it.

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
