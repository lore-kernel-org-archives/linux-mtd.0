Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B142C4320A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:30:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DEC460F39
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DEC460F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spgFWmTW8hgWl7unuNS0jKeduMD5ys9aRtqlDFLaQFU=; b=tt1wtCE5Nzucby
	d7OZZApctslWa/TDCnB0tQ3abq+b6FMizSAhXjyqZm1HvWHqNCQ9AJ65eJ80H7zWizhZzQz/DreSV
	Hs07cv0Pu6i8HwOP4U0bodAb0fEwZlZS3Nvc1uDnWhyQ6PdBwTll9avPKpEQoqZoK9AN48uKS8knr
	naQBerlHmDFAo0kEx+vxgP3CWBE7evfQ3bTNf3k1URSndoIYrTTr74jbdFBRthK9pAcILe8k8oaKS
	PwfIkp7ByUoc82oUUEQ/d+8KwIiSu3P/xhDnvQnJraRgJBGI3spnPTDGv19hw2TP+CETIzzQxDpqF
	m0aD7aJmFSaZG1aAFsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnvd-000gf1-Ex; Tue, 17 Aug 2021 01:30:09 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvY-000gbK-PW
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:07 +0000
Received: by mail-lf1-x12a.google.com with SMTP id x27so38183854lfu.5
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+pDcrHtMJ3BfM+Az9yuVk7KyrEv5IezDZ4vndEOIZrQ=;
 b=c9mljDf/eNFjDgKd6lAZRYU+Sl1mj936K1QRTM3iyE/zX+e1BIkLLGB1mhFhPd7+Hk
 8PBHlZQE8QArWVeAYo7CCeEbj4E66qlF+JBkg67KAn3/wsCvbkgsJaw8cnHWtq39A7eV
 HmXwu53voVpa0MDeaC/fb+egJU5IhrqsVyTyb8G6ozaHw1HwnJsnoFGc+uQWUEAwQLoZ
 YIBRd6jE7RyINAErjUcu6PUE/1TbZf7eyhrk2BonebVjXj1+vdhtVN/V+UGaLX20DoOX
 k8OjjSU0YfqFyxkx8+FXwuY/clS/n4p8C1hTF6UEWhznMJm5iDlV+IXuGsE6dZZWvRV4
 d/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+pDcrHtMJ3BfM+Az9yuVk7KyrEv5IezDZ4vndEOIZrQ=;
 b=T2SgNWhyYgEoQImt7Ae7dc1NLOOFqOJgnVj07Mc42YmDx7/J7xIg+BEB7dEFz1gEoO
 VST7b5ogFTRnBefIHTCKZm0PrSIflIe7rB7cJoK4bz1D35mbppyd32nUKzyj4gAq0ScK
 flP267bwhoIBPUzfSSdN2wT0B0A9znH9h+9QURo1jEV3FbQJ5UCzla5KWBl1rbEiHxDA
 vIWzb8VqxRkjZyw9zrrxn7yIRHQGAiu22BHm3RLOYAJxaF/5754vW8W5+T4pWBN8S7yV
 jI/HHfJWLiv1lUHNGSg9u+JXIx6N8Q93TCFC58jQXWMxwVsc+U6E2LITOnNa0QAHJI65
 OY7g==
X-Gm-Message-State: AOAM530Vybg+mn4mbaFmVQ/mP6eReq7VIQXIVPmSrW9eaqchHCUkivLU
 XkfMBti/6GuYDKnYv6foihg=
X-Google-Smtp-Source: ABdhPJwz8UxSZOvdKUaNwcA+R7lsn7NPPjiIZX4N0ocLITK1s9++oNokkLZ+Jivbj0hSPfrQgeVN+Q==
X-Received: by 2002:ac2:428a:: with SMTP id m10mr514380lfh.636.1629163802638; 
 Mon, 16 Aug 2021 18:30:02 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:02 -0700 (PDT)
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
Subject: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Date: Tue, 17 Aug 2021 04:27:21 +0300
Message-Id: <20210817012754.8710-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183004_856800_F17D7F11 
X-CRM114-Status: GOOD (  17.76  )
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

Add dev_pm_opp_sync() helper which syncs OPP table with hardware state
and vice versa.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c     | 42 +++++++++++++++++++++++++++++++++++++++---
 include/linux/pm_opp.h |  6 ++++++
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 5543c54dacc5..18016e49605f 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -939,7 +939,8 @@ static int _set_required_opps(struct device *dev,
 	return ret;
 }
 
-static void _find_current_opp(struct device *dev, struct opp_table *opp_table)
+static struct dev_pm_opp *
+_find_current_opp(struct device *dev, struct opp_table *opp_table)
 {
 	struct dev_pm_opp *opp = ERR_PTR(-ENODEV);
 	unsigned long freq;
@@ -961,7 +962,7 @@ static void _find_current_opp(struct device *dev, struct opp_table *opp_table)
 		mutex_unlock(&opp_table->lock);
 	}
 
-	opp_table->current_opp = opp;
+	return opp;
 }
 
 static int _disable_opp_table(struct device *dev, struct opp_table *opp_table)
@@ -1003,7 +1004,7 @@ static int _set_opp(struct device *dev, struct opp_table *opp_table,
 
 	/* Find the currently set OPP if we don't know already */
 	if (unlikely(!opp_table->current_opp))
-		_find_current_opp(dev, opp_table);
+		opp_table->current_opp = _find_current_opp(dev, opp_table);
 
 	old_opp = opp_table->current_opp;
 
@@ -2931,3 +2932,38 @@ int dev_pm_opp_sync_regulators(struct device *dev)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_sync_regulators);
+
+/**
+ * dev_pm_opp_sync() - Sync OPP state
+ * @dev:	device for which we do this operation
+ *
+ * Initialize OPP table accordingly to current clock rate or
+ * first available OPP if clock not available for this device.
+ *
+ * Return: 0 on success or a negative error value.
+ */
+int dev_pm_opp_sync(struct device *dev)
+{
+	struct opp_table *opp_table;
+	struct dev_pm_opp *opp;
+	int ret = 0;
+
+	/* Device may not have OPP table */
+	opp_table = _find_opp_table(dev);
+	if (IS_ERR(opp_table))
+		return 0;
+
+	if (!_get_opp_count(opp_table))
+		goto put_table;
+
+	opp = _find_current_opp(dev, opp_table);
+	ret = _set_opp(dev, opp_table, opp, opp->rate);
+	dev_pm_opp_put(opp);
+
+put_table:
+	/* Drop reference taken by _find_opp_table() */
+	dev_pm_opp_put_opp_table(opp_table);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_sync);
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 84150a22fd7c..686122b59935 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -168,6 +168,7 @@ int dev_pm_opp_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask)
 void dev_pm_opp_remove_table(struct device *dev);
 void dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask);
 int dev_pm_opp_sync_regulators(struct device *dev);
+int dev_pm_opp_sync(struct device *dev);
 #else
 static inline struct opp_table *dev_pm_opp_get_opp_table(struct device *dev)
 {
@@ -434,6 +435,11 @@ static inline int dev_pm_opp_sync_regulators(struct device *dev)
 	return -EOPNOTSUPP;
 }
 
+static inline int dev_pm_opp_sync(struct device *dev)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif		/* CONFIG_PM_OPP */
 
 #if defined(CONFIG_PM_OPP) && defined(CONFIG_OF)
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
