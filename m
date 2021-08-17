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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0A2C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:25:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4670460551
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4670460551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kH4vaar2FnNT/4XhQVLakRPzVghRVWc69+ZDjRmK8wo=; b=2/9mo0Yc2yX6J3
	CdhGAoHs94Z4mM/JkY1b0VVy/njQeM8zDWAmGk1E44J8muCJu8NmVoYL67pyGQuUpvU+bpbQ3JTtA
	pD10bKpWODgzz8DwC/vEZIT10xFe2PRJLfCPX7IizHRfQIT4/gNpDocbuCgr9OyAtoHn3y3uS5vYK
	xnbDM8kc1Z0qP0dbkis7aFMz6BO7YkIPPyMl6kVPxrlJ9Grqo//6vXF1FVttQY183C7tcr/JmBApM
	825qQOwVW45GSe/fLDWTOgLR359LH7HOU5xiNp7rH0/5v+TeTOjUuhXYsaNEem59DWpTIgMj5WVwx
	tCK3sDufQRMrW3cVTXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFomt-000p0L-Qi; Tue, 17 Aug 2021 02:25:12 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnw5-000h1y-CF
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:41 +0000
Received: by mail-lj1-x22e.google.com with SMTP id n7so30328453ljq.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rnq9bkX2ixJQNv9BmFWVHuIOaPxB2jJGC7dZumDQ6+g=;
 b=OhTLO+vj1vm5lGE+851g2CFGzlzjt3nZpufwJ0JLRj5BVaJqOv5XpnZ4t6FIFykDTe
 R7eSI4+JQmpLfDJXNvkuLw20a6hVxyEOfc6fYX2JHLYC66lj/UMaHPoHD28QCWb7xsPE
 ck0QHLrINepJb4SHmmiAjfr61/w6aaL8rUWnwdaj04Gxb+CYF49kFSlCFhp+PAHjBiFv
 opz07XHUvGSevI2cEHAS1+ua6hVTgr3hXi+elnaFdC1tmCA2ewZFv2BBPNmmsu3P0OH+
 Lex80AN9h9VtBkYhMDTb94z7cxiyS9kXLrm7WgkKDh0hQquViNyco07WO4wrwg6WoGxn
 VOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rnq9bkX2ixJQNv9BmFWVHuIOaPxB2jJGC7dZumDQ6+g=;
 b=H05fhl2H7RmTQVTx1i14w+caBlnQwRutYDDp6SM/Xm16v9pvactRRd5kteIJ8gzB80
 kjqJQqZ1g5w50iadjYcFeCwGtEmDD0maGr8UXOE3LiXBnyLdm3AK+jwUKhRzLQfNTZUz
 rmmJS9DquSk8iM5R1DaLNWO3qKre+fCh25wiIMgWSgKY+lrMQmX6iVRLGCaJQ6F+53//
 W2k5oCguv3uwOOjh2QxoaduXKVqG2Of/e7KqJiHXxJDO3u21g0kpUsLEFLK8LQ/69Tfq
 8Mz74SOWrsMBtqiUDS8Q3i7jH8uqGjUf3VQPL7iGR8WOMen8cIdnZH7v1OiieaIvNpV7
 VEOw==
X-Gm-Message-State: AOAM533bLpu5FAjVaLljZuiTNeAXeBWGwbz+IoF9i7Ed38Pcz2wvi6fC
 ZJ9XTM6o+eToWpJAgQbhMs8=
X-Google-Smtp-Source: ABdhPJz00oZVpSy/+QIJGg2IFpP4EXHyPsIbmUOMC41xOAd6hpvBx6xCs96mwtqe7gvcDuDFogRMBg==
X-Received: by 2002:a2e:8191:: with SMTP id e17mr865236ljg.226.1629163835893; 
 Mon, 16 Aug 2021 18:30:35 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:35 -0700 (PDT)
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
Subject: [PATCH v8 29/34] soc/tegra: pmc: Enable core domain support for
 Tegra20 and Tegra30
Date: Tue, 17 Aug 2021 04:27:49 +0300
Message-Id: <20210817012754.8710-30-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183037_513427_12D928A9 
X-CRM114-Status: GOOD (  15.14  )
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

All device drivers got runtime PM and OPP support. Flip the core domain
support status for Tegra20 and Tegra30 SoCs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index fb8faf7b226a..caf9e72af246 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3042,7 +3042,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 }
 
 static const struct tegra_pmc_soc tegra20_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra20_powergates),
 	.powergates = tegra20_powergates,
 	.num_cpu_powergates = 0,
@@ -3103,7 +3103,7 @@ static const char * const tegra30_reset_sources[] = {
 };
 
 static const struct tegra_pmc_soc tegra30_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra30_powergates),
 	.powergates = tegra30_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra30_cpu_powergates),
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
