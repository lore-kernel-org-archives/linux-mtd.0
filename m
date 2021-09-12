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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05C0C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:25:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99F6860F6D
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99F6860F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vA8N1DZA6jHY7fkX1fHI382pyMhYf27Sv/Tem/piWUk=; b=wCCVnmKpDeAisI
	ujMUKuVI2l5+RcuPJukdTEVGBVYxVPIzES1N9KAiTvDU33Yf/67ALtiB9jl0kpRFkpBSabYGX/dMh
	B02YLcKHW6QsVgInWNPdIhSgo+2uu7jl4wdiTXIQpWoYa2kK/G5WRHILI/xyIUfLWwtba15H1kTqX
	BsXT4no82AQxuoBn8vYlMk2hCSreEfsC0vWRFzGIUaTuXbMNOgUUO5uSkC5tvWhl8/EJ100O91YUl
	rzAx3PtH0Lpz462fuzzhf2d52fZIgq3ODY3fZH1Tua3T8akBFt9mqniT3CADNs+gYr36H0V4O2nJF
	22+jzd/RKNGAQ58V4Q+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPW2Q-00HAZr-S8; Sun, 12 Sep 2021 20:25:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVnl-00H6eK-5H
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:10:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so2587908wmd.5
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7l87AQCg+9YN7Ynq6M+cEyBEDSi0ioOxwMZ9EVF2Htg=;
 b=nB9cTZMGl6CjAdOD9Ws4Mi5qhbKKNpMj6XQKojq0aVH6lJbsn+PIwHwueE8ft7uEkA
 b+ssg7127SbJrBAlzwGOoePb7P4bXOAFx/jNdG14mRD4MRFCVQcJPw25+rCSx2O39I84
 dXgHPa+7owiTAeZW5BvBdDTeWIQz4eV9hsWVphrHD4uET8mkPifIX0BB84e1c69Mu8Bf
 ++6sBp/HD3oarRYm62hGlR8bNX0ynZsv3qiiu9rZ9eALuBIvwUk8A6kzi4POHOEHOtJ/
 1SrMV7Ittq6Vf3/eigNNV1a0xr/dwrbq8FWsONPxPiY4Z6lZV3iC+LirVo7XmbBtIxLE
 cSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7l87AQCg+9YN7Ynq6M+cEyBEDSi0ioOxwMZ9EVF2Htg=;
 b=Fhg0fYb7wis3w2Rl2yhtHf1R6XyV8uRFZgXtq2qemWUDHXu41vq84AqhAdeRgNbhqv
 LFZ9omDCKjsd/HKu8RQbSwt8S22vB2nEYsz99fnE5p1GV86zXlfwXx27BC5JOMESKmvX
 kwWmh547bxu61JHI7Bw2qxAGDOYDjznXGiK8waCgrlAu6Hyt+xJDKQVMrd48OYfL461P
 3f2/8sQyhS1nOisoVnNlYVi5c/VXGn5MthOOyG9UzpRj2hUV4VK5uPOPQyqZJ4Gsgq9Z
 usmRo73HoLrqIsZdddW7mNrk8Eaw5sSDcIr1W8pt9eMvV/zsjOIxyFc5GQkWycf3ahXe
 PEvQ==
X-Gm-Message-State: AOAM531fFKDcd1qfq7cMMD4g+p8YHZr83l1LKj8jxrBYrr6esgh80d07
 WCKSPpv1uPq5T/RIc3QBMpk=
X-Google-Smtp-Source: ABdhPJyDLZq1Vp3bNXgPEjVjjvWaakODfLJyAE1dEA8P1l+OfMMXmH63qqtr7IXV0blfBKR9sqmIAA==
X-Received: by 2002:a7b:ce02:: with SMTP id m2mr7919714wmc.132.1631477407551; 
 Sun, 12 Sep 2021 13:10:07 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:07 -0700 (PDT)
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
Subject: [PATCH v11 14/34] drm/tegra: gr3d: Support generic power domain and
 runtime PM
Date: Sun, 12 Sep 2021 23:08:12 +0300
Message-Id: <20210912200832.12312-15-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_131009_294609_FECDD9A8 
X-CRM114-Status: GOOD (  25.97  )
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

Add runtime power management and support generic power domains.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr3d.c | 388 ++++++++++++++++++++++++++++++-----
 1 file changed, 332 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 24442ade0da3..5879402ae55e 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -5,32 +5,47 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
 #include <soc/tegra/pmc.h>
 
 #include "drm.h"
 #include "gem.h"
 #include "gr3d.h"
 
+enum {
+	RST_MC,
+	RST_GR3D,
+	RST_MC2,
+	RST_GR3D2,
+	RST_GR3D_MAX,
+};
+
 struct gr3d_soc {
 	unsigned int version;
+	unsigned int num_clocks;
+	unsigned int num_resets;
 };
 
 struct gr3d {
 	struct tegra_drm_client client;
 	struct host1x_channel *channel;
-	struct clk *clk_secondary;
-	struct clk *clk;
-	struct reset_control *rst_secondary;
-	struct reset_control *rst;
 
 	const struct gr3d_soc *soc;
+	struct clk_bulk_data *clocks;
+	unsigned int nclocks;
+	struct reset_control_bulk_data resets[RST_GR3D_MAX];
+	unsigned int nresets;
 
 	DECLARE_BITMAP(addr_regs, GR3D_NUM_REGS);
 };
@@ -109,16 +124,24 @@ static int gr3d_open_channel(struct tegra_drm_client *client,
 			     struct tegra_drm_context *context)
 {
 	struct gr3d *gr3d = to_gr3d(client);
+	int err;
 
 	context->channel = host1x_channel_get(gr3d->channel);
 	if (!context->channel)
 		return -ENOMEM;
 
+	err = pm_runtime_resume_and_get(client->base.dev);
+	if (err) {
+		host1x_channel_put(context->channel);
+		return err;
+	}
+
 	return 0;
 }
 
 static void gr3d_close_channel(struct tegra_drm_context *context)
 {
+	pm_runtime_put_sync(context->client->base.dev);
 	host1x_channel_put(context->channel);
 }
 
@@ -155,14 +178,20 @@ static const struct tegra_drm_client_ops gr3d_ops = {
 
 static const struct gr3d_soc tegra20_gr3d_soc = {
 	.version = 0x20,
+	.num_clocks = 1,
+	.num_resets = 2,
 };
 
 static const struct gr3d_soc tegra30_gr3d_soc = {
 	.version = 0x30,
+	.num_clocks = 2,
+	.num_resets = 4,
 };
 
 static const struct gr3d_soc tegra114_gr3d_soc = {
 	.version = 0x35,
+	.num_clocks = 1,
+	.num_resets = 2,
 };
 
 static const struct of_device_id tegra_gr3d_match[] = {
@@ -278,69 +307,240 @@ static const u32 gr3d_addr_regs[] = {
 	GR3D_GLOBAL_SAMP23SURFADDR(15),
 };
 
-static int gr3d_probe(struct platform_device *pdev)
+static int gr3d_power_up_legacy_domain(struct device *dev, const char *name,
+				       unsigned int id)
 {
-	struct device_node *np = pdev->dev.of_node;
-	struct host1x_syncpt **syncpts;
-	struct gr3d *gr3d;
+	struct gr3d *gr3d = dev_get_drvdata(dev);
+	struct reset_control *reset;
+	struct clk *clk;
 	unsigned int i;
 	int err;
 
-	gr3d = devm_kzalloc(&pdev->dev, sizeof(*gr3d), GFP_KERNEL);
-	if (!gr3d)
-		return -ENOMEM;
-
-	gr3d->soc = of_device_get_match_data(&pdev->dev);
+	/*
+	 * Tegra20 device-tree doesn't specify 3d clock name and there is only
+	 * one clock for Tegra20. Tegra30+ device-trees always specified names
+	 * for the clocks.
+	 */
+	if (gr3d->nclocks == 1) {
+		if (id == TEGRA_POWERGATE_3D1)
+			return 0;
+
+		clk = gr3d->clocks[0].clk;
+	} else {
+		for (i = 0; i < gr3d->nclocks; i++) {
+			if (WARN_ON(!gr3d->clocks[i].id))
+				continue;
+
+			if (!strcmp(gr3d->clocks[i].id, name)) {
+				clk = gr3d->clocks[i].clk;
+				break;
+			}
+		}
 
-	syncpts = devm_kzalloc(&pdev->dev, sizeof(*syncpts), GFP_KERNEL);
-	if (!syncpts)
-		return -ENOMEM;
+		if (WARN_ON(i == gr3d->nclocks))
+			return -EINVAL;
+	}
 
-	gr3d->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(gr3d->clk)) {
-		dev_err(&pdev->dev, "cannot get clock\n");
-		return PTR_ERR(gr3d->clk);
+	/*
+	 * We use array of resets, which includes MC resets, and MC
+	 * reset shouldn't be asserted while hardware is gated because
+	 * MC flushing will fail for gated hardware. Hence for legacy
+	 * PD we request the individual reset separately.
+	 */
+	reset = reset_control_get_exclusive_released(dev, name);
+	if (IS_ERR(reset))
+		return PTR_ERR(reset);
+
+	err = reset_control_acquire(reset);
+	if (err) {
+		dev_err(dev, "failed to acquire %s reset: %d\n", name, err);
+	} else {
+		err = tegra_powergate_sequence_power_up(id, clk, reset);
+		reset_control_release(reset);
 	}
 
-	gr3d->rst = devm_reset_control_get(&pdev->dev, "3d");
-	if (IS_ERR(gr3d->rst)) {
-		dev_err(&pdev->dev, "cannot get reset\n");
-		return PTR_ERR(gr3d->rst);
+	reset_control_put(reset);
+	if (err)
+		return err;
+
+	/*
+	 * tegra_powergate_sequence_power_up() leaves clocks enabled
+	 * while GENPD not, hence keep clock-enable balanced.
+	 */
+	clk_disable_unprepare(clk);
+
+	return 0;
+}
+
+static void gr3d_del_link(void *link)
+{
+	device_link_del(link);
+}
+
+static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
+{
+	static const char * const opp_genpd_names[] = { "3d0", "3d1", NULL };
+	const u32 link_flags = DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME;
+	struct device **opp_virt_devs, *pd_dev;
+	struct device_link *link;
+	unsigned int i;
+	int err;
+
+	err = of_count_phandle_with_args(dev->of_node, "power-domains",
+					 "#power-domain-cells");
+	if (err < 0) {
+		if (err != -ENOENT)
+			return err;
+
+		/*
+		 * Older device-trees don't use GENPD. In this case we should
+		 * toggle power domain manually.
+		 */
+		err = gr3d_power_up_legacy_domain(dev, "3d",
+						  TEGRA_POWERGATE_3D);
+		if (err)
+			return err;
+
+		err = gr3d_power_up_legacy_domain(dev, "3d2",
+						  TEGRA_POWERGATE_3D1);
+		if (err)
+			return err;
+
+		return 0;
 	}
 
-	if (of_device_is_compatible(np, "nvidia,tegra30-gr3d")) {
-		gr3d->clk_secondary = devm_clk_get(&pdev->dev, "3d2");
-		if (IS_ERR(gr3d->clk_secondary)) {
-			dev_err(&pdev->dev, "cannot get secondary clock\n");
-			return PTR_ERR(gr3d->clk_secondary);
+	/*
+	 * The PM domain core automatically attaches a single power domain,
+	 * otherwise it skips attaching completely. We have a single domain
+	 * on Tegra20 and two domains on Tegra30+.
+	 */
+	if (dev->pm_domain)
+		return 0;
+
+	err = devm_pm_opp_attach_genpd(dev, opp_genpd_names, &opp_virt_devs);
+	if (err)
+		return err;
+
+	for (i = 0; opp_genpd_names[i]; i++) {
+		pd_dev = opp_virt_devs[i];
+		if (!pd_dev) {
+			dev_err(dev, "failed to get %s power domain\n",
+				opp_genpd_names[i]);
+			return -EINVAL;
 		}
 
-		gr3d->rst_secondary = devm_reset_control_get(&pdev->dev,
-								"3d2");
-		if (IS_ERR(gr3d->rst_secondary)) {
-			dev_err(&pdev->dev, "cannot get secondary reset\n");
-			return PTR_ERR(gr3d->rst_secondary);
+		link = device_link_add(dev, pd_dev, link_flags);
+		if (!link) {
+			dev_err(dev, "failed to link to %s\n", dev_name(pd_dev));
+			return -EINVAL;
 		}
+
+		err = devm_add_action_or_reset(dev, gr3d_del_link, link);
+		if (err)
+			return err;
 	}
 
-	err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_3D, gr3d->clk,
-						gr3d->rst);
+	return 0;
+}
+
+static int gr3d_set_opp(struct dev_pm_set_opp_data *data)
+{
+	struct gr3d *gr3d = dev_get_drvdata(data->dev);
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < gr3d->nclocks; i++) {
+		err = clk_set_rate(gr3d->clocks[i].clk, data->new_opp.rate);
+		if (err) {
+			dev_err(data->dev, "failed to set %s rate to %lu: %d\n",
+				gr3d->clocks[i].id, data->new_opp.rate, err);
+			goto restore;
+		}
+	}
+
+	return 0;
+
+restore:
+	while (i--)
+		clk_set_rate(gr3d->clocks[i].clk, data->old_opp.rate);
+
+	return err;
+}
+
+static int gr3d_get_clocks(struct device *dev, struct gr3d *gr3d)
+{
+	int err;
+
+	err = devm_clk_bulk_get_all(dev, &gr3d->clocks);
 	if (err < 0) {
-		dev_err(&pdev->dev, "failed to power up 3D unit\n");
+		dev_err(dev, "failed to get clock: %d\n", err);
 		return err;
 	}
+	gr3d->nclocks = err;
 
-	if (gr3d->clk_secondary) {
-		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_3D1,
-							gr3d->clk_secondary,
-							gr3d->rst_secondary);
-		if (err < 0) {
-			dev_err(&pdev->dev,
-				"failed to power up secondary 3D unit\n");
-			return err;
-		}
+	if (gr3d->nclocks != gr3d->soc->num_clocks) {
+		dev_err(dev, "invalid number of clocks: %u\n", gr3d->nclocks);
+		return -ENOENT;
 	}
 
+	return 0;
+}
+
+static int gr3d_get_resets(struct device *dev, struct gr3d *gr3d)
+{
+	int err;
+
+	gr3d->resets[RST_MC].id = "mc";
+	gr3d->resets[RST_MC2].id = "mc2";
+	gr3d->resets[RST_GR3D].id = "3d";
+	gr3d->resets[RST_GR3D2].id = "3d2";
+	gr3d->nresets = gr3d->soc->num_resets;
+
+	err = devm_reset_control_bulk_get_optional_exclusive_released(
+				dev, gr3d->nresets, gr3d->resets);
+	if (err) {
+		dev_err(dev, "failed to get reset: %d\n", err);
+		return err;
+	}
+
+	if (WARN_ON(!gr3d->resets[RST_GR3D].rstc) ||
+	    WARN_ON(!gr3d->resets[RST_GR3D2].rstc && gr3d->nresets == 4))
+		return -ENOENT;
+
+	return 0;
+}
+
+static int gr3d_probe(struct platform_device *pdev)
+{
+	struct host1x_syncpt **syncpts;
+	struct gr3d *gr3d;
+	unsigned int i;
+	int err;
+
+	gr3d = devm_kzalloc(&pdev->dev, sizeof(*gr3d), GFP_KERNEL);
+	if (!gr3d)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, gr3d);
+
+	gr3d->soc = of_device_get_match_data(&pdev->dev);
+
+	syncpts = devm_kzalloc(&pdev->dev, sizeof(*syncpts), GFP_KERNEL);
+	if (!syncpts)
+		return -ENOMEM;
+
+	err = gr3d_get_clocks(&pdev->dev, gr3d);
+	if (err)
+		return err;
+
+	err = gr3d_get_resets(&pdev->dev, gr3d);
+	if (err)
+		return err;
+
+	err = gr3d_init_power(&pdev->dev, gr3d);
+	if (err)
+		return err;
+
 	INIT_LIST_HEAD(&gr3d->client.base.list);
 	gr3d->client.base.ops = &gr3d_client_ops;
 	gr3d->client.base.dev = &pdev->dev;
@@ -352,20 +552,36 @@ static int gr3d_probe(struct platform_device *pdev)
 	gr3d->client.version = gr3d->soc->version;
 	gr3d->client.ops = &gr3d_ops;
 
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 200);
+
+	err = devm_pm_opp_register_set_opp_helper(&pdev->dev, gr3d_set_opp);
+	if (err)
+		goto disable_rpm;
+
+	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (err)
+		goto disable_rpm;
+
 	err = host1x_client_register(&gr3d->client.base);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
-		return err;
+		goto disable_rpm;
 	}
 
 	/* initialize address register map */
 	for (i = 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
 		set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
 
-	platform_set_drvdata(pdev, gr3d);
-
 	return 0;
+
+disable_rpm:
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return err;
 }
 
 static int gr3d_remove(struct platform_device *pdev)
@@ -380,23 +596,83 @@ static int gr3d_remove(struct platform_device *pdev)
 		return err;
 	}
 
-	if (gr3d->clk_secondary) {
-		reset_control_assert(gr3d->rst_secondary);
-		tegra_powergate_power_off(TEGRA_POWERGATE_3D1);
-		clk_disable_unprepare(gr3d->clk_secondary);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused gr3d_runtime_suspend(struct device *dev)
+{
+	struct gr3d *gr3d = dev_get_drvdata(dev);
+	int err;
+
+	host1x_channel_stop(gr3d->channel);
+
+	err = reset_control_bulk_assert(gr3d->nresets, gr3d->resets);
+	if (err) {
+		dev_err(dev, "failed to assert reset: %d\n", err);
+		return err;
+	}
+
+	usleep_range(10, 20);
+
+	/*
+	 * Older device-trees don't specify MC resets and power-gating can't
+	 * be done safely in that case. Hence we will keep the power ungated
+	 * for older DTBs. For newer DTBs, GENPD will perform the power-gating.
+	 */
+
+	clk_bulk_disable_unprepare(gr3d->nclocks, gr3d->clocks);
+	reset_control_bulk_release(gr3d->nresets, gr3d->resets);
+
+	return 0;
+}
+
+static int __maybe_unused gr3d_runtime_resume(struct device *dev)
+{
+	struct gr3d *gr3d = dev_get_drvdata(dev);
+	int err;
+
+	err = reset_control_bulk_acquire(gr3d->nresets, gr3d->resets);
+	if (err) {
+		dev_err(dev, "failed to acquire reset: %d\n", err);
+		return err;
+	}
+
+	err = clk_bulk_prepare_enable(gr3d->nclocks, gr3d->clocks);
+	if (err) {
+		dev_err(dev, "failed to enable clock: %d\n", err);
+		goto release_reset;
 	}
 
-	reset_control_assert(gr3d->rst);
-	tegra_powergate_power_off(TEGRA_POWERGATE_3D);
-	clk_disable_unprepare(gr3d->clk);
+	err = reset_control_bulk_deassert(gr3d->nresets, gr3d->resets);
+	if (err) {
+		dev_err(dev, "failed to deassert reset: %d\n", err);
+		goto disable_clk;
+	}
 
 	return 0;
+
+disable_clk:
+	clk_bulk_disable_unprepare(gr3d->nclocks, gr3d->clocks);
+release_reset:
+	reset_control_bulk_release(gr3d->nresets, gr3d->resets);
+
+	return err;
 }
 
+static const struct dev_pm_ops tegra_gr3d_pm = {
+	SET_RUNTIME_PM_OPS(gr3d_runtime_suspend, gr3d_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
 struct platform_driver tegra_gr3d_driver = {
 	.driver = {
 		.name = "tegra-gr3d",
 		.of_match_table = tegra_gr3d_match,
+		.pm = &tegra_gr3d_pm,
 	},
 	.probe = gr3d_probe,
 	.remove = gr3d_remove,
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
