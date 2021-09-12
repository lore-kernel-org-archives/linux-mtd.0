Return-Path: <SRS0=3X/b=OC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A05C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:10:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6213661039
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6213661039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0MGshebNfeS/fSn4ijqEIfDpoH8XBNMZsttvjMM9cA=; b=mgXznwFXLr++VS
	dW9XoxI9etNurGVh3IxbpsGQFxiOFNZ20Zqm08EEOjaH4o53lPiCfKf5LSTZ0VMEJ4SIC4sshf+eL
	gAZwdOwyavOyHEFCyyn6dQtU6UPXGwURsr3XA+oeLXwQEil37XnrPn8DBSLin1eAZobu1cQuytzWR
	AEmOdbpRwtUAlyiSwJSwWZ8gSiJHcBHZa5AHjF2khcBpK5Vqe6h3zQ1FpwwnQeAxlojRbvBt1LIsv
	3jFdXVJ9drXgcXRcDEl+vYsU/tS6twnguaRz4y1NdOqj5/5hDrCSMcd4OKlKorJmCKEA3jrxxX0zl
	pxx/DBGUintYB6T8XLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPVnf-00H6bI-WE; Sun, 12 Sep 2021 20:10:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVnI-00H6Hq-Al
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:09:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so5151885wmq.0
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wufLMjvcV2REchuzKnLPe9Ps3w6SDfXDXOXmKrrN/u8=;
 b=Te4kM4Nr6aIqXg49I8m87guNmqFxy0h+d9DGdgHSIbewOq+nr/va99QpZbK8pzZmV3
 b398ia5KZX+0nwzSaNg/TrSJ2tNyR6apHyyN0eZcPyRoD9YmejPMsOXr9gQx7FiCCgAV
 fo8jTSfTCg57c95TqVPbZ8zN7Q945Q1ytMwbTchunpFZRz2skircdVjo6SmdIYaUk7rQ
 kViB7N5e3mAUYX/EQou5Oe0g6kKmCLCFi3FUap4vH6dHgyQk0gklPK7SRRPV+loPB7ol
 9Qkl0Ow0yyEqZMfcVTL6nf/I0yxE4PDzemIWipuzHIf8H3ViQUoVuM/aLYtUN/Rn8Rmk
 d4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wufLMjvcV2REchuzKnLPe9Ps3w6SDfXDXOXmKrrN/u8=;
 b=L8+8Ck6n7nLrRjht6Do7+JWw8lYMrSQOzluTtrb2niQyeFR21NyF55hYrZTmBsCDEu
 pi8xlL54CGZ4/SGXfWZohVmbPjzkChwi3ZSszUe/VFve/bezBVayA/tDu4pN54ofyP0E
 OS2iXArTLBEa+qweKLoxLzIRYfiVDAJrRWFTUWve0a7VhdSbVOQZ5Yu/Xsf43asbNHWJ
 QJiG1XG+sK7HB0eh9Z+6/6bdbIuYIE7kcW29Ac4MXfS2eIdOXhPslUApPJ0jv8zKodV2
 SZzirNjs4pB7ETNHkoLMQDd29b3/LE8MuvsTDR52Yas6zWfo58t5ACIglACBkGAsMBoi
 HSDw==
X-Gm-Message-State: AOAM53293o1Ah0VROPWlo6qxF2LoE65JVGpGeFYgyOPbK6twoSZpTMEi
 kHuRAXS0Vo+3fc3m71u9PJ0=
X-Google-Smtp-Source: ABdhPJwcu2cRr2OyH//+tdB0mQdhpS15h8hGhu7BuEAmhQPvEMINbwbdJ8Gf9xEVUPipv7LZGocS9A==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr8022074wmi.123.1631477375600; 
 Sun, 12 Sep 2021 13:09:35 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:09:35 -0700 (PDT)
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
Subject: [PATCH v11 01/34] opp: Change type of dev_pm_opp_attach_genpd(names)
 argument
Date: Sun, 12 Sep 2021 23:07:59 +0300
Message-Id: <20210912200832.12312-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_130940_414030_A0CD983C 
X-CRM114-Status: GOOD (  14.78  )
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

Elements of the 'names' array are not changed by the code, constify them
for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 6 +++---
 include/linux/pm_opp.h | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 04b4691a8aac..3057beabd370 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2348,12 +2348,12 @@ static void _opp_detach_genpd(struct opp_table *opp_table)
  * "required-opps" are added in DT.
  */
 struct opp_table *dev_pm_opp_attach_genpd(struct device *dev,
-		const char **names, struct device ***virt_devs)
+		const char * const *names, struct device ***virt_devs)
 {
 	struct opp_table *opp_table;
 	struct device *virt_dev;
 	int index = 0, ret = -EINVAL;
-	const char **name = names;
+	const char * const *name = names;
 
 	opp_table = _add_opp_table(dev, false);
 	if (IS_ERR(opp_table))
@@ -2457,7 +2457,7 @@ static void devm_pm_opp_detach_genpd(void *data)
  *
  * Return: 0 on success and errorno otherwise.
  */
-int devm_pm_opp_attach_genpd(struct device *dev, const char **names,
+int devm_pm_opp_attach_genpd(struct device *dev, const char * const *names,
 			     struct device ***virt_devs)
 {
 	struct opp_table *opp_table;
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index a95d6fdd20b6..879c138c7b8e 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -156,9 +156,9 @@ int devm_pm_opp_set_clkname(struct device *dev, const char *name);
 struct opp_table *dev_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
 void dev_pm_opp_unregister_set_opp_helper(struct opp_table *opp_table);
 int devm_pm_opp_register_set_opp_helper(struct device *dev, int (*set_opp)(struct dev_pm_set_opp_data *data));
-struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs);
+struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char * const *names, struct device ***virt_devs);
 void dev_pm_opp_detach_genpd(struct opp_table *opp_table);
-int devm_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs);
+int devm_pm_opp_attach_genpd(struct device *dev, const char * const *names, struct device ***virt_devs);
 struct dev_pm_opp *dev_pm_opp_xlate_required_opp(struct opp_table *src_table, struct opp_table *dst_table, struct dev_pm_opp *src_opp);
 int dev_pm_opp_xlate_performance_state(struct opp_table *src_table, struct opp_table *dst_table, unsigned int pstate);
 int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq);
@@ -376,7 +376,7 @@ static inline int devm_pm_opp_set_clkname(struct device *dev, const char *name)
 	return -EOPNOTSUPP;
 }
 
-static inline struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char **names, struct device ***virt_devs)
+static inline struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, const char * const *names, struct device ***virt_devs)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
@@ -384,7 +384,7 @@ static inline struct opp_table *dev_pm_opp_attach_genpd(struct device *dev, cons
 static inline void dev_pm_opp_detach_genpd(struct opp_table *opp_table) {}
 
 static inline int devm_pm_opp_attach_genpd(struct device *dev,
-					   const char **names,
+					   const char * const *names,
 					   struct device ***virt_devs)
 {
 	return -EOPNOTSUPP;
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
