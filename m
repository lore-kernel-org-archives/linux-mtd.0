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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5750C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:15:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68E6B61056
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68E6B61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cogh81H2b4OsRMTifv2aT94IjKl8Ahe7Y4oA5ZYUfb8=; b=CFi4+PBW7ET4qt
	VUikooJkAXGfGNTyNqtHawfiibcjcOYyHuOvWEgxRftVSRzaV+6bh5tkbFXl+wJmnUe0A/dMP7qnE
	QJr7Kn6ReXkqpvLI8vHBAeu0Tru5NHAPdKd/zKgHrcIpDX0PGupQnL5UcJnFYTEA7u0UJguw3W6ue
	8j3XDZAl56WONRDVBkwE83uotYmUmzT47w+Ju1EkV217zxWT0lMbfJXIe7iAqx9Onr/IXtH0Qnu0J
	kkneadORVMTXRY4rS9GFwLMjzShQ5X4s1gkM0/uKEoxhR7HU/Leh3Wy/PiAdxwtS+MERLbXyhgfox
	euAbZ+nMRFHKESWmP9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPVsA-00H8na-Ea; Sun, 12 Sep 2021 20:14:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVnb-00H6YJ-MB
 for linux-mtd@bombadil.infradead.org; Sun, 12 Sep 2021 20:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1AOM2RfjwsrGWR/uPrYeS/Sf+AYl6Sxk5Zgv7MiC4jY=; b=WtzJKjkxVgQP2jCdZKJ2vjrDDR
 v1JhBMP3p1tK+kLMcyEgDazLeFleGsD22c45Mv6haZC6CTupTgNPoAhcU6w2JnLuSqOpWQ9zMVleX
 ZLgN8JAX7CU2HBp42HtbX2+cN3JQ+VuIqzJcKcJhuCKIiMh4OF+dQ6X11drpnFRZWultMUx/SuyJ5
 idr/sxYXrIRHm0vlqUuQsYTg0UFLdXjXB56M/zoqeQ4+gssHsSGQrbS+m+HRBU46Hk2F/d3ml2xs9
 dL8THBRp9u3sfX5r5NmgXTjPdREXF/hQIzQOsK62dneDWK2nqO0Dvhi15nhIT6YzS3ABM+WHmQwfu
 JgUNMsgw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVnY-002fda-9N
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:09:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id y132so5131207wmc.1
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1AOM2RfjwsrGWR/uPrYeS/Sf+AYl6Sxk5Zgv7MiC4jY=;
 b=Dq3P3RRgJcqhcBh5BG9KO6CwsVH0mrKQnWOGCvOT4T1EFxj1AAlWyrHItGMz3hadTC
 lwz6mX2UdEXVMPLyyEUpCx8CRfbN0DQ+byj4Sy0rmHY3whnxhPMXVI5prvpxA2YWNsZ2
 KkNXQhfT+Vd5SjTt8wehgzX4wSdNOrqfP1m5rqm/xZ6b+7b25rvaalgv8G8myN2HCB4F
 jZslbkJsNeOWiy8sk/nT4Y7T3XGE1SzHXOgvlL0RWEDSdpwv5l4zveiR9pMXBCaiRLhR
 X1ulXY03uY6Qk36KfGgg9hK5mFE1ACgns2v7NgdU6Nk566CAx+Ldnf37dN3/n/nFsrdO
 LwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1AOM2RfjwsrGWR/uPrYeS/Sf+AYl6Sxk5Zgv7MiC4jY=;
 b=7T8JAV21tYCDT7M82xV+MjdoA2Xz/9ujy97RCfoQhlQm08lNn2FtNfEOlnYILd4zcw
 i7FY3mN0c9zcLBToer7xqqlVJ9Ks4yRbPmHEJ8IaTlnyWhReJomfpj5ZtQnqApbIteYs
 Pfzc3cOxIcrlhSm0SD/wcvkpO9FkdO2ZeO0JuMFDeuabDybrHRjYrnWOH/GbCPxgspPI
 dw6eobkBbKx52B3A+d0rkVTAiAQsNDDJzGGZXVu3uaSKVPu7KQ0+Sr0eaT1W6KUxrqXD
 ctRDswCe/3OIryB5IwChpPixj1SB3X1rdoYBS/IXqBrg6Bgs8GqEtS4A2IA6Ea/TXLH9
 4DJQ==
X-Gm-Message-State: AOAM531bCpZgcw+XdftrK4KizXg6mIKnOyCydkbWn2Tg6s49v2/HjGes
 2781tnkUMznu9NfO2vyhKPE=
X-Google-Smtp-Source: ABdhPJxw34GNDCRDT8MU7zKTgdsV2n63kBh9Hmu14z0qokFeoDFjF2GQ8OyM2QjooyQFpIy1D/5WBw==
X-Received: by 2002:a1c:7208:: with SMTP id n8mr7712537wmc.7.1631477392315;
 Sun, 12 Sep 2021 13:09:52 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:09:52 -0700 (PDT)
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
Subject: [PATCH v11 08/34] dt-bindings: host1x: Document Memory Client resets
 of Host1x, GR2D and GR3D
Date: Sun, 12 Sep 2021 23:08:06 +0300
Message-Id: <20210912200832.12312-9-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_210956_410491_2A0DD169 
X-CRM114-Status: GOOD (  12.25  )
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

Memory Client should be blocked before hardware reset is asserted in order
to prevent memory corruption and hanging of memory controller.

Document Memory Client resets of Host1x, GR2D and GR3D hardware units.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 62861a8fb5c6..e61999ce54e9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -19,6 +19,7 @@ Required properties:
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
   - host1x
+  - mc
 
 Optional properties:
 - operating-points-v2: See ../bindings/opp/opp.txt for details.
@@ -198,6 +199,7 @@ of the following host1x client modules:
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
     - 2d
+    - mc
 
   Optional properties:
   - interconnects: Must contain entry for the GR2D memory clients.
@@ -224,6 +226,8 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - 3d
     - 3d2 (Only required on SoCs with two 3D clocks)
+    - mc
+    - mc2 (Only required on SoCs with two 3D clocks)
 
   Optional properties:
   - interconnects: Must contain entry for the GR3D memory clients.
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
