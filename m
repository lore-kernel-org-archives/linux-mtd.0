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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E925C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:31:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F266A60E09
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F266A60E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7I/dHO6D8dYanpsZ3E/8NpQdWPFSS5BssNrWClWdmuA=; b=Q6EYglXB5jf/WG
	602hkI1r8lqUXK8dU2OSXQflVB0nPhEsDiKThg3/MjTTfwX80//M2EuvFIFOFY6phyhGOssaM3lur
	wOPm3I0IxU7vJYlNoa20+S/BmWUpLTg950fe9VY0HB2LxMRYHH12W2Rk/UAHzfft2SSDnlHpyl1Q8
	48wUpM90ilL6xgAcqYgRIDPOr3v+0NpQApsaHvc/zdQAX5j5mtSo0n1DPkpJdNoKPiT++t9v09Z0p
	9UJVVZegasKfMyK4L7R6wI7aTLX2HXYxagWb5bz7w3IS7mNMMKA3ZS6DpEh5gENZi6R2+wVSU2SX3
	HQYLasrEKQFTejif6Usg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnwg-000hKz-P1; Tue, 17 Aug 2021 01:31:14 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvb-000gd7-Jm
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:08 +0000
Received: by mail-lj1-x22a.google.com with SMTP id h17so30145632ljh.13
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wojn7XneOlcjLQTZlMLpcmbGjIOEPaqexo+f2WGyphI=;
 b=Xq17kIc6GM80MD2xhnYjU7c3bLn4H5tuMTvcdBwNy9/g5psmoz3S1gVRRgj0w10xku
 S/OHY+MF1OPdTYbYPPJFPFeY4WU63WLX4lpEqf+XHRBxzSyKtJkRoLEZsNrLQUD3aJsJ
 hyYwTr0Z48Wws5sZA3cunYGug92vOCdPP0286zyvF+xLx0QRLRMNonrX8WWxK9M03w18
 x2KNq+2YuwXI/DgRg4TCi8S5zBrr/YRsvFRqgRHtf1EkBhMZn+P2C2QCgMgcjYbkv0RV
 MYPdW+7zuuviGgSMO06r+pSAqvsVA5K8VmFJ2RBZodvpwXKzfElGK+ZIvdNgJ/4RFBSg
 0SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wojn7XneOlcjLQTZlMLpcmbGjIOEPaqexo+f2WGyphI=;
 b=AweSwIvFpUlQFKTRAkh2z7jLGOGB+db4i5ebOb3ZPwXh8E3DwhBgyBWgdKYz6DNK6c
 X6GI0bSl8x5RAC9UCXIXmw+cxslPh8yb6raPQPseIkrRYW99Flz6tXXk/PBqREkpLju7
 u4ixMyIGMmj+VbXJzg540W3LKoI1/BvfbN+B+Bcvj2+56UUsGgLPCVRBkb0+5d2PSEXr
 y08MpGinHEgpL9ZkZC7TkHIE21Yewbr1VcTZt2UiQ6ZAVHliqx2cghs0fserf7w1kFLS
 mgqKymzEvN92qaAhi/rBl6uweRASOFHbW58gHluINMuK5OUTHpVDQZJLYWVGI18TS6CJ
 1p3Q==
X-Gm-Message-State: AOAM5333nxi1EoZcPEeJntN3CX4cMq6gbQ6iF9Qf20hHauchV20Ynlu3
 Xs4rkTvhWxPabUiw8HOoF1c=
X-Google-Smtp-Source: ABdhPJzrAiKknpayvUXn0AhIlpxoa1tdB8UGRkYEeNvPAIQMKmclxsnV8VxQdGuN29ZUiGnqlWbG1A==
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr848215ljl.23.1629163806184;
 Mon, 16 Aug 2021 18:30:06 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:05 -0700 (PDT)
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
Subject: [PATCH v8 04/34] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table_simple()
Date: Tue, 17 Aug 2021 04:27:24 +0300
Message-Id: <20210817012754.8710-5-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183007_670769_64CA6CC0 
X-CRM114-Status: GOOD (  14.84  )
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

Only couple drivers need to get the -ENODEV error code and explicitly
initialize the performance state. Add new helper that allows to avoid
the extra boilerplate code in majority of drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/soc/tegra/common.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index af41ad80ec21..265ad90e45a2 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -39,4 +39,17 @@ devm_tegra_core_dev_init_opp_table(struct device *dev,
 }
 #endif
 
+static inline int
+devm_tegra_core_dev_init_opp_table_simple(struct device *dev)
+{
+	struct tegra_core_opp_params params = {};
+	int err;
+
+	err = devm_tegra_core_dev_init_opp_table(dev, &params);
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
