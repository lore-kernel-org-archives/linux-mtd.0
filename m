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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A853C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 21:34:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DB5D60F56
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 21:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DB5D60F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyi7vhopxd1OrKlJMqik33nuIfm24TB4d8JzwPba1Xs=; b=t6ois3T2tAWzmU
	cIyNKAeMrueSkwYpl3r+/2L07FVuCLysqXiVsja3zVYdJ7NlKNqaOVUM5qBtCWRlSmC10L1rjVRSV
	zmuhE4wrkY678UmHiDfiq4Csg7Aq7u17Qp92H91UdvER6xafQLtLsiezghvfvLGP1ecLFRlj2v92d
	ZbuW30OWqP18uTM2op1wS2CK4xEucQjdpr9pfPLD6XKenevKxO+QsOcaXmpO1rrA0VFjzvWQww9/6
	dLeeZzFCD2/OdCB1F8DFsiQOVPa/ZZP1p94jFDfzKOmYn3qDemFoLw13X4XLeKMVXJoFi+k4KDQny
	vHza7hzFSgpkDzvX0+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPX6u-00HJvZ-Fe; Sun, 12 Sep 2021 21:34:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVob-00H7Jx-9I
 for linux-mtd@bombadil.infradead.org; Sun, 12 Sep 2021 20:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eT76ZvUu/qGSCEQydcaCNX99s+R1UAGie3X1Yy7dR10=; b=YysJYODPE9Y3dr3erYN8o6EJRD
 aP2jKQ68J3f0RxTQwLnPYFUn1AOucPpff5e0ptuQBdWhGKvu6nmE19nUS8n0CTuevsNdoFdYYdtqf
 YI4Oygp7hJy4pNiPcjq/zMU5FmU5ZwvU5Z2J6b2l2WWUx3B1yjr/PxwGiqcoB0LBkH1GsJjWa4L44
 G42vMGfB30XBcNXgS9hYgxHNmPRHYpEMaFq3mq4GPwtW1QAekezRb8a9D/bAo5UXSjeazOHrehgTQ
 Gb4O4JDDX3GhJC6porsanFrpvkNE1YvM6JW76SfYKQY78SPo4xsZSNFG77MKXQqkOjlnD8ia9O7Dg
 cQNERHag==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVoY-002fiM-1p
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:10:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso5423604wmb.2
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eT76ZvUu/qGSCEQydcaCNX99s+R1UAGie3X1Yy7dR10=;
 b=M/JHpzSbQ/2wlUkwDBMgHTAmFAfUlPmri2QbZj/RUEBU4SEw/6lgfZVIqekNiEpiG+
 SNLaewsrhXM/6L2fOYs6NP4N+PojfNXz+YK720v/5Eqy5xtaXKIRXNbvJgfszd5qM9PZ
 5O64fcU4N/4PWECp7fpSTQlB4z0QOJSUppH5Vqb9Q6PjkHIRad2GOwjPpokGRnWEHafR
 YuJHYcg+zkd0lILRIc9Fjviz5rzd+VIvKxb251ipS5prIPDO8DTmrXkX2NNlgfqUiwtt
 jP59rDGMVurlkFCsuFbLtOj1tLg6Y/2DllKV9TK5LqqpsEd4s9t+wek6/kZFanhrRLgg
 JY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eT76ZvUu/qGSCEQydcaCNX99s+R1UAGie3X1Yy7dR10=;
 b=ZTAxqQpKweqlqn7rnI4qwZiKQUT78veNpkgTAYdzwYMSdA5+FZDYJxS9veBorQSwIX
 kksdSjw1YPPyeQeNOwUofAtX9SUlcXnFHys/6N229W1DzRKDvZTUSDK/fiXiTQaNIV4n
 qgnbnvEIvypOrRcF1CSPXOK6VD/JHbKuvfAyQVnSUXJQCw/w1X3reE47p8aBMziSabmj
 gxm2OC2M+s5vlS/ziczRMFkJzJQk7abChS7Jak7OHdkoudvKfVvvz5Foqe9jqJKmaVzX
 w6J1yKbSGJYo/85m1yMqhE+AzuiVKRAHg/StrFJw5aYs1kEl+897lBlTChFIfG36fkiM
 60Hg==
X-Gm-Message-State: AOAM532cZzkv6cjTK4cdnWVQTvyHz18IHYLxk+Cui/9chZJCE3dzfodF
 uxjrGIXYgxQWYj1bF91SYwBphba9N6w=
X-Google-Smtp-Source: ABdhPJwEk11/Zbt2tol7gmW6xsSAh4csGofazTfbbaJkhV9+/S8OTC9w02L3t8w+lK2Gn9dJw/P9pQ==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr7938044wmh.167.1631477456475; 
 Sun, 12 Sep 2021 13:10:56 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:56 -0700 (PDT)
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
Subject: [PATCH v11 34/34] ARM: tegra20/30: Disable unused host1x hardware
Date: Sun, 12 Sep 2021 23:08:32 +0300
Message-Id: <20210912200832.12312-35-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_211058_197000_88910EA1 
X-CRM114-Status: GOOD (  13.36  )
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

MPE, VI, EPP and ISP were never used and we don't have drivers for them.
Since these modules are enabled by default in a device-tree, a device is
created for them, blocking voltage scaling because there is no driver to
bind, and thus, state of PMC driver is never synced. Disable them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 4 ++++
 arch/arm/boot/dts/tegra30.dtsi | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 8ab77583846b..6eb13da7f91f 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -59,6 +59,7 @@ mpe@54040000 {
 			reset-names = "mpe";
 			operating-points-v2 = <&mpe_dvfs_opp_table>;
 			power-domains = <&pd_mpe>;
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -70,6 +71,7 @@ vi@54080000 {
 			reset-names = "vi";
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			power-domains = <&pd_venc>;
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -81,6 +83,7 @@ epp@540c0000 {
 			reset-names = "epp";
 			operating-points-v2 = <&epp_dvfs_opp_table>;
 			power-domains = <&pd_core>;
+			status = "disabled";
 		};
 
 		isp@54100000 {
@@ -91,6 +94,7 @@ isp@54100000 {
 			resets = <&tegra_car 23>;
 			reset-names = "isp";
 			power-domains = <&pd_venc>;
+			status = "disabled";
 		};
 
 		gr2d@54140000 {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 58ef4983e511..61f74b7879bb 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -145,6 +145,8 @@ mpe@54040000 {
 			power-domains = <&pd_mpe>;
 
 			iommus = <&mc TEGRA_SWGROUP_MPE>;
+
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -158,6 +160,8 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_VI>;
+
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -171,6 +175,8 @@ epp@540c0000 {
 			power-domains = <&pd_heg>;
 
 			iommus = <&mc TEGRA_SWGROUP_EPP>;
+
+			status = "disabled";
 		};
 
 		isp@54100000 {
@@ -183,6 +189,8 @@ isp@54100000 {
 			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_ISP>;
+
+			status = "disabled";
 		};
 
 		gr2d@54140000 {
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
