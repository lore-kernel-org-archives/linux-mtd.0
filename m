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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4906C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:12:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E0D660BD3
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E0D660BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdpCus/+8I6CLh37Dq9eCwKY0J/HOCi+NY4NwxEpvz0=; b=MolQqYI/ME3jfh
	y7a/Q/ebZGtqPbDaSoe3bI3KVDzrB/wQtjpgc5VD8xiPQqmdakZh06E6OTxacKMktQVsZKLtM1ZoF
	VMiBciajNMCj76YyZKsC8eCFklvh3HItCYUoAgaij8lLjmSm3jMMtiGLqNbVwDwmvc6zFeYVLhiLm
	Uu1EGLnI/9d+Zf8YWirw7i8e+RCaekU4pOuLnLrqzVVyCgwcIxkaeKm364HPurmWUbXriciPctYZq
	XW/IdyYrL51OBdf8/S/E33y37ZSPZUHGPkMOCjZEoVo4/vf8crgwpyMWTmJ/AzIHgog9rDPcU7XNv
	VGedIHOLD7vKvX1otfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFoaL-000nWc-CF; Tue, 17 Aug 2021 02:12:13 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnw1-000gzU-Q2
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:38 +0000
Received: by mail-lf1-x12a.google.com with SMTP id u22so7023162lfq.13
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6lLAJV89hQcPlyDX5yfRwTHcihc/r1AqZv/5pRsMLxM=;
 b=nwrGyMxr7TkokoAbKrZt8dmendcbwZ/KglOYAoBtkklp0BVOYjBE6OPrXf8u2d0QSs
 JYJkalIYEYZY+URP5BFOM3PuBRhSKyvy8KCdC/rx8InfIY2vyXdT7bnsx67YVsK3yyDk
 TkFSDgeuVXYwWRPVubotA6I+kOxT5++AJriWNKLk5qzlP67E32aPtTnhVVg7sPhLoFDq
 F4wGo4eWbDPCAQY0oBCeUh2eY1FGe1yC6o5DeAI/SL7hvqLmmnRTITxwj3pV7KwsBons
 EzwYyNAwszjKMGVw+qrqW2pmosbwgrw1V5vmLfVDZeczzI3UsacNhxC+Ilhf6fIDM6QR
 GHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6lLAJV89hQcPlyDX5yfRwTHcihc/r1AqZv/5pRsMLxM=;
 b=sP2EMBJNc1eqhgR+Usau/iSd4AsNj0/j1iN5O5w5GpgPR0oPYKLdkuDOGcTqBU7qJA
 mF8RJlUJO5CXM7b3Nyxg14LvTlisIOvnbeOPpClvPw/joxOjUqZZIH/P+hxk23wlMBPc
 bIDLYB7nNHk//A2fgl9QdpDNRpbqwuNoljLxBo2kQfpY+CixxCmrcN1sTX3TaIULcmIs
 LNTZ5k+1rcjoz0qQ8nqKk0dz+bDt1ccfqv4EUOHVbSJwKqjlZ+O0jnOrC415PiZSxQOQ
 bczowzO9SqeKQKrqX7/LYpao8aAr83eGvtawN8EZVb9EYyktiEn6JTElVvDb0KszCnUT
 G0DQ==
X-Gm-Message-State: AOAM530IaleWD8fvFn0Bd4kDlZLfFLQv3kU6dkET1aSS9gNDPspNkSfZ
 B31CXXy3MFw+AfJ9e1e3ZYc=
X-Google-Smtp-Source: ABdhPJysm3N4gOhYNuFKEDPKN7Uh+i4G/iAeuT5GxXfDxPml3wY50JIEVz90Yl1goWbq9lgObhlGSQ==
X-Received: by 2002:ac2:596b:: with SMTP id h11mr492625lfp.558.1629163832433; 
 Mon, 16 Aug 2021 18:30:32 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:32 -0700 (PDT)
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
Subject: [PATCH v8 26/34] soc/tegra: fuse: Add OPP support
Date: Tue, 17 Aug 2021 04:27:46 +0300
Message-Id: <20210817012754.8710-27-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183033_921718_FB184E79 
X-CRM114-Status: GOOD (  15.31  )
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

Initialize and sync FUSE OPP to set up SoC core voltage vote needed by
FUSE hardware.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index f2151815db58..d1b66cd9339d 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
@@ -213,6 +214,10 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	err = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (err)
+		goto restore;
+
 	if (fuse->soc->probe) {
 		err = fuse->soc->probe(fuse);
 		if (err < 0)
@@ -259,6 +264,12 @@ static int __maybe_unused tegra_fuse_runtime_resume(struct device *dev)
 {
 	int err;
 
+	err = dev_pm_opp_sync(dev);
+	if (err) {
+		dev_err(dev, "failed to sync OPP: %d\n", err);
+		return err;
+	}
+
 	err = clk_prepare_enable(fuse->clk);
 	if (err < 0) {
 		dev_err(dev, "failed to enable FUSE clock: %d\n", err);
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
