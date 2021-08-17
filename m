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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F45C43214
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E46C60241
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E46C60241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5rpJYR/+BPXvZYZzZ5Zk9qc6o+shghr4eLdPfUb5Ao=; b=WhqOP6gwElvAzM
	rwh/2TNbMLiv6QQOst3pyD1GlfkOs2Sw7ldbJcHyjhITGAzJ8dZzad8/jn0abpiCV8j/IDvNcmlEc
	K1/fkYMPKhKEIgekAfak0cEFkcWSChCnSrvHgmWGt4/wqDDhUQpOlCGmNGrgXnTDIEYgkVapUdAr0
	ljNrnTJqW6nwRyaBIf4ywITU/I282dvayt5QmkPI/6DWUJCif8ZF1YcaqnarZVD8OBvDB3AZyd9gw
	XYuYCQTArUm+KuY4Ij7zOvQJvegiqg7mWUW+alVGqzjqHEoFAMX4AGOyJmK4IU5jOojwN22Obl3C4
	ZC067j2f56QFyL4perUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnwI-000hAF-LY; Tue, 17 Aug 2021 01:30:50 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnva-000gcI-C2
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:07 +0000
Received: by mail-lj1-x234.google.com with SMTP id i28so8906107ljm.7
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
 b=hNWZ3lDQBB9G0NfTmCUH5K27tkGRQQ+XAmdCjgXsoLk44TVXnSV0rZZArfsM7BjMNQ
 NzXAqYUV8bprqa1tDC9g84EyQd3o8jniWwkMjyQMMuqUkUkg6juIVGYjyUCbChTFmc7C
 Y9kAvvDPB9tH2tyarHnY6QH7UIi/z4zffPnrrS03ZW5T6FXyCYoeQLuQKPtpL84Si2yR
 MkQ+LN020YkVrk5A8hxNQQXfqHQiqTAV1n8zak/R17pXJIG49Dyerbvv/lIRePo4u9Cy
 r4NoX8Q2wawaT0cFfMSzhTg/VWuRq5m8tSgtaZnX2c9Uv2OXGulLsD2BxcAnqIFKNTgY
 /46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
 b=b4RB8AUljKnTeFcMwgtNpeYd1trMQMFt7NQHuI16fz/noROsOFQ8K7mO73GE3kbiOU
 mSnYj5So0nUZqBfiY6J3KfyRqhYiBkGcSSz8o43eZS8AYI0607GxszTX41JwTc5d6oco
 BKluvMhz2ihUl2pm33rNPqirlv5vZC/WI67MLypgTJ8J+4O4e/C09csYXvzeOVL/HnAT
 a8fQAxbcgYU3+GXFcnbepdj2cax66Q4ouVogup3SHYbevbzBOtB5NNWD6PtxpLGe/5ji
 rjHcsikxeamEoSjMK5Q1Mo0FUeJv6XE0TBev4zxhdkorRPow/1B+WqEgVJJxJ3BFRH4c
 JnJw==
X-Gm-Message-State: AOAM533snR2gd701HZ9NRX98iZ3bs3slSqkEHMJYrZEBnQ7jpWrG0LGG
 KlGNFF9D7KWCUc15SPgofl8=
X-Google-Smtp-Source: ABdhPJw/eckx03zVOJf2hmuiHkhQYzKLMML9PEB8kcVT0ZNZolUJSB9HB3aBM4EeNCzEcW2W6988dw==
X-Received: by 2002:a2e:9e04:: with SMTP id e4mr832311ljk.431.1629163805018;
 Mon, 16 Aug 2021 18:30:05 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:04 -0700 (PDT)
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
Subject: [PATCH v8 03/34] soc/tegra: Don't print error message when OPPs not
 available
Date: Tue, 17 Aug 2021 04:27:23 +0300
Message-Id: <20210817012754.8710-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183006_459998_BDE1B074 
X-CRM114-Status: GOOD (  15.89  )
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

Previously we assumed that devm_tegra_core_dev_init_opp_table() will
be used only by drivers that will always have device with OPP table,
but this is not true anymore. For example now Tegra30 will have OPP table
for PWM, but Tegra20 not and both use the same driver. Hence let's not
print the error message about missing OPP table in the common helper,
we can print it elsewhere.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index cd33e99249c3..a42d4f98c078 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -111,9 +111,7 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 	 */
 	err = devm_pm_opp_of_add_table(dev);
 	if (err) {
-		if (err == -ENODEV)
-			dev_err_once(dev, "OPP table not found, please update device-tree\n");
-		else
+		if (err != -ENODEV)
 			dev_err(dev, "failed to add OPP table: %d\n", err);
 
 		return err;
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
