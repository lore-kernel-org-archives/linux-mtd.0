Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963CAC43216
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:32:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F6E560241
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F6E560241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESabPimUjpx5eqvB5jSgSuKUHAZF1uZiSVpXebSjSv0=; b=3rkPrKZL7g9f5P
	FTqolkZLh/+8X/UHw9gzfRIosAVHgOoZDwM7QIAHA/OdScoo8m1br95wo5y3drNEcgNGT9CYjVjRV
	wyyGuW2hG29a2PpGInEia7Wa+OUyg7GoMirNb5vHW66G1f/punM4meiAVEu8nhGE8cnYk0Ptc9f7e
	Ikk5S11gxlReQCs1Iwcy6mWY+J9lzIEq+pHZ2TaFBkbENzeJDx11MGkkcERVHRZIFImDnWypm5hP8
	u8o1Woophxhp2hlYz17F+rcEWy6XuDbXEiPy4TmH2RVjo7EXiMDLrBIqP9Yzeu9e4n0ghn7bMKmbf
	olzauge/nGqASn0xpzmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnx8-000hWA-5L; Tue, 17 Aug 2021 01:31:42 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvc-000gdv-Kf
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:10 +0000
Received: by mail-lj1-x230.google.com with SMTP id f2so8516577ljn.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=whXbmpiV9uZrIWQEZSp5RRTDQ3TFfbRun1N2tfG7MWk=;
 b=qVuy6Otl0UWSQ+/nZMjDzykD2sSUZDst3NL/JVapiLI3z3yUfsGAUcncelhMR38Lym
 1xjVPKDNQoeHSdojhaD4CNMJ2Dgxsx7ya2LEvfAdSM6jyMIhg0fAggQvAzFKMqqVOL9O
 IPbH29DcWGT56C4Udgprd2zRCBzNWyrc1+xqzNB9hh3j27fQeaGpUX2Jl9g2CjR6dsJE
 H3f4BOVlgw85yDYhZPvxDoAPPZKXld5HwD4iSdkylVBs+x8a7x/zUr2T15/KjxPp7TBo
 OcMaTgNBzyb8Gi7/p8ZpOcNZ09XNRqw/14qoRIg6z6RvIG29dGNOEq13dllv4PGdI+NN
 gRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=whXbmpiV9uZrIWQEZSp5RRTDQ3TFfbRun1N2tfG7MWk=;
 b=fR0n4+HPKUhH7rWL+Wa99qgoXFa0iBaYfNXmSAs3Srx1DrLqKOKq1gGEQK4FlSfDgd
 gHfpXgiX1guNiV43uQl+/RcXsWwnxuueO4FaYeG/bsa0iG2WA2fPD0wR4WG5tv0Q57Rp
 ETIMhNzhslCqYlClDIxADhC1POVV1Rl9sxOZlV57tA072NMeIR9GjkYURszZ0qnhgQGn
 gMwFapMRziisF1zfw3qWtOKoRoL9XmxuhNiLZk76NnfbGkB4PdeiBg0XAYFYzUuUyfDf
 jy7Y2il06hK5r61pALt8I3cPJQoFbuk3SPFE/hVJ3oTTno6biRWW42/374K5EYNRVGV0
 cYUg==
X-Gm-Message-State: AOAM532i5luFjtbkkv8/bHn/BhxjwamyOtU6pfC5CH0zxdHG65M0TiDD
 JtbMUoRDhPY2l8IkygDHLU8=
X-Google-Smtp-Source: ABdhPJx0BGOHbSZlE+uingQVCD7QPlpfvESjI/6O9+jCEZkAPokxg6m3XSjkH1CoIjJ45grVv1YxFQ==
X-Received: by 2002:a2e:5758:: with SMTP id r24mr870243ljd.432.1629163807370; 
 Mon, 16 Aug 2021 18:30:07 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:07 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v8 05/34] soc/tegra: Use dev_pm_opp_sync()
Date: Tue, 17 Aug 2021 04:27:25 +0300
Message-Id: <20210817012754.8710-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183008_741224_614AD3DF 
X-CRM114-Status: GOOD (  13.67  )
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

Use new generic dev_pm_opp_sync() helper which initializes voltage vote
based on clock rate.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 30 +-----------------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index a42d4f98c078..dab1bacb41ab 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -39,34 +39,6 @@ bool soc_is_tegra(void)
 	return match != NULL;
 }
 
-static int tegra_core_dev_init_opp_state(struct device *dev)
-{
-	unsigned long rate;
-	struct clk *clk;
-	int err;
-
-	clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(clk)) {
-		dev_err(dev, "failed to get clk: %pe\n", clk);
-		return PTR_ERR(clk);
-	}
-
-	rate = clk_get_rate(clk);
-	if (!rate) {
-		dev_err(dev, "failed to get clk rate\n");
-		return -EINVAL;
-	}
-
-	/* first dummy rate-setting initializes voltage vote */
-	err = dev_pm_opp_set_rate(dev, rate);
-	if (err) {
-		dev_err(dev, "failed to initialize OPP clock: %d\n", err);
-		return err;
-	}
-
-	return 0;
-}
-
 /**
  * devm_tegra_core_dev_init_opp_table() - initialize OPP table
  * @dev: device for which OPP table is initialized
@@ -118,7 +90,7 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 	}
 
 	if (params->init_state) {
-		err = tegra_core_dev_init_opp_state(dev);
+		err = dev_pm_opp_sync(dev);
 		if (err)
 			return err;
 	}
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
