Return-Path: <SRS0=3X/b=OC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBAAC43217
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:10:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E15B61221
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E15B61221
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGv6MvjzLD+Tcu/RU9l7RWWHsEaN1egkeBbUL35ULKU=; b=cTOoWP0XdQHrQV
	4YT0fuyPG3Ld3lo4rEreKmnm0D0GekKiVlDha8LxRy3XnYzuiuYUjvcpr2V9aPX41x4UFKXV+xXAA
	El3BWitrbkOQ2LJxYkr00IznnOOvIqXXje9Vi7NHOz1RPDGxSoFjU3T5ntYhymxr5sMbtKYuzV+Qx
	ayHy8oDnwDw6VrbPGGdDib4IAp5cMdcysi3i0c2wph+A+GPykyI3eZ+RWXT1KpJwKhHy1ULoIKx47
	/twYSgm8uZ0mmmzPPb6EzXxFikig1B3MUJVeReTdPoDSAiZIlYuZCtxXseFygUoa0J95jxgJtzGxd
	QQRjil2NUzLVMSFeNJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPVnN-00H6MB-Qt; Sun, 12 Sep 2021 20:09:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVnI-00H6J5-9g
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:09:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso5415277wme.4
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b3yXsdmsWJbu2CaukGByuPBPrpPUHlzf8e1vIPRsAi8=;
 b=mJdQKdvw/T1WHD6bQEjVMmBbN7DaWLQ8lzGUjo1vlIU+1gEWKCVQWRn15g/gnhI8W5
 d2pStakMymWHTlgQZEJHbhgK7eIg/4Z+gQ1F1i8DAkWUmGISTIcu5/80zCjHmEb8+e8y
 ODX+Ol6dM5QbrfOAs1Ajm/+NiMAlCsnZjSritBeeQfqYaEaZSvmlUbCmovGhHren2/dS
 tV8Fm+3jKIXee5Yg+FuL2/hKt3ljmIbae8PatNYP9JAdrpNquETwVaTVy5uDSMdwlNWd
 FZr+634a/OJXxW5Jx8TJnOhM2IWEVvUwyJg8neySduMfcuUOEaOSwCWfy9EUg59oTHhR
 2zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b3yXsdmsWJbu2CaukGByuPBPrpPUHlzf8e1vIPRsAi8=;
 b=qmLwFa/RDT7XUtt19bMRM/z6f/umiS314Dpe0xzc0dU8THypTRE5pEN1O1Jc8gayOc
 pu+8nAtYvft5QJF2LcxnPRjWgcEhOR7WDxVidQ7kfXIDFeGR8SbkrfqWKQEaCj5y3h7O
 Xp44gKf/mmLerpkviNcB9xErL/hBEw5eZ8EJjwDeec5Yssfm0Qd3yUGV3mce7UQWrDwm
 oveevtbrf5o0inT3wTqsJne3isWzDozdQyyOTdloeHbM/+Pf/XTG5PORcqHm+Z050sF3
 cOVMmkryXOtQ5LFimjeLDXWULRV7AiSOYX5GYEiqJZ5RqKU2zzO0XCpWuKxUVCqgSpfV
 xxAw==
X-Gm-Message-State: AOAM533wpxhCbMqHJu78B71tX3SJQKERi8jL+mNDehpXuQboBgnfIX92
 rTdu8iUkXo8Ntm8YJxImxVg=
X-Google-Smtp-Source: ABdhPJwk0yn5bxHilmKllDmuRSmM3W8zuYlcPQEH5ywYTDKziHKI7nEbRLuXvtmZG0hMnn6QbSlSww==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr8072480wmh.48.1631477378162; 
 Sun, 12 Sep 2021 13:09:38 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:09:37 -0700 (PDT)
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
Subject: [PATCH v11 02/34] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table_common()
Date: Sun, 12 Sep 2021 23:08:00 +0300
Message-Id: <20210912200832.12312-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_130940_383724_58809AB4 
X-CRM114-Status: GOOD (  16.44  )
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

Only couple drivers need to get the -ENODEV error code and majority of
drivers need to explicitly initialize the performance state. Add new
common helper which sets up OPP table for these drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/soc/tegra/common.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index af41ad80ec21..5b4a042f60fb 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -39,4 +39,28 @@ devm_tegra_core_dev_init_opp_table(struct device *dev,
 }
 #endif
 
+/*
+ * This function should be invoked with the enabled runtime PM of the device
+ * in order to initialize performance state properly. Most of Tegra devices
+ * are assumed to be suspended at a probe time and GENPD require RPM to be
+ * enabled to set up the rpm-resume state, otherwise device is active and
+ * performance state is applied immediately. Note that it will initialize
+ * OPP bandwidth if it's wired in a device-tree for this device, which is
+ * undesirable for a suspended device.
+ */
+static inline int
+devm_tegra_core_dev_init_opp_table_common(struct device *dev)
+{
+	struct tegra_core_opp_params opp_params = {};
+	int err;
+
+	opp_params.init_state = true;
+
+	err = devm_tegra_core_dev_init_opp_table(dev, &opp_params);
+	if (err != -ENODEV)
+		return err;
+
+	return 0;
+}
+
 #endif /* __SOC_TEGRA_COMMON_H__ */
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
