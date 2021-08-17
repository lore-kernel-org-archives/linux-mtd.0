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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37D7C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:56:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D9A660EBD
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D9A660EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEzEx4NTYm29FmT9SbGsdW7qA/FvsbNQwdSizBqanME=; b=Y02hClKRCeahzM
	DP93B92aaZupfQcX9kkJlpfaQFOtw9z5jDc3ym/3dGxHHAC97WZDw1Bs+nLVrHOvmmozNy5cKffbF
	YpMoigWYuTzKBhl1pEvnp3Z6F1MEFyAbYFd5p88k8jP4O09EFxXQ5aIVm1y6iKpaA3K+uTXGaC2IM
	2+9utD4/eESxgHzS5PJR81+dHpo1oWSx58NfRZsakpohqVc1hk8wOc3kCPOEvWW4ZNvPx1PSNzYgq
	tgZMnUrsJe62zAz5+kFq1jQ++qkcOOUKeZ5ZCpXq3hFQtvzjRwad5J4Auy1yIGO9Vchmvgdfjlbsx
	SUAClNgyHnz3UCIdWylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFpG6-000sKg-88; Tue, 17 Aug 2021 02:55:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFoLC-000lKJ-Pe
 for linux-mtd@bombadil.infradead.org; Tue, 17 Aug 2021 01:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=pQDzXZvRDUZkLv5x3ImTMmoCkegW1/kgvrYOEYJcZ1E=; b=fX8+2mqMvNkqKi7/kyd5EGdAym
 X3R8OZQINhl4S8qZzlPektc4gkvGEib2OA7wsAAcIY3Bb83pDF5ct0ks3BYNlWhiOa09ItRlruCBu
 x6iX8Dmw/fx7t1fpNav3ddNGLN8qzmgf2/5inGU96j6Po2/Ca7h4rH0E5NCSYGCl/xcSgA+cNWZpA
 saDD9EXurUkYNp0WORo0S23eVrXyR3npFXnWVIfg6eMjRBNBJf17dAjlLw8v6BoKhedY1BNLvUeTi
 NcM0VhPPgarJrOGKX3LxxlZJ0OlA2SjTDroWC8N73Pf0rCvJDb/EkQLFDyUJoFJT//iWZosGsf38y
 v/BXT3DQ==;
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnw3-00AK1d-3c
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:37 +0000
Received: by mail-lj1-x231.google.com with SMTP id x7so30212643ljn.10
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pQDzXZvRDUZkLv5x3ImTMmoCkegW1/kgvrYOEYJcZ1E=;
 b=WnkqPT38iEK+LI2pegQ5CAgZHbUA+4T1HBF1Robs64xHzd2RVVDQL5P2Th1DUqHQmg
 Bmip5c85v20usxU6l+F6TNpm0oydiIVHub5elxPj9ebjhuRxMMJKJhh1mnjJkJBfCPui
 t3RNY/nUebYwUEneR0f3mwbtZtB/CmmkPR03QqeUewR3IvqyyyMRHZHKTwRUPOGUnQQw
 FHGyQFw5JabzhE6WPtOkrekSYjBvD/veH3cIzof6CzoYj45MQmTsKOpvWSA2fZSY8GmA
 YlKTz9SZ2ABu0XLhuo4N3qRhp1fuwUr3pubXVtg1Z2vckegbLZrvE43sBkYZzT4kyasO
 fJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pQDzXZvRDUZkLv5x3ImTMmoCkegW1/kgvrYOEYJcZ1E=;
 b=aPOoN05ZtzRkMscoeN3LPCnscLkrNctNYGqTJiRoXgnFo5/YgD0KPeK0dzDDat/T3/
 40N3a14FQ8PrJgESCi6B2Kbx+49BE4BQgaFXxd3JVAOuo7vet8Uiv2H3MOVuOJ0GJrWf
 8u96HT8o9i7guezd2/JMgWpmnDo1G1IoM0umGbzIDBQkoe46Ztv8q0YJ5TBeqVUtgsAp
 Y109AEbZGfYcrH7cz+pgKY+qgxTYiRMeCi688quXY3sagc1ilmClCSWyI0tjFRPNCF7V
 rtc0N25ImWAKJTkXFmksqixv52sNhHMICNnusYmZ7Vb2y+zTPe6CdRgP8QHKE4uINDD6
 3s/Q==
X-Gm-Message-State: AOAM533xkhHIoWlpQL9KIjp72sbNqerdvVYULXWyzt2w2vnwN7sDp9m4
 BexfTFHD2skvMRry+wpc8M0=
X-Google-Smtp-Source: ABdhPJxafgNSwgi9onfKPo0+LX8+L56eoUxCQoUliGfkte3CyYpPj4Ux16SZvsFjT/VXs0Ws0bfVww==
X-Received: by 2002:a05:651c:1144:: with SMTP id
 h4mr847720ljo.396.1629163833587; 
 Mon, 16 Aug 2021 18:30:33 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:33 -0700 (PDT)
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
Subject: [PATCH v8 27/34] soc/tegra: fuse: Reset hardware
Date: Tue, 17 Aug 2021 04:27:47 +0300
Message-Id: <20210817012754.8710-28-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_023035_496564_A45BB846 
X-CRM114-Status: GOOD (  18.73  )
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

The FUSE controller is enabled at a boot time. Reset it in order to put
hardware and clock into clean and disabled state.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 25 +++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h       |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index d1b66cd9339d..0c2723c2822f 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 
@@ -248,6 +249,30 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 		goto restore;
 	}
 
+	fuse->rst = devm_reset_control_get_optional(&pdev->dev, "fuse");
+	if (IS_ERR(fuse->rst)) {
+		err = PTR_ERR(fuse->rst);
+		dev_err(&pdev->dev, "failed to get FUSE reset: %pe\n",
+			fuse->rst);
+		goto restore;
+	}
+
+	/*
+	 * FUSE clock is enabled at a boot time, hence this resume/suspend
+	 * disables the clock besides the h/w resetting.
+	 */
+	err = pm_runtime_resume_and_get(&pdev->dev);
+	if (err)
+		goto restore;
+
+	err = reset_control_reset(fuse->rst);
+	pm_runtime_put(&pdev->dev);
+
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to reset FUSE: %d\n", err);
+		goto restore;
+	}
+
 	/* release the early I/O memory mapping */
 	iounmap(base);
 
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index de58feba0435..1b719d85bd04 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -43,6 +43,7 @@ struct tegra_fuse {
 	void __iomem *base;
 	phys_addr_t phys;
 	struct clk *clk;
+	struct reset_control *rst;
 
 	u32 (*read_early)(struct tegra_fuse *fuse, unsigned int offset);
 	u32 (*read)(struct tegra_fuse *fuse, unsigned int offset);
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
